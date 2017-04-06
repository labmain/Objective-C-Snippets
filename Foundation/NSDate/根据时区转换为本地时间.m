//方法一
- (void)tDate {
    NSDate *date = [NSDatedate];
    NSTimeZone *zone = [NSTimeZonesystemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    NSLog(@"%@", localeDate);
}

// 方法二
- (NSString *)dateAsString: (NSDate *)date {
    NSString *returnValue = @"";
    NSDateFormatter *dateFormatter = nil;
    if (date != nil) {
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatteralloc] init];
        }
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
        [dateFormatter setLocale:[NSLocalecurrentLocale]];
        returnValue = [dateFormatter stringFromDate:date];
    }
    return returnValue;
}
