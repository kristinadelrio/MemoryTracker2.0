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

{
    AVAudioPlayer* player;
}
- (initiate) init;
@end

#endif /* SoundManager_h */
