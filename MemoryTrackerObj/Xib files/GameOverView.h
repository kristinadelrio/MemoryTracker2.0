//
//  GameOverView.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/5/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameOverView : UIView

@property void (^onReplayGame)(void);

@property (strong, nonatomic) IBOutlet UIView *contentView;

- (IBAction)gameOver:(UIButton *)sender;
- (id) initWithFrame:(CGRect)frame;

@end
