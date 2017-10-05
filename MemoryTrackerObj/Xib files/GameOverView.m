//
//  GameOverView.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/5/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "GameOverView.h"

@implementation GameOverView

@synthesize contentView;
@synthesize onReplayGame;

- (id) initWithFrame: (CGRect) frame {
    self = [super initWithFrame: frame];
    [self commonInit];
    
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    [self commonInit];
    
    return self;
}


- (void) commonInit {
    [NSBundle.mainBundle loadNibNamed:@"GameOverView" owner:self options:NULL];
    [self addSubview:contentView];
    
    contentView.frame = self.bounds;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
}

- (IBAction) gameOver: (UIButton*) sender {
    if (onReplayGame) {
        onReplayGame();
    }
}

@end
