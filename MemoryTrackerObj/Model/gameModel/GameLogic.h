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

+ (GameLogic *) shared;

@property int score;
@property int totalScore;

@property int timeLimit;
@property int currentTime;

@property NSMutableArray *pokemonsImages;

@property void (^closeIfNeeded)(void);
@property void (^deleteCards)(void);
@property void (^presentScore)(int);

- (void)initTimeLimit:(int)time;
- (void)initCards;
- (void)isCardSimilarFirst:(CardView *)cardOne and:(CardView *)cardTwo;
- (void)updateScore;
- (void)prepareGameRestarting;
- (void)shuffleImages;

@end

#endif /* GameLogic_h */
