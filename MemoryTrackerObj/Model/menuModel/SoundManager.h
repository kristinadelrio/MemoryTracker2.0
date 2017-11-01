//
//  SoundManager.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef SoundManager_h
#define SoundManager_h

#import <AVFoundation/AVFoundation.h>

@interface SoundManager: NSObject

@property BOOL soundState;
@property AVAudioPlayer *player;

- (instancetype)initWith: (NSString *)musicFileName;
- (void)playMusic;
- (void)stopMusic;

@end

#endif /* SoundManager_h */
