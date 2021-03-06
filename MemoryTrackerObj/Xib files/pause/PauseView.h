//
//  PauseView.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/5/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PauseView : UIView

@property void (^onPauseTap)(void);

- (IBAction)onPauseTap:(UIButton *)sender;
- (PauseView *)initWithFrame: (CGRect) frame;
- (PauseView *)initWithCoder:(NSCoder *)aDecoder;

@end
