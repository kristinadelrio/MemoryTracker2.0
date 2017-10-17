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


@implementation RatingController

@synthesize tableView;

#pragma mark - IBActions

- (IBAction)clearRating:(id)sender {
    [self createDeleteAlertWith:@"Do you really want clean scores?"
                            and:@"Your records will be empty"];
}

- (IBAction)closeRating:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:true completion:NULL];
}

#pragma mark - Controller customization

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Data clearing block

- (void)clearScore {
    [RatingStorage.shared removeData];
    [tableView reloadData];
}

- (void)createDeleteAlertWith:(NSString *)title and:(NSString *) message {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:title
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    
    __weak typeof (self) weakSelf = self;
    UIAlertAction *doneAction = [UIAlertAction
                                 actionWithTitle:@"OK"
                                 style:UIAlertActionStyleDefault
                                 handler:^(UIAlertAction * action) {
                                     [weakSelf clearScore]; }];
    
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle: @"Cancel"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action) {
                                       [alert dismissViewControllerAnimated:true completion:nil];
                                   }];
    
    [alert addAction: doneAction];
    [alert addAction: cancelAction];
    
    [self presentViewController:alert animated: YES completion: nil];
}

#pragma mark - TableViewDataSource protocol implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return RatingStorage.shared.loadedRating ? RatingStorage.shared.loadedRating.count : 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RatingCell *cell = (RatingCell *)[tableView dequeueReusableCellWithIdentifier:@"RatingCell"];
    
    if (!cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"RatingCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    UIImage *img = [self getImageWithIndexPath:indexPath.row];
    [cell generateCellWith: [RatingStorage.shared.sortedLoadedRating objectAtIndex:indexPath.row] and:img];
    
    return cell;
}

- (UIImage *)getImageWithIndexPath:(NSInteger)row {
    switch (row) {
        case 0:  return [UIImage imageNamed:@"golden-medal"];
        case 1:  return [UIImage imageNamed:@"silver-medal"];
        case 2:  return [UIImage imageNamed:@"bronze-medal"];
        default: return nil;
    }
}

@end
