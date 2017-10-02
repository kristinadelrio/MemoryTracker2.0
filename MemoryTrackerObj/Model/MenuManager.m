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

- (id) init
{
    soundManager = [[SoundManager alloc] initWith: @"melody"];
    
    // in first launch app value will be nil
    if ([[NSUserDefaults standardUserDefaults] valueForKey: LEVEL_PATH] == NULL)
    {
        [[NSUserDefaults standardUserDefaults] setInteger: 0 forKey: LEVEL_PATH];
    }
    
    return self;
}

- (int) levelIndex
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey: LEVEL_PATH] intValue];
}

- (void) setLevelIndex: (int) levelIndex
{
    [[NSUserDefaults standardUserDefaults] setInteger: levelIndex forKey: LEVEL_PATH];
}

- (bool) soundManagerState
{
    return soundManager.soundState;
}

- (void) setSoundManagerState: (bool) soundState
{
    soundManager.soundState = soundState;
}

@end

