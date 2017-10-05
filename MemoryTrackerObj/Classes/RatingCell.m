//
//  RatingCell.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "RatingCell.h"
#import "WinnerData.h"

@interface RatingCell ()
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end

@implementation RatingCell

@synthesize contentView;
@synthesize wonDate;
@synthesize username;
@synthesize userScore;
@synthesize trophy;

- (void) generateCellWith: (WinnerData*) user and: (UIImage*) img {
    trophy.image = img;
    username.text = user.username;
    userScore.text = [user.score stringValue];
    wonDate.text = @"1 minutes ago"; //[NSDateFormatter [user.winDate]; // convert to str;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self addSubview:contentView];
    
    return self;
}

@end


