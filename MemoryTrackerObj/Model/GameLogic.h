//
//  GameLogic.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef GameLogic_h
#define GameLogic_h

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface GameLogic: NSObject

+ (GameLogic*) sharedLogic;

@property int score;
@property int totalScore;

@property int timeLimit;
@property int currentTime;

- (void) setTimeLimit: (int) time;
- (void) isCardSimilarFirst: (CardView*) cardOne and: (CardView*) cardTwo;
- (void) updateScore;

@end

#endif /* GameLogic_h */
