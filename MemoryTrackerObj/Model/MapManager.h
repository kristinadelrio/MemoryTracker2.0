//
//  MapManager.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef MapManager_h
#define MapManager_h

#import <Foundation/Foundation.h>

typedef int Pokemons;

@interface MapManager: NSObject

@property NSMutableArray* pokemonsImages;

- (id) init;
- (void) shuffleImages;

@end

#endif /* MapManager_h */


