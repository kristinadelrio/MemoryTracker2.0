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

@property NSInteger score;
@property NSInteger totalScore;

@property NSInteger timeLimit;
@property NSInteger currentTime;

@property NSMutableArray *pokemonsImages;

@property void (^closeIfNeeded)(void);
@property void (^deleteCards)(void);
@property void (^presentScore)(NSInteger);

- (void)setupTimeLimit:(NSInteger)time;
- (void)setupCards;
- (void)isCardSimilarFirst:(CardView *)cardOne and:(CardView *)cardTwo;
- (void)updateScore;
- (void)prepareGameRestarting;
- (void)shuffleImages;

@end

#endif /* GameLogic_h */
