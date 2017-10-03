//
//  GameLogic.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef GameLogic_h
#define GameLogic_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameLogic: NSObject

+ (id) sharedLogic;

@property int score;
@property int totalScore;

@property int timeLimit;
@property int currentTime;
//func setTimeLimit(time: Double) {

- (void) setTimeLimit: (int) time;
//- (void) isCardSimilarFirst: (CardView) cardOne and: (CardView) cardTwo;
- (void) updateScore;

@end

//// Works with game map
//var closeIfNeeded: (()->())?
//var deleteCards: (()->())?
//
//// Works with control panel
//var presentScore: ((Double)->())?

//func setTimeLimit(time: Double) {
//    currentTime = time
//    timeLimit = time
//}
//
//// Checks if card similar
//func isCardSimilar(cardOne: CardView, cardTwo: CardView) {
//    if cardOne.image == cardTwo.image {
//        score += 25
//        deleteCards?()
//    } else {
//        score -= 5
//        closeIfNeeded?()
//    }
//
//    updateScore()
//}
//
//// Sends current score
//func updateScore() {
//    totalScore = score * 100 * currentTime / timeLimit
//    presentScore?(totalScore)
//}
#endif /* GameLogic_h */
