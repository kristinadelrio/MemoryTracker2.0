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
    NSString *durationString;
    
    NSDate *now = [NSDate date];
    NSDate *startDate = [now earlierDate:self];
    NSDate *endDate = (startDate == now) ? self : now;
    
    NSDateComponents *components = [[NSCalendar currentCalendar]
                                    components: NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute fromDate: startDate toDate: endDate options: 0];
    
    NSArray *timeUnits = [[NSArray alloc] initWithObjects:
                    [[NSNumber alloc] initWithInteger:[components weekOfYear]],
                    [[NSNumber alloc] initWithInteger:[components day]],
                    [[NSNumber alloc] initWithInteger:[components hour]],
                    [[NSNumber alloc] initWithInteger:[components minute]],
                    [[NSNumber alloc] initWithInteger:[components second]], nil];
    
    
    durationString = [self createDurationStringWith:timeUnits andStrAnalog:@"week"];


    return durationString ? durationString : @"";
}

- (NSString *)createDurationStringWith:(NSArray *)timeUnits andStrAnalog: (NSString *)insertor {
    NSString *durationString;
    NSInteger ind = 0;
    while (ind < [timeUnits count] && !durationString) {
        NSInteger timeUnit = [[timeUnits objectAtIndex:ind++] integerValue];
        if (timeUnit > 0) {
            if(timeUnit > 1) {
                durationString = [durationString initWithFormat: @"%li %@ s ago", (long)timeUnit, insertor];
                break;
            } else {
                durationString = [durationString initWithFormat: @"%li %@ ago", (long)timeUnit, insertor];
                break;
            }
        }
    }
    
    return durationString;
}

@end


