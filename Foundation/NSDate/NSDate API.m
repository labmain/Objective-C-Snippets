--常用方法：
------------Creating and Initializing Date Objects(创建)------------
--类方法：
+ (id)date;返回当前时间
+ (id)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs; 返回以当前时间为基准，然后过了secs秒的时间
+ (id)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)secs;返回以2001/01/01 GMT为基准，然后过了secs秒的时间
+ (id)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;返回以1970/01/01 GMT为基准，然后过了secs秒的时间
--实例方法：各方法效果都类似相关类方法
------------Getting Temporal Boundaries------------
+ (id)distantFuture;返回很多年以后的未来的某一天。
比如你需要一个比现在(Now)晚(大)很长时间的时间值，则可以调用该方法。测试返回了4000/12/31 16:00:00
+ (id)distantPast;返回很多年以前的某一天。
比如你需要一个比现在(Now)早(小)大很长时间的时间值，则可以调用该方法。测试返回了公元前0001/12/31 17:00:00
------------Comparing Dates(比较)------------
- (BOOL)isEqualToDate:(NSDate *)otherDate;
- (NSDate *)earlierDate:(NSDate *)anotherDate;与anotherDate比较，返回较早的那个日期
- (NSDate *)laterDate:(NSDate *)anotherDate;与anotherDate比较，返回较晚的那个日期
- (NSComparisonResult)compare:(NSDate *)other;
该方法用于排序时调用:
a.当实例保存的日期值与anotherDate相同时返回NSOrderedSame
b.当实例保存的日期值晚于anotherDate时返回NSOrderedDescending
c.当实例保存的日期值早于anotherDate时返回NSOrderedAscending
------------Getting Time Intervals(时间戳)------------
- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)refDate;以refDate为基准时间，返回实例保存的时间与refDate的时间间隔
- (NSTimeInterval)timeIntervalSinceNow;以当前时间(Now)为基准时间，返回实例保存的时间与当前时间(Now)的时间间隔
- (NSTimeInterval)timeIntervalSince1970;以1970/01/01 GMT为基准时间，返回实例保存的时间与1970/01/01 GMT的时间间隔
- (NSTimeInterval)timeIntervalSinceReferenceDate;以2001/01/01 GMT为基准时间，返回实例保存的时间与2001/01/01 GMT的时间间隔
+ (NSTimeInterval)timeIntervalSinceReferenceDate;以2001/01/01 GMT为基准时间，返回当前时间(Now)与2001/01/01 GMT的时间间隔
------------Adding a Time Interval------------
- (id)dateByAddingTimeInterval:(NSTimeInterval)ti；返回实例保存ti秒之后的时间
------------Representing Dates as Strings------------
– description;以YYYY-MM-DD HH:MM:SS ±HHMM的格式表示时间（2014-05-06 02:11:47 +0000）。其中 "±HHMM" 表示与GMT的存在多少小时多少分钟的时区差异。比如，若时区设置在北京，则 "±HHMM" 显示为 "+0800"。
- (NSString *)descriptionWithLocale:(id)locale;

----总结：
a.时间戳／date的值(程序存储的值)总是标准时间（格林威治区的时间），它跟当地时间存在一个对应关系。
b.当时间戳／date输出的时候，区别它显示的是当地的时间还是标准时间，不能仅仅看它是否跟当地时间相等而去判断一个时间戳的值对错；
c.注意NSDateFormatter、NSCalendar、NSDateComponents这些类有时区的属性，默认的是当地时区，所以它处理的结果都是对应着当地的时间情况，但存储的时间不一定符合当地时间；
