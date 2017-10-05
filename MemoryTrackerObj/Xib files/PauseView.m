//
//  PauseView.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/5/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "PauseView.h"

@implementation PauseView

@synthesize contentView;
@synthesize onPauseTap;

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
    [NSBundle.mainBundle loadNibNamed:@"PauseView" owner:self options:NULL];

    
    contentView.frame = self.bounds;
    contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self addSubview:contentView];
}

- (IBAction)onPauseTap:(UIButton *)sender {
    if (onPauseTap)
    {
        onPauseTap();
    }
}

@end
