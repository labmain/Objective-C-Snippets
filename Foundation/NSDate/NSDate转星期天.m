 - (NSString *)weekdayStringFromDate:(NSDate *)inputDate
{
    if (!inputDate) return @"";
    NSArray *weekdays = [NSArray arrayWithObjects:@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    NSString *weekDay = [weekdays objectAtIndex:(theComponents.weekday - 1)];
    return weekDay;
}