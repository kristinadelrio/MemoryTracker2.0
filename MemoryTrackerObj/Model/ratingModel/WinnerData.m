//
//  WinnerData.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "WinnerData.h"

@implementation WinnerData

- (instancetype) init {
    self = [super init];

    self.username = @"Unknown";
    self.score = 0;
    self.winDate = [[NSDate alloc] init];
    
    return self;
}

- (WinnerData *) initWithUserName: (NSString*) name andScore: (NSInteger) score {
    self = [super init];
    
    self.username = [[NSString alloc] initWithString:name];
    self.score = [[NSNumber alloc] initWithInteger:score];
    self.winDate = [[NSDate alloc] init];
    
    return self;
}

- (WinnerData *)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    
    self.username = [NSString alloc];
    self.score = [NSNumber alloc];
    
    self.username = [decoder decodeObjectForKey:@"username"];
    self.score = [decoder decodeObjectForKey:@"score"];
    self.winDate = [decoder  decodeObjectForKey:@"date"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.score forKey:@"score"];
    [encoder encodeObject:self.winDate forKey:@"date"];
}

- (NSComparisonResult)compare:(WinnerData *)object {
    return !(self.score > object.score);
}

@end
