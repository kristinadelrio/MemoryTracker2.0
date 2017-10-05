//
//  RatingCell.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "RatingCell.h"

@implementation RatingCell

- (void)generateCellWith:(WinnerData *)user and:(UIImage *)img {
    _trophyImageView.image = img;
    _username.text = user.username;
    _userScore.text = [user.score stringValue];
    _wonDate.text = @"1 minutes ago"; //[NSDateFormatter [user.winDate]; // convert to str;
}

@end


