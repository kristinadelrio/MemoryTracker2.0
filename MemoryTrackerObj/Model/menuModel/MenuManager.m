//
//  MenuManager.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import "MenuManager.h"
#import "SoundManager.h"
#import "Constants.h"

@implementation MenuManager
{
    SoundManager *soundManager;
}

- (instancetype)init {
    
    if (self = [super init]) {
        soundManager = [[SoundManager alloc] initWith:@"melody"];
    
        // in first launch app value will be nil
        if (![[NSUserDefaults standardUserDefaults] valueForKey:MTLevelIndex]) {
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:MTLevelIndex];
        }
    }
    
    return self;
}

- (int)levelIndex {
    return [[[NSUserDefaults standardUserDefaults] valueForKey:MTLevelIndex] intValue];
}

- (void)setLevelIndex:(int)levelIndex {
    [[NSUserDefaults standardUserDefaults] setInteger:levelIndex forKey:MTLevelIndex];
}

- (BOOL)soundManagerState {
    return soundManager.soundState;
}

- (void)setSoundManagerState:(BOOL)soundState {
    soundManager.soundState = soundState;
}

- (void)playBackgroundMusic {
    [soundManager playMusic];
}

- (void)stopBackgroundMusic {
    [soundManager stopMusic];
}

@end

