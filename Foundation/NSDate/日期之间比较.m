- (BOOL)isEqualToDate:(NSDate *)otherDate;
//与otherDate比较，相同返回YES

- (NSDate *)earlierDate:(NSDate *)anotherDate;
//与anotherDate比较，返回较早的那个日期

- (NSDate *)laterDate:(NSDate *)anotherDate;
//与anotherDate比较，返回较晚的那个日期

- (NSComparisonResult)compare:(NSDate *)other;
/*
该方法用于排序时调用:
    . 当实例保存的日期值与anotherDate相同时返回NSOrderedSame
    . 当实例保存的日期值晚于anotherDate时返回NSOrderedDescending
    . 当实例保存的日期值早于anotherDate时返回NSOrderedAscending
*/
