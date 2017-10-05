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

@synthesize gameMapContainer;
@synthesize timeLimit;

PanelControlController* panelController;
GameMapController* gameMapController;

PauseView* pauseView;
GameOverView* gameOver;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    GameLogic.sharedLogic.presentScore = ^(int score) {
        [weakSelf showScore: score];
    };

    gameOver.onReplayGame = ^{
        [weakSelf replayGame];
    };
    
    pauseView.onPauseTap = ^{
        [weakSelf turnOffpause];
    };
}

- (void) turnOffpause {
    panelController.isPause = false;
    [panelController changeTimerState];
    [self deallocPauseView];
}

- (void) deallocPauseView {
    [pauseView removeFromSuperview];
    pauseView = NULL;
}

- (void) turnOnPause: (bool) state {
    if (state) {
        pauseView = [[PauseView alloc] initWithFrame:gameMapController.view.frame];
        [gameMapContainer addSubview:pauseView];
        [self updateFocusIfNeeded];
    }
    else {
        [self deallocPauseView];
    }
}

- (void) turnToHome {
    GameLogic.sharedLogic.score = 0;
    [self dismissViewControllerAnimated: true completion: NULL];
}

- (void) showScore: (int) score {
    [panelController present: score];
}

- (void) replayGame {
    [gameOver removeFromSuperview];
    gameOver = NULL;
    [panelController stopTimer];
    panelController.scoreLabel.text = @"0";
    panelController.timeLabel.text = @"00:00";
    
    GameLogic.sharedLogic.score = 0;
    GameLogic.sharedLogic.totalScore = 0;
    GameLogic.sharedLogic.currentTime = GameLogic.sharedLogic.timeLimit;
    [gameMapController redrawScene];
    [panelController runTimer];
}

- (void) gameOver {
    [panelController stopTimer];
    gameOver = [[GameOverView alloc] initWithFrame:gameMapContainer.bounds];
    [gameMapContainer addSubview:gameOver];
    if (GameLogic.sharedLogic.totalScore > 0) {
        [self saveScore];
    }
}

- (void) saveScore {
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Save your score"
                                message:@"Input your name here"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* doneAction = [UIAlertAction
                                 actionWithTitle:@"Done"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     NSString* nickname = [alert.textFields[0] text];
                                     WinnerData* winner = [[WinnerData alloc] initWithUserName:nickname andScore:GameLogic.sharedLogic.totalScore];
                                     [RatingStorage.shared saveData:winner];
                                 }];
    
    UIAlertAction* cancelAction = [UIAlertAction
                                   actionWithTitle: @"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) { NULL; }];
    
    [alert addAction: doneAction];
    [alert addAction: cancelAction];
    
    [alert addTextFieldWithConfigurationHandler: ^(UITextField* nicknameField) {
        nicknameField.placeholder = @"Your name is...";
        nicknameField.clearButtonMode = UITextFieldViewModeWhileEditing;
        nicknameField.keyboardType = UIKeyboardTypeDefault;
        nicknameField.keyboardAppearance = UIKeyboardAppearanceDark;
    }];
    
    [self presentViewController:alert animated: true completion: nil];
    
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
    if ([segue.identifier  isEqual: @"PanelControlControllerSegue"]) {
        panelController = segue.destinationViewController;
        [self prepareControlPanelController];
    } else if ([segue.identifier isEqual: @"GameMapControllerSegue"]) {
        gameMapController = segue.destinationViewController;
        [self prepareGameMapController];
    }
}

- (void) prepareGameMapController {
   __weak typeof(self) weakSelf = self;
    
    gameMapController.gameOver = ^{
        [weakSelf gameOver];
    };
}

- (void) prepareControlPanelController {
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

@end


