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

@implementation GameController

@synthesize gameMapContainer;
@synthesize timeLimit;

PanelControlController* panelController;
GameMapController* gameMapController;

//    var pause = PauseView()
//    var gameOverView = GameOverView()

- (void)viewDidLoad {
    [super viewDidLoad];
    
    GameLogic.sharedLogic.presentScore = ^(int score) {
        [self showScore: score];
    };
    
    //        gameOverView.onRepeatButtTap = { [weak self] in
    //            self?.resrtartGame()
    //        }
    //
    //        pause.onPauseButtTap = { [weak self] in
    //            self?.turnOffpause()
    //        }
}

- (void) turnOffpause {
    panelController.isPause = false;
    [panelController changeTimerState];
    // pause.removeFromSuperview()
}

- (void) turnOnPause: (bool) state {
    if (state) {
        //            pause.frame = gameMapController.view.frame
        //            gameContainer.addSubview(pause)
    }
    else {
        //            pause.removeFromSuperview()
    }
}

- (void) turnToHome
{
    GameLogic.sharedLogic.score = 0;
    [self dismissViewControllerAnimated: true completion: NULL];
}

- (void) showScore: (int) score {
    [panelController present: score];
}

- (void) replayGame {
    //        gameOverView.removeFromSuperview()
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
    //        gameOverView.frame = gameContainer.bounds
    //        gameContainer.addSubview(gameOverView)
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
                                     NSString* nikname = alert.textFields[0];
                                     // let score = UserScore(username: nicknameField?.text ?? "User",
                                     //                                  score: Int(GameLogic.shared.totalScore))
                                     //RatingStorage.shared.saveData(score: score)
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
    gameMapController.gameOver = ^{
        [self gameOver];
    };
}

- (void) prepareControlPanelController {
    panelController.onHomeTap = ^{
        [self turnToHome];
    };
    
    panelController.onPauseTap = ^(bool state) {
        [self turnOnPause: state];
    };
    
    panelController.timeOver = ^{
        [self gameOver];
    };
    
    panelController.onRestartTap = ^{
        [self replayGame];
    };
}
@end


