//
//  RatingStorage.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "RatingStorage.h"

@implementation RatingStorage

@synthesize loadedRating;

+ (RatingStorage *)shared {
    static RatingStorage *shared;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (RatingStorage *)init {
    self = [super init];
    
    loadedRating = [NSMutableArray alloc];
    [self loadData];
    
    return self;
}

- (void)removeData {
    @try {
        [NSFileManager.defaultManager removeItemAtPath:[self filePath] error:nil];
    } @catch(...) {
        NSLog(@"Cannot clear data!");
    }
}

- (NSMutableArray *)loadData {
    loadedRating = [loadedRating initWithObjects:
                    [[NSKeyedUnarchiver unarchiveObjectWithFile: [self filePath]] mutableCopy], nil];

    return loadedRating;
}

- (void)saveData:(WinnerData *)data {
    [loadedRating addObject:data];
    [NSKeyedArchiver archiveRootObject:loadedRating toFile:[self filePath]];
}

- (NSString *)filePath {
    NSURL *url = [[NSFileManager.defaultManager
                   URLsForDirectory:NSDocumentDirectory
                   inDomains:NSUserDomainMask] lastObject];
    
    return [[url URLByAppendingPathComponent:@"rating"] path];
}

@end

