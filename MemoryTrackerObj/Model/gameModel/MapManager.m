//
//  MapManager.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapManager.h"
#import "Constants.h"

@implementation MapManager

@synthesize pokemonsImages;

- (MapManager *)init {
    self = [super init];
    
    pokemonsImages = [[NSMutableArray alloc] init];
    [self fillPokemonsArray];
    [self shuffleImages];
    
    return self;
}

- (void)fillPokemonsArray {
    for (int i = 0; i < MTCardsCount / 2; i++) {
        NSNumber* num =  [[NSNumber alloc] initWithInt: i + 1];
        [pokemonsImages addObject: num];
        [pokemonsImages addObject: num];
    }
}

- (void)shuffleImages {
    for (int i = 0; i < [pokemonsImages count]; i++) {
        int randomInt1 = arc4random() % [pokemonsImages count];
        int randomInt2 = arc4random() % [pokemonsImages count];
        [pokemonsImages exchangeObjectAtIndex: randomInt1 withObjectAtIndex: randomInt2];
    }
}

@end
