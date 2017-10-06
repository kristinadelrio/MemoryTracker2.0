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
@synthesize sortedLoadedRating;

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
    
    [self loadData];
    return self;
}

- (void)removeData {
    @try {
        [loadedRating removeAllObjects];
        [NSFileManager.defaultManager removeItemAtPath:[self filePath] error:nil];
    } @catch(...) {
        NSLog(@"Cannot clear data!");
    }
}

- (void)loadData {
    loadedRating = [NSMutableArray array];
    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithFile: [self filePath]];
    loadedRating = [data mutableCopy];
    data = nil;
}

- (void)saveData:(WinnerData *)data {
    [self initLoadedRatingArrayIfNeeded];
    [loadedRating addObject:data];
    [NSKeyedArchiver archiveRootObject:loadedRating toFile:[self filePath]];
}

- (void)initLoadedRatingArrayIfNeeded {
    if (!loadedRating) {
        loadedRating = [NSMutableArray array];
    }
}

- (NSMutableArray *)sortedLoadedRating {
    if (loadedRating) {
            [loadedRating sortUsingComparator:
             ^NSComparisonResult(WinnerData *first, WinnerData *second) {
                return [first compare:second];
             }];
        
        return loadedRating;
    }
        return nil;
}

- (NSString *)filePath {
    NSURL *url = [[NSFileManager.defaultManager
                   URLsForDirectory:NSDocumentDirectory
                   inDomains:NSUserDomainMask] lastObject];
    
    return [[url URLByAppendingPathComponent:@"rating"] path];
}

@end

