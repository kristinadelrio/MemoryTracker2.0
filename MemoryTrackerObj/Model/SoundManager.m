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
    
    
    [self initPlayer: musicFileName type: @"mp3"];
    
    // in first launch app value will be nil
    if ([[NSUserDefaults standardUserDefaults] valueForKey: @"SoundState"] == NULL)
    {
        [[NSUserDefaults standardUserDefaults] setBool: true forKey: @"SoundState"];
    }

    return self;
}

- (bool) soundState
{
    return [[[NSUserDefaults standardUserDefaults] valueForKey: @"SoundState"] boolValue];;
}

- (void) setSoundState: (bool) soundState
{
    [[NSUserDefaults standardUserDefaults] setBool: soundState forKey: @"SoundState"];
}

- (void) initPlayer: (NSString*) name type: (NSString*) type
{
    
    NSURL* url = [[NSBundle mainBundle] URLForResource: name withExtension: type];

    //NSString *resourcePath = [[NSBundle mainBundle] pathForResource: @"melody" ofType: @"mp3"];
    //NSURL* url = [[NSURL alloc] initWithString: resourcePath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: url error: NULL];
    
    
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
