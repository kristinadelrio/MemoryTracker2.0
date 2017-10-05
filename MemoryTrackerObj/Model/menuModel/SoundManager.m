//
//  SoundManager.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "SoundManager.h"
#import "Constants.h"

@implementation SoundManager

@synthesize soundState;
@synthesize player;

- (SoundManager *)initWith:(NSString *)musicFileName {
    self = [super init];
    
    [self initPlayer:musicFileName type:MTMelodyType];
    
    // in first launch app value will be nil
    if (![[NSUserDefaults standardUserDefaults] valueForKey:MTSoundState]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:MTSoundState];
    }

    return self;
}

- (BOOL)soundState {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:MTSoundState] boolValue];;
}

- (void)setSoundState:(BOOL)soundState {
    [[NSUserDefaults standardUserDefaults] setBool:soundState forKey:MTSoundState];
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
