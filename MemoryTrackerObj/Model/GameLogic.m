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

+ (id) sharedLogic {
    static GameLogic* sharedLogic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLogic = [[self alloc] init];
    });
    
    return sharedLogic;
}

- (id) init {
    self = [super init];
    //someProperty = [[NSString alloc] initWithString:@"Default Property Value"];
    
    return self;
}

@end
