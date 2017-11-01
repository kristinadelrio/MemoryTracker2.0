//
//  RatingStorage.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "RatingStorage.h"
#import "MemoryTrackerObj-Swift.h"

@implementation RatingStorage

+ (RatingStorage *)shared {
    static RatingStorage *shared;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (instancetype)init {
    self = [super init];
    
    [self loadData];
    return self;
}

- (void)removeData {
    @try {
        [self.loadedRating removeAllObjects];
        [NSFileManager.defaultManager removeItemAtPath:[self filePath] error:nil];
    } @catch(...) {
        NSLog(@"Cannot clear data!");
    }
}

- (void)loadData {
    self.loadedRating = [NSMutableArray array];
    [NSKeyedUnarchiver setClass:WinnerData.self forClassName:@"WinnerData"];
    NSArray *data = [NSKeyedUnarchiver unarchiveObjectWithFile: [self filePath]];
    self.loadedRating = [data mutableCopy];
    data = nil;
}

- (void)saveData:(WinnerData *)data {
    [NSKeyedArchiver setClassName:@"WinnerData" forClass:WinnerData.self];
    [self initLoadedRatingArrayIfNeeded];
    [self.loadedRating addObject:data];
    [NSKeyedArchiver archiveRootObject:self.loadedRating toFile:[self filePath]];
}

- (void)initLoadedRatingArrayIfNeeded {
    if (!self.loadedRating) {
        self.loadedRating = [NSMutableArray array];
    }
}

- (NSMutableArray *)sortedLoadedRating {
    if (self.loadedRating) {
            [self.loadedRating sortUsingComparator:
             ^NSComparisonResult(WinnerData *first, WinnerData *second) {
                return first.score < second.score;
                //return [first compare:second];
             }];
        
        return self.loadedRating;
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

