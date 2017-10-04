//
//  RatingController.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "RatingController.h"
#import "RatingStorage.h"
#import "RatingCell.h"

@interface RatingController ()

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation RatingController

NSMutableArray<WinnerData*>* winnersList;
@synthesize tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    winnersList = RatingStorage.shared.loadedRating;
}

- (IBAction)clearRating:(id)sender {
    [self createDeleteAlertWith:@"Do you really want clean scores?"
                            and:@"Your records will be empty"];
}

- (IBAction)closeRating:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:NULL];
}

- (bool) prefersStatusBarHidden {
    return true;
}

- (void) clearScore {
    [winnersList removeAllObjects];
    [tableView reloadData];
    [RatingStorage.shared removeData];
}

- (void) createDeleteAlertWith: (NSString*) title and: (NSString*) message {
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:title
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    
    __weak typeof (self) weakSelf = self;
    UIAlertAction* doneAction = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     [weakSelf clearScore]; }];
    
    UIAlertAction* cancelAction = [UIAlertAction
                                   actionWithTitle: @"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       [alert dismissViewControllerAnimated:true completion:NULL];
                                   }];
    
    [alert addAction: doneAction];
    [alert addAction: cancelAction];
    
    [self presentViewController:alert animated: true completion: nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return winnersList ? winnersList.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RatingCell* cell = [tableView dequeueReusableCellWithIdentifier: @"ratingCell"
                                                       forIndexPath: indexPath];
    
    NSNumber* score = [winnersList objectAtIndex:indexPath.row].score;
    
    if (cell && score) {
        UIImage* img = NULL;
        switch (indexPath.row) {
            case 0:
                img = [UIImage imageNamed:@"golden-medal"];
                break;
            case 1:
                img = [UIImage imageNamed:@"silver-medal"];
                break;
            case 2:
                img = [UIImage imageNamed:@"bronze-medal"];
                break;
            default:
                break;
        }
        
        [cell generateCellWith: [winnersList objectAtIndex:indexPath.row] and:img];
        
        return cell;
    }
                        
    return [[UITableViewCell alloc] init];
}

@end
