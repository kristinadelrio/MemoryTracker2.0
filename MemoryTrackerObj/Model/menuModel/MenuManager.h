//
//  MenuManager.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/2/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef MenuManager_h
#define MenuManager_h

#import <Foundation/Foundation.h>

@interface MenuManager: NSObject

@property int levelIndex;
@property BOOL soundManagerState;

- (void)stopBackgroundMusic;
- (void)playBackgroundMusic;

@end

#endif /* MenuManager_h */
