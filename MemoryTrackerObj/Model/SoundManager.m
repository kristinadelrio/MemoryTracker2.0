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

- (id) initWith: (NSString*) musicFileName
{
    self = [super init];
    [self initPlayer: musicFileName type: @".mp3"];
    
    // in first launch app value will be nil
    if ([[NSUserDefaults standardUserDefaults] valueForKey: @"SoundState"] == NULL)
    {
        [[NSUserDefaults standardUserDefaults] setBool: true forKey: @"SoundState"];
    }

    return self;
}

- (bool) soundState
{
    return [[NSUserDefaults standardUserDefaults] valueForKey: @"SoundState"];
}

- (void) setSoundState: (bool) soundState
{
    [[NSUserDefaults standardUserDefaults] setBool: soundState forKey: @"SoundState"];
}

- (void) initPlayer: (NSString*) name type: (NSString*) type
{
    NSString* musicFile = [[NSBundle mainBundle] pathForResource: name ofType: type];
    if (musicFile != NULL)
    {
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:
                  [[NSURL alloc] initWithString: musicFile] error: NULL];
    }
}

- (void) playMusic
{
    [player play];
}

- (void) stopMusic
{
    [player stop];
}

@end
