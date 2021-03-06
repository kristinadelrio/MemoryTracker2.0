//
//  GameMapController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CardView;

@interface GameMapController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *gameScene;
@property void (^gameOver)(void);

- (CardView *)generateCardWith:(CGRect)rect andImgIndex:(NSInteger)index;
- (void)putCardsOnTheDeskWithRawCount:(NSInteger)raws andColumns:(NSInteger)columns;
- (void)hideCardFace;
- (void)redrawScene;
- (void)initializateGameScene;
- (void)closeCard;
- (void)deleteCard;
- (void)isGameSceneEmpty;

@end



