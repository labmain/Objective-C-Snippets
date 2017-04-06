/** 距离今天还有几天（小于今天是负数，大于今天正数，今天为0） */
+ (NSInteger)returnLastTime:(NSDate *)time
{
    NSDate *d = time;
    
    NSTimeInterval late=[d timeIntervalSince1970]*1;

    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval now=[dat timeIntervalSince1970]*1;
    NSString *timeString=@"";

    NSTimeInterval cha =  late - now;
    timeString = [NSString stringWithFormat:@"%f", cha/86400];
    timeString = [timeString substringToIndex:timeString.length-7];

    return [timeString integerValue];
}
