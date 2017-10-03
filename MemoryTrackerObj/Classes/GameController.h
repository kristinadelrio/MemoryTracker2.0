//
//  GameController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *gameMapContainer;
@property int timeLimit;

- (void) turnOffpause;
- (void) turnOnPause: (bool) state;
- (void) turnToHome;
- (void) showScore: (int) score;
- (void) replayGame;
- (void) gameOver;
- (void) saveScore;

@end


