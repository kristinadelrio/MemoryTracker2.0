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

- (id) initWith: (NSString*) musicFileName
{
    self = [super init];
    [self initPlayer: musicFileName type: SOUND_TYPE];
    
    // in first launch app value will be nil
    if ([[NSUserDefaults standardUserDefaults] valueForKey: SOUND_STATE] == NULL)
    {
        [[NSUserDefaults standardUserDefaults] setBool: true forKey: SOUND_STATE];
    }

    return self;
}

- (bool) soundState
{
    return [[NSUserDefaults standardUserDefaults] valueForKey: SOUND_STATE];
}

- (void) setSoundState: (bool) soundState
{
    [[NSUserDefaults standardUserDefaults] setBool: soundState forKey: SOUND_STATE];
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
