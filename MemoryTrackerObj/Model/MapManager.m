//
//  MapManager.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapManager.h"

@implementation MapManager

const int kCountElements = 20;

@synthesize pokemonsImages;

- (id) init
{
    self = [super init];
    [self fillPokemonsArray];
    [self shuffleImages];
    return self;
}

- (void) fillPokemonsArray
{
    for (int i = 1; i <= kCountElements; i+=2)
    {
        [pokemonsImages addObject: [[NSNumber alloc] initWithInt:i]];
        [pokemonsImages addObject: [[NSNumber alloc] initWithInt:i]];
    }
}

- (void) shuffleImages
{
    for (int i = 0; i < kCountElements - 1; i++) {
        int remainingCount = kCountElements - i;
        int exchangeIndex = i + arc4random_uniform((u_int32_t) remainingCount);
        [pokemonsImages exchangeObjectAtIndex: i withObjectAtIndex: exchangeIndex];
    }
}

@end
