//
//  NSDate+ARTExtension.m
//  ARTToolKit
//
//  Created by mrSir18 on 2023/6/20.
//

#import "NSDate+ARTExtension.h"

@implementation NSDate (ARTExtension)

#pragma mark - API Formatter Utils
- (NSString *)art_stringWithDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:self];
}

- (NSString *)art_dateString
{
    return [self art_stringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

#pragma mark - API Calendar Utils
- (NSDate *)art_firstDayOfCurrentMonth
{
    NSDate *firstDate = nil;
    BOOL status = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth
                                                  startDate:&firstDate
                                                   interval:NULL
                                                    forDate:self];
    NSAssert(status, @"Failed to calculate the first day of the month based on %@", self);
    return firstDate;
}

- (NSUInteger)art_daysOfCurrentMonth
{
    NSRange range = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay
                                                       inUnit:NSCalendarUnitMonth
                                                      forDate:self];
    return range.length;
}

#pragma mark - API Basic Utils
- (NSInteger)art_getYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = {
        NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
    };
    return [[calendar components:unitFlags fromDate:self] year];
}

- (NSInteger)art_getMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = {
        NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
    };
    return [[calendar components:unitFlags fromDate:self] month];
}

- (NSInteger)art_getDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = {
        NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
    };
    return [[calendar components:unitFlags fromDate:self] day];
}

- (NSUInteger)art_getWeekly
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay
                                                   inUnit:NSCalendarUnitWeekOfMonth
                                                  forDate:self];
}

- (NSInteger)art_getHour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = {
        NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
    };
    return [[calendar components:unitFlags fromDate:self] hour];
}

- (NSInteger)art_getMinute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = {
        NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
    };
    return [[calendar components:unitFlags fromDate:self] minute];
}

- (NSInteger)art_getSecond
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = {
        NSCalendarUnitYear | NSCalendarUnitMonth  | NSCalendarUnitDay |
        NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
    };
    return [[calendar components:unitFlags fromDate:self] second];
}

#pragma mark - API Class Utils
+ (NSString *)art_getMsecTimeslotString
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0.0f];
    NSTimeInterval time = [date timeIntervalSince1970] * 1000.0f;
    return [NSString stringWithFormat:@"%.0f", time];
}

+ (NSString *)art_getTimeslotString
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0.0f];
    NSTimeInterval time = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f", time];
}

@end
