//
//  PanelControlController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanelControlController : UIViewController

@property bool isTimerRunning;
@property bool isPause;

- (void) present: (int) score;
- (void) presentTimer;
- (void) runTimer;
- (void) stopTimer;
- (void) changeTimerState;

@end
