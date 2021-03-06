//
//  RatingStorage.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef RatingStorage_h
#define RatingStorage_h

#import <Foundation/Foundation.h>

@class WinnerData;

@interface RatingStorage: NSObject

+(RatingStorage *) shared;
@property NSMutableArray *loadedRating;
@property (readonly, atomic) NSMutableArray *sortedLoadedRating;

-(void) removeData;
-(void) saveData:(WinnerData *) data;

@end

#endif /* RatingStorage_h */

