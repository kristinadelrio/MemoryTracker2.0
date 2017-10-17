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
{
    NSTimer *timer;
}

#pragma mark - Properties

@synthesize isPause;
@synthesize isTimerRunning;
@synthesize scoreLabel;
@synthesize timeLabel;

@synthesize onHomeTap;
@synthesize onPauseTap;
@synthesize onRestartTap;
@synthesize timeOver;

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isPause = NO;
    isTimerRunning = NO;
}

- (void) viewWillAppear: (BOOL) animated {
    [super viewWillAppear:animated];
    [self runTimer];
}

- (void) viewWillDisappear: (BOOL) animated {
    [super viewWillDisappear:animated];
    [self stopTimer];
}

#pragma mark - IBActions

- (IBAction)restartGame:(UIButton *)sender {
    if (onRestartTap) {
        onRestartTap();
    }
}

- (IBAction)pauseGame:(UIButton *)sender {
    isPause = !isPause;
    [self changeTimerState];
    
    if (onPauseTap) {
        onPauseTap(isPause);
    }
}

- (IBAction)backToHome:(UIButton *)sender {
    if (onHomeTap) {
        onHomeTap();
    }
}

#pragma mark - Presentation block

- (void)present:(NSInteger)score {
    scoreLabel.text = [[NSNumber numberWithInteger: score] stringValue];
}

- (void)presentTimer {
    if (GameLogic.shared.currentTime < 1) {
        [timer invalidate];
        
        if (timeOver) {
            timeOver();
        }
        
    } else {
        GameLogic.shared.currentTime -= 1;
        NSString* time = [NSTImemeIntervalToString toString:
                          GameLogic.shared.currentTime];
        
        timeLabel.text = time;
    }
}

- (void)prepareRestartingGame {
    [self stopTimer];
    scoreLabel.text = @"0";
    timeLabel.text = @"00:00";
}

#pragma mark - Timer's management

- (void) runTimer {
    timer = [NSTimer
             scheduledTimerWithTimeInterval: 1
             target: self
             selector: @selector(presentTimer)
             userInfo: nil
             repeats: YES];
    
    isTimerRunning = YES;
}

- (void)stopTimer {
    [timer invalidate];
    isTimerRunning = NO;
}

- (void)changeTimerState {
    isTimerRunning && isPause ? [self stopTimer] : [self runTimer];
}

@end

