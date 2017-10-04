//
//  GameMapController.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface GameMapController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *gameScene;
@property void (^gameOver)(void);

- (CardView*) generateCardWith: (CGRect) rect andImgIndex: (int) index;
- (void) putCardsOnTheDeskWithRawCount: (int) raws andColumns: (int) columns; 
- (void) hideCardFace;
- (void) redrawScene;
- (void) initializateGameScene;
- (void) closeCard;
- (void) deleteCard;
- (void) isGameSceneEmpty;

@end



