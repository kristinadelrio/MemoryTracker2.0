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

- (id) init {
    self = [super init];
    
    username = @"Unknown";
    score = 0;
    winDate = [NSDate date];
    
    return self;
}

- (id) initWithUserName: (NSString*) name andScore: (int) score {
    self = [super init];
    
    username = [[NSString alloc] initWithString:name];
    self.score = [[NSNumber alloc] initWithInt:score];
    winDate = [NSDate date];
    
    return self;
}


- (id) initWithCoder: (NSCoder*) decoder {
    self = [super init];
    
    username = [NSString alloc];
    score = [NSNumber alloc];
    
    username = [decoder decodeObjectForKey:@"username"];
    score = [decoder decodeObjectForKey:@"score"];
    winDate = [decoder  decodeObjectForKey:@"date"];
    
    return self;
}
- (void) encodeWithCoder: (NSCoder*) encoder {
    [encoder encodeObject:username forKey:@"username"];
    [encoder encodeObject:score forKey:@"score"];
    [encoder encodeObject:winDate forKey:@"date"];
}

@end
