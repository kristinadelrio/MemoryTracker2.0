//
//  MenuManager.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "MenuManager.h"
#import "Constants.h"
#import "SoundManager.h"

@implementation MenuManager

@synthesize soundManagerState;
@synthesize levelIndex;

SoundManager* soundManager;

- (id) init {
    self = [super init];
    soundManager = [[SoundManager alloc] initWith: @"melody"];
    
    // in first launch app value will be nil
    if ([[NSUserDefaults standardUserDefaults] valueForKey: @"levelIndex"] == NULL)
    {
        [[NSUserDefaults standardUserDefaults] setInteger: 0 forKey: @"levelIndex"];
    }
    
    return self;
}

- (int) levelIndex {
    return [[[NSUserDefaults standardUserDefaults] valueForKey: @"levelIndex"] intValue];
}

- (void) setLevelIndex: (int) levelIndex {
    [[NSUserDefaults standardUserDefaults] setInteger: levelIndex forKey: @"levelIndex"];
}

- (bool) soundManagerState {
    return soundManager.soundState;
}

- (void) setSoundManagerState: (bool) soundState {
    soundManager.soundState = soundState;
}

- (void) playBackgroundMusic {
    [soundManager playMusic];
}

- (void) stopBackgroundMusic {
    [soundManager stopMusic];
}

@end

