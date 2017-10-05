//
//  ViewController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuController : UIViewController

typedef int Level;
enum Levels { easyLevel = 0, normalLevel, hardLevel };

- (NSTimeInterval)timeLimitWith:(Level)level;
- (void)setLevelWith:(int)index;
- (void)setSoundWith:(BOOL)state;

@end

