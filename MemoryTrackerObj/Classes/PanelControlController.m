//
//  PanelControlController.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "PanelControlController.h"
#import "GameLogic.h"
#import "NSTImemeIntervalToString.h"

@implementation PanelControlController

@synthesize isPause;
@synthesize isTimerRunning;
@synthesize scoreLabel;
@synthesize timeLabel;

@synthesize onHomeTap;
@synthesize onPauseTap;
@synthesize onRestartTap;
@synthesize timeOver;

NSTimer* timer;

- (void) viewDidLoad {
    [super viewDidLoad];
    
    isPause = false;
    isTimerRunning = false;
}
- (IBAction) restartGame: (UIButton *) sender {
    if (onRestartTap != NULL) {
        onRestartTap();
    }
}

- (IBAction) pauseGame: (UIButton *) sender {
    isPause = !isPause;
    [self changeTimerState];
    
    if (onPauseTap != NULL) {
        onPauseTap(isPause);
    }
}
- (IBAction) backToHome: (UIButton *) sender {
    if (onHomeTap != NULL) {
        onHomeTap();
    }
}

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    [self runTimer];
}

- (void) viewWillDisappear: (BOOL) animated {
    [super viewWillDisappear:animated];
    [self stopTimer];
}

- (void) present: (int) score {
    scoreLabel.text = [[NSNumber numberWithInt: score] stringValue];
}

- (void) presentTimer {
    if (GameLogic.sharedLogic.currentTime < 1) {
        [timer invalidate];
        
        if (timeOver != NULL) {
            timeOver();
        }
    } else {
        GameLogic.sharedLogic.currentTime -= 1;
        NSString* time = [NSTImemeIntervalToString toString: GameLogic.sharedLogic.currentTime];
        timeLabel.text = time;
    }
}

- (void) runTimer {
    timer = [NSTimer scheduledTimerWithTimeInterval: 1
                                             target: self
                                           selector: @selector(presentTimer)
                                           userInfo: NULL
                                            repeats: true];
    isTimerRunning = true;
}

- (void) stopTimer {
    [timer invalidate];
    isTimerRunning = false;
}

- (void) changeTimerState {
    isTimerRunning && isPause ? [self stopTimer] : [self runTimer];
}

@end

