//
//  RatingCell.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "RatingCell.h"
#import "WinnerData.h"

@implementation RatingCell

@synthesize date;
@synthesize username;
@synthesize score;
@synthesize trophy;

- (void) generateCellWith: (WinnerData*) user and: (UIImage*) img {
    trophy.image = img;
    username.text = user.username;
    score.text = [user.score stringValue];
    date.text = @"1 minutes ago"; //[NSDateFormatter [user.winDate]; // convert to str;
}

@end


