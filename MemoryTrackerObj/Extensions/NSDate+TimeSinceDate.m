//
//  NSDate+TimeSinceDate.m
//  MemoryTrackerObj
//
//  Created by Alejandro Del Rio Albrechet on 10/5/17.
//  Copyright © 2017 Kristina Del Rio Albrechet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+TimeSinceDate.h"

@implementation NSDate (TimeSinceDate)

- (NSString *)timeSinceDate {
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components: NSCalendarUnitWeekOfYear|NSCalendarUnitDay|
                                    NSCalendarUnitHour|NSCalendarUnitMinute
                                    fromDate: self
                                    toDate: [NSDate date]
                                    options: 0];
    
    return [self createDateStringWithComponents:components];
}

- (NSString *)createDateStringWithComponents:(NSDateComponents *)components  {
    if (components.weekOfYear > 1) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd MMMM yyyy"];
        
        return [formatter stringFromDate:self];
        
    } else if (components.weekOfYear == 1) {
        return @"1 week ago";
        
    } else if (components.day > 1) {
        return [NSString stringWithFormat:@"%i days ago", (int)components.day];
        
    } else if (components.day == 1) {
        return @"1 day ago";
        
    } else if (components.hour > 1) {
        return [NSString stringWithFormat:@"%i hours ago", (int)components.hour];
        
    } else if (components.hour == 1) {
        return @"1 hour ago";
        
    } else if (components.minute > 1) {
        return [NSString stringWithFormat:@"%i minutes ago", (int)components.minute];
        
    } else if (components.minute == 1) {
        return @"1 minute ago";
    }
    
    return @"just now";
}

@end


