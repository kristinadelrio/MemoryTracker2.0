//
//  CardView.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/3/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "CardView.h"

@implementation CardView

@synthesize cardBack;
@synthesize cardFace;

- (CardView *)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    cardBack = [UIImage imageNamed:@"cardBack"];
    
    return self;
}

/// Makes card back visible
- (void)turnToCardBack {
    [self setImageAttributes: UIViewContentModeScaleToFill:[UIColor whiteColor]:YES];
    [self setImage:cardBack];
}

/// Makes card face visible
- (void)turnToCardFace {
    [self setImageAttributes:UIViewContentModeScaleAspectFit:[UIColor whiteColor]:YES];
    [self setImage: cardFace];
}

/// Sets attributes for image
- (void)setImageAttributes:(UIViewContentMode)mode :(UIColor*)color :(BOOL)userInteraction {
    [self setUserInteractionEnabled: userInteraction];
    self.backgroundColor = color;
    self.contentMode = mode;
}

@end
