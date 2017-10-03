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

- (id) init
{
    self = [super init];
    
    cardBack = [UIImage imageNamed:@"card"];
    
    return self;
}

/// Makes card back visible
- (void) turnOnCardBack
{
    [self setImageAttributes: UIViewContentModeScaleAspectFit : [UIColor whiteColor] : true];
    [self setImage: cardBack];
}

/// Makes card face visible
- (void) turnOnCardFace
{
    [self setImageAttributes: UIViewContentModeScaleAspectFit : [UIColor whiteColor] : true];
    [self setImage: cardFace];
}

/// Sets attributes for image
- (void) setImageAttributes: (UIViewContentMode) mode : (UIColor*) color : (bool) userInteraction
{
    [self setUserInteractionEnabled:userInteraction];
    self.backgroundColor = color;
    self.contentMode = mode;
}

@end
