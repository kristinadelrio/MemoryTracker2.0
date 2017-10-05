//
//  NSTImemeIntervalToString.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "NSTImemeIntervalToString.h"

@implementation NSTImemeIntervalToString

+ (NSString *)toString:(NSTimeInterval)time {
    int minutes = (int)time / 60 % 60;
    int seconds = (int)time % 60;
    
    return [NSString stringWithFormat:@"%2i:%2i", minutes, seconds];
}

@end
