//
//  GameMapController.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "GameMapController.h"
#import "GameLogic.h"
#import "Constants.h"
#import "CardView.h"

@implementation GameMapController
{
    NSMutableArray *openedCards;
}

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [GameLogic.shared setupCards];
    openedCards = [[NSMutableArray alloc] initWithCapacity:2];
    
    [self initializateGameScene];
    
    __weak typeof(self) weakSelf = self;
    GameLogic.shared.closeIfNeeded = ^{
        [weakSelf closeCard];
    };
    
    GameLogic.shared.deleteCards = ^{
        [weakSelf deleteCard];
    };
}

#pragma mark - Card's initialization

- (CardView *)generateCardWith:(CGRect)rect andImgIndex:(NSInteger)index {
    CardView *card = [[CardView alloc] initWithFrame:rect];
    NSString *imgName = [@([GameLogic.shared.pokemonsImages[index] intValue]) stringValue];
    card.cardFace = [UIImage imageNamed: imgName];
    [card turnToCardFace];
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]
                                          initWithTarget: self
                                          action: @selector(onCardTap:)];
    
    [card addGestureRecognizer:recognizer];
    [self.gameScene addSubview:card];
    
    return card;
}

- (void)putCardsOnTheDeskWithRawCount:(NSInteger)raws andColumns:(NSInteger)columns {
    CGFloat xPos = 0;
    CGFloat yPos = 0;
    
    for (int i = 0; i < raws * columns; i++) {
        CGRect rect = CGRectMake(xPos, yPos,
                                 self.gameScene.bounds.size.width / columns,
                                 self.gameScene.bounds.size.height / raws);
        
        [self.gameScene addSubview:[self generateCardWith:rect andImgIndex:i]];
        xPos += self.gameScene.bounds.size.width / columns;
        
        if (xPos == self.gameScene.bounds.size.width) {
            yPos += self.gameScene.bounds.size.height / raws;
            xPos = 0;
        }
    }
}

- (void)onCardTap:(UITapGestureRecognizer*)sender {
    if ([sender.view isKindOfClass: [CardView class]]) {
        CardView* card = (CardView*) sender.view;
        if (card.image == card.cardBack) {
            if (openedCards.count == 2) {
                [GameLogic.shared isCardSimilarFirst:openedCards[0] and: openedCards[1]];
            }
            
            [card turnToCardFace];
            [openedCards addObject: card];
            [self isGameSceneEmpty];
        }
    }
}

#pragma mark - Scene management

- (void)hideCardFace {
    for (id subview in self.gameScene.subviews) {
        if ([subview isKindOfClass: [CardView class]]) {
            CardView *card = subview;
            [card turnToCardBack];
        }
    }
}

- (void)redrawScene {
    for (UIView *subview in self.gameScene.subviews) {
        [subview removeFromSuperview];
    }
    
    [openedCards removeAllObjects];
    [GameLogic.shared shuffleImages];
    [self initializateGameScene];
}

- (void)initializateGameScene {
    [self putCardsOnTheDeskWithRawCount: MTRawsCountInDesk andColumns: MTColumnsCountInDesk];
    [NSTimer scheduledTimerWithTimeInterval: 2 repeats: NO block: ^(NSTimer *timer) {
        [self hideCardFace];
    }];
}


- (void)closeCard {
    [openedCards[0] turnToCardBack];
    [openedCards[1] turnToCardBack];
    
    [openedCards removeAllObjects];
}

- (void)deleteCard {
    [openedCards[0] removeFromSuperview];
    [openedCards[1] removeFromSuperview];
    
    [openedCards removeAllObjects];
}

- (void)isGameSceneEmpty {
    if (self.gameScene.subviews.count == 2 && self.gameOver) {
        self.gameOver();
    }
}

@end

