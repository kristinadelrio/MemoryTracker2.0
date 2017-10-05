//
//  GameController.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "GameController.h"
#import "PanelControlController.h"
#import "GameMapController.h"
#import "GameLogic.h"
#import "WinnerData.h"
#import "RatingStorage.h"
#import "PauseView.h"
#import "GameOverView.h"

@implementation GameController
{
    PanelControlController *panelController;
    GameMapController *gameMapController;
    
    PauseView *pauseView;
    GameOverView *gameOver;
}

@synthesize gameMapContainer;
@synthesize timeLimit;

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    GameLogic.shared.presentScore = ^(int score) {
        [weakSelf showScore: score];
    };
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier  isEqual: @"PanelControlControllerSegue"]) {
        panelController = segue.destinationViewController;
        [self prepareControlPanelController];
        
    } else if ([segue.identifier isEqual: @"GameMapControllerSegue"]) {
        gameMapController = segue.destinationViewController;
        [self prepareGameMapController];
    }
}

- (void)prepareGameMapController {
    __weak typeof(self) weakSelf = self;
    
    gameMapController.gameOver = ^{
        [weakSelf gameOver];
    };
}

- (void)prepareControlPanelController {
    __weak typeof(self) weakSelf = self;
    panelController.onHomeTap = ^{
        [weakSelf turnToHome];
    };
    
    panelController.onPauseTap = ^(bool state) {
        [weakSelf turnOnPause: state];
    };
    
    panelController.timeOver = ^{
        [weakSelf gameOver];
    };
    
    panelController.onRestartTap = ^{
        [weakSelf replayGame];
    };
}

#pragma mark - Runtime view's management

- (void)initPauseView {
    pauseView = [[PauseView alloc]
                 initWithFrame:gameMapContainer.bounds];
    
    __weak typeof(self) weakSelf = self;
    pauseView.onPauseTap = ^{
        [weakSelf turnOffpause];
    };
}

- (void)deinitPauseView {
    [pauseView removeFromSuperview];
    pauseView = nil;
}

- (void)initGameOverView {
    gameOver = [[GameOverView alloc] initWithFrame:gameMapContainer.bounds];
    
    __weak typeof(self) weakSelf = self;
    gameOver.onReplayGame = ^{
        [weakSelf replayGame];
    };
}

- (void)deinitGameOverView {
    [gameOver removeFromSuperview];
    gameOver = nil;
}

#pragma mark - OnButtonTap action

- (void)turnOffpause {
    panelController.isPause = NO;
    [panelController changeTimerState];
    [self deinitPauseView];
}

- (void)turnOnPause:(BOOL)state {
    if (state) {
        [self initPauseView];
        [gameMapContainer addSubview:pauseView];
        [self updateFocusIfNeeded];
    }
    else {
        [self deinitPauseView];
    }
}

- (void)turnToHome {
    GameLogic.shared.score = 0;
    [self dismissViewControllerAnimated: true completion: NULL];
}

#pragma mark - Presentation block

- (void)showScore:(int)score {
    [panelController present: score];
}

- (void)replayGame {
    [self deinitGameOverView];
    [panelController stopTimer];
    panelController.scoreLabel.text = @"0";
    panelController.timeLabel.text = @"00:00";
    
    GameLogic.shared.score = 0;
    GameLogic.shared.totalScore = 0;
    GameLogic.shared.currentTime = GameLogic.shared.timeLimit;
    [gameMapController redrawScene];
    [panelController runTimer];
}

- (void)gameOver {
    [panelController stopTimer];
    [self initGameOverView];
    [gameMapContainer addSubview:gameOver];
    if (GameLogic.shared.totalScore > 0) {
        [self saveScore];
    }
}

#pragma mark - Saving score to RatingStorage block

- (void)saveScore {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save your score"
                                message:@"Input your name here"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *doneAction = [UIAlertAction
                                 actionWithTitle:@"Done"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     NSString* nickname = [alert.textFields[0] text];
                                     WinnerData* winner = [[WinnerData alloc] initWithUserName:nickname andScore:GameLogic.shared.totalScore];
                                     [RatingStorage.shared saveData:winner];
                                 }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle: @"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler: nil];
    
    [alert addAction:doneAction];
    [alert addAction:cancelAction];
    
    [alert addTextFieldWithConfigurationHandler: ^(UITextField* nicknameField) {
        nicknameField.placeholder = @"Your name is...";
        nicknameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        nicknameField.keyboardType = UIKeyboardTypeDefault;
        nicknameField.keyboardAppearance = UIKeyboardAppearanceDark;
    }];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end


