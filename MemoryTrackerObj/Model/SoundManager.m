//
//  SoundManager.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "SoundManager.h"

@implementation SoundManager

@synthesize soundState;
@synthesize player;

- (SoundManager *)initWith:(NSString *)musicFileName {
    self = [super init];
    
    [self initPlayer:musicFileName type:@"mp3"];
    
    // in first launch app value will be nil
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"SoundState"] == nil) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SoundState"];
    }

    return self;
}

- (BOOL)soundState {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:@"SoundState"] boolValue];;
}

- (void)setSoundState:(BOOL)soundState {
    [[NSUserDefaults standardUserDefaults] setBool:soundState forKey:@"SoundState"];
}

- (void)initPlayer:(NSString *)name type:(NSString *)type {
    NSURL *url = [[NSBundle mainBundle] URLForResource:name withExtension:type];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
}

- (void)playMusic {
    [player play];
}

- (void)stopMusic {
    [player stop];
}

@end
