//
//  WinnerData.h
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/4/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#ifndef WinnerData_h
#define WinnerData_h

#import <Foundation/Foundation.h>

@interface WinnerData: NSObject<NSCoding>

@property NSString *username;
@property NSNumber *score;
@property NSDate *winDate;

- (WinnerData *)initWithUserName:(NSString *)name andScore:(NSInteger)score;
- (NSComparisonResult)compare:(WinnerData *)object;

@end

#endif /* WinnerData_h */
