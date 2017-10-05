//
//  RatingCell.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WinnerData.h"

@interface RatingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *trophyImageView;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property (weak, nonatomic) IBOutlet UILabel *wonDate;

- (void)generateCellWith:(WinnerData *)user and:(UIImage *)img;

@end
