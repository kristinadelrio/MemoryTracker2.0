//
//  PanelControlController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanelControlController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property BOOL isTimerRunning;
@property BOOL isPause;

@property void  (^onRestartTap)(void);
@property void (^onPauseTap)(BOOL);
@property void (^onHomeTap)(void);
@property void (^timeOver)(void);

- (IBAction)restartGame:(UIButton *)sender;
- (IBAction)pauseGame:(UIButton *)sender;
- (IBAction)backToHome:(UIButton *)sender;

- (void)prepareRestartingGame;
- (void)present:(NSInteger)score;
- (void)presentTimer;
- (void)runTimer;
- (void)stopTimer;
- (void)changeTimerState;

@end
