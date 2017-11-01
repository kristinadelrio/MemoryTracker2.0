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

// Singleton creation
+ (GameLogic *)shared {
    static GameLogic* sharedLogic;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedLogic = [[self alloc] init];
    });
    
    return sharedLogic;
}

- (instancetype)init {
    self = [super init];
    
    self.timeLimit = MTDefaultTimeLimit;
    self.currentTime = self.timeLimit;
    self.score = self.totalScore = 0;
    
    return self;
}

- (void)setupCards {
    self.pokemonsImages = [[NSMutableArray alloc] init];
    [self fillPokemonsArray];
    [self shuffleImages];
}

- (void)setupTimeLimit:(NSInteger)time {
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
        self.score -= MTScoreDecrementVal;
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
    self.currentTime = self.timeLimit;
}

- (void)fillPokemonsArray {
    for (int i = 0; i < MTCardsCount / 2; i++) {
        NSNumber* num =  [[NSNumber alloc] initWithInt: i + 1];
        [self.pokemonsImages addObject: num];
        [self.pokemonsImages addObject: num];
    }
}

- (void)shuffleImages {
    for (int i = 0; i < [self.pokemonsImages count]; i++) {
        int randomInt1 = arc4random() % [self.pokemonsImages count];
        int randomInt2 = arc4random() % [self.pokemonsImages count];
        [self.pokemonsImages exchangeObjectAtIndex: randomInt1 withObjectAtIndex: randomInt2];
    }
}

@end



