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

@property (weak, nonatomic) IBOutlet UIImageView *trophy;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *date;

- (void) generateCellWith: (WinnerData*) user and: (UIImage*) img;

@end