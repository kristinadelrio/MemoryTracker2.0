//
//  WinnerData.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "WinnerData.h"

@implementation WinnerData

@synthesize username;
@synthesize score;
@synthesize winDate;

- (WinnerData *) init {
    self = [super init];

    username = @"Unknown";
    score = 0;
    winDate = [[NSDate alloc] init];
    
    return self;
}

- (WinnerData *) initWithUserName: (NSString*) name andScore: (NSInteger) score {
    self = [super init];
    
    username = [[NSString alloc] initWithString:name];
    self.score = [[NSNumber alloc] initWithInteger:score];
    winDate = [[NSDate alloc] init];
    
    return self;
}

- (WinnerData *)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    username = [NSString alloc];
    score = [NSNumber alloc];
    
    username = [decoder decodeObjectForKey:@"username"];
    score = [decoder decodeObjectForKey:@"score"];
    winDate = [decoder  decodeObjectForKey:@"date"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:username forKey:@"username"];
    [encoder encodeObject:score forKey:@"score"];
    [encoder encodeObject:winDate forKey:@"date"];
}

- (NSComparisonResult)compare:(WinnerData *)object {
    return !(self.score > object.score);
}

@end
