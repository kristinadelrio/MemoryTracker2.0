//
//  GameLogic.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameLogic.h"

@implementation GameLogic

@synthesize timeLimit;
@synthesize currentTime;

@synthesize score;
@synthesize totalScore;

@synthesize closeIfNeeded;
@synthesize presentScore;
@synthesize deleteCards;

+ (GameLogic*) sharedLogic {
    static GameLogic* sharedLogic;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedLogic = [[self alloc] init];
    });
    
    return sharedLogic;
}

- (id) init {
    self = [super init];
    
    timeLimit = 60;
    currentTime = timeLimit;
    score = totalScore = 0;
    
    return self;
}

- (void) initTimeLimit: (int) time {
    currentTime = time;
    timeLimit = time;
}

- (void) isCardSimilarFirst: (CardView*) cardOne and: (CardView*) cardTwo {
    if (cardOne.image == cardTwo.image) {
        score += 25;
        if (deleteCards) {
            deleteCards();
        }
        
    } else {
        score -= 5;
        if (closeIfNeeded) {
            closeIfNeeded();
        }
    }
    
    [self updateScore];
}

- (void) updateScore {
    self.totalScore = score * 100 * currentTime / timeLimit;
    if (presentScore) {
        presentScore(totalScore);
    }
}

@end



