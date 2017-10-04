 //
//  GameMapController.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "GameMapController.h"
#import "GameLogic.h"
#import "MapManager.h"

@implementation GameMapController

MapManager* mapManager;

// /////////// наплутано
NSMutableArray<CardView*>* openedCards;
// /////////// наплутано

@synthesize gameScene;
@synthesize gameOver;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    mapManager = [[MapManager alloc] init];
    openedCards = [[NSMutableArray alloc] init];
    
    [self initializateGameScene];

    __weak typeof(self) weakSelf = self;
    GameLogic.sharedLogic.closeIfNeeded = ^{
        [weakSelf closeCard];
    };
    
    GameLogic.sharedLogic.deleteCards = ^{
        [weakSelf deleteCard];
    };
}

- (CardView*) generateCardWith: (CGRect) rect andImgIndex: (int) index {
    CardView* card = [[CardView alloc] initWithFrame: rect];
    NSString* imgName =  [@([mapManager.pokemonsImages[index] intValue]) stringValue];
    card.cardFace = [UIImage imageNamed: imgName];
    [card turnToCardFace];
    
    UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc]
                                          initWithTarget: self
                                          action: @selector(onCardTap:)];

    [card addGestureRecognizer:recognizer];
    [gameScene addSubview:card];
    
    return card;
}

- (void) putCardsOnTheDeskWithRawCount: (int) raws andColumns: (int) columns {
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    
    for (int i = 0; i < raws * columns; i++) {
        CGRect rect = CGRectMake(xPos, yPos,
                                  gameScene.bounds.size.width / columns,
                                  gameScene.bounds.size.height / raws);
        
        [gameScene addSubview:[self generateCardWith: rect andImgIndex: i]];
        xPos += gameScene.bounds.size.width / columns;
        
        if (xPos == gameScene.bounds.size.width) {
            yPos += gameScene.bounds.size.height / raws;
            xPos = 0;
        }
    }
}

- (void) hideCardFace {
    for (id subview in gameScene.subviews) {
        if ([subview isKindOfClass: [CardView class]]) {
            CardView* card = subview;
            [card turnToCardBack];
        }
    }
}

- (void) redrawScene {
    for (UIView *subview in gameScene.subviews) {
        [subview removeFromSuperview];
    }
/////////////////////////////
    openedCards = NULL;
    //[openedCards dele]
    [mapManager shuffleImages];
    [self initializateGameScene];
}

- (void) initializateGameScene {
    [self putCardsOnTheDeskWithRawCount: 5 andColumns: 4];
    [NSTimer scheduledTimerWithTimeInterval: 2 repeats: false block: ^(NSTimer *timer) {
        [self hideCardFace];
    }];
}

- (void) onCardTap: (UITapGestureRecognizer*) sender {
    if ([sender.view isKindOfClass: [CardView class]]) {
        CardView* card = (CardView*) sender.view;
        if (card.image == card.cardBack) {
            if (openedCards.count == 2) {
                [GameLogic.sharedLogic isCardSimilarFirst:openedCards[0] and: openedCards[1]];
            }

            [card turnToCardFace];
            [openedCards addObject: card];
            [self isGameSceneEmpty];
        }
    }
}

- (void) closeCard {
    [openedCards[0] turnToCardBack];
    [openedCards[1] turnToCardFace];
    
    openedCards = NULL;
}
- (void) deleteCard {
    [openedCards[0] removeFromSuperview];
    [openedCards[1] removeFromSuperview];
    
    openedCards = NULL;
}
- (void) isGameSceneEmpty {
    if (gameScene.subviews.count == 2 && gameOver) {
        gameOver();
    }
}

@end

