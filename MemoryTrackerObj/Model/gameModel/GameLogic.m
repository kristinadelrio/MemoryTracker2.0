//
//  GameLogic.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameLogic.h"
#import "Constants.h"

@implementation GameLogic

@synthesize timeLimit;
@synthesize currentTime;

@synthesize score;
@synthesize totalScore;

@synthesize closeIfNeeded;
@synthesize presentScore;
@synthesize deleteCards;

// Singleton creation
+ (GameLogic *)shared {
    static GameLogic* sharedLogic;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedLogic = [[self alloc] init];
    });
    
    return sharedLogic;
}

- (GameLogic *)init {
    self = [super init];
    
    self.timeLimit = MTDefaultTimeLimit;
    self.currentTime = self.timeLimit;
    self.score = totalScore = 0;
    
    return self;
}

- (void)initTimeLimit:(int)time {
    self.currentTime = time;
    self.timeLimit = time;
}

- (void)isCardSimilarFirst:(CardView *)cardOne and:(CardView *)cardTwo {
    if ([UIImagePNGRepresentation(cardOne.image) isEqual:
         UIImagePNGRepresentation(cardTwo.image)]) {
        
        self.score += MTScoreIncrementVal;
        if (self.deleteCards) {
            self.deleteCards();
        }
        
    } else {
        score -= MTScoreDecrementVal;
        if (self.closeIfNeeded) {
            self.closeIfNeeded();
        }
    }
    
    [self updateScore];
}

- (void)updateScore {
    self.totalScore = self.score * MTScoreMultiplier * self.currentTime / self.timeLimit;
    if (self.presentScore) {
        self.presentScore(self.totalScore);
    }
}

- (void)prepareGameRestarting {
    self.score = 0;
    self.totalScore = 0;
    self.currentTime = timeLimit;
}

@end



