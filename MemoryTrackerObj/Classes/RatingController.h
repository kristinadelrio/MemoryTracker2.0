//
//  RatingController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RatingController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)clearRating:(UIBarButtonItem *)sender;
- (IBAction)closeRating:(UIBarButtonItem *)sender;

@end
