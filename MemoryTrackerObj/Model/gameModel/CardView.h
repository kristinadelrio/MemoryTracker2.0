//
//  CardView.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIImageView

@property (nonatomic, strong) UIImage *cardBack;
@property (nonatomic, strong) UIImage *cardFace;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)turnToCardBack;
- (void)turnToCardFace;
- (void)setImageAttributes:(UIViewContentMode)mode :(UIColor *)color :(BOOL)userInteraction;

@end

