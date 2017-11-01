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

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isPause = NO;
    self.isTimerRunning = NO;
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
    if (self.onRestartTap) {
        self.onRestartTap();
    }
}

- (IBAction)pauseGame:(UIButton *)sender {
    self.isPause = !self.isPause;
    [self changeTimerState];
    
    if (self.onPauseTap) {
        self.onPauseTap(self.isPause);
    }
}

- (IBAction)backToHome:(UIButton *)sender {
    if (self.onHomeTap) {
        self.onHomeTap();
    }
}

#pragma mark - Presentation block

- (void)present:(NSInteger)score {
    self.scoreLabel.text = [[NSNumber numberWithInteger: score] stringValue];
}

- (void)presentTimer {
    if (GameLogic.shared.currentTime < 1) {
        [timer invalidate];
        
        if (self.timeOver) {
            self.timeOver();
        }
        
    } else {
        GameLogic.shared.currentTime -= 1;
        NSString* time = [NSTImemeIntervalToString toString:
                          GameLogic.shared.currentTime];
        
        self.timeLabel.text = time;
    }
}

- (void)prepareRestartingGame {
    [self stopTimer];
    self.scoreLabel.text = @"0";
    self.timeLabel.text = @"00:00";
}

#pragma mark - Timer's management

- (void) runTimer {
    timer = [NSTimer
             scheduledTimerWithTimeInterval: 1
             target: self
             selector: @selector(presentTimer)
             userInfo: nil
             repeats: YES];
    
    self.isTimerRunning = YES;
}

- (void)stopTimer {
    [timer invalidate];
    self.isTimerRunning = NO;
}

- (void)changeTimerState {
    self.isTimerRunning && self.isPause ? [self stopTimer] : [self runTimer];
}

@end

