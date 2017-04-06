--常用方法：
------------Initializing------------
+ (id)currentCalendar;取得当前用户的逻辑日历(logical calendar)
+ (id)autoupdatingCurrentCalendar;取得当前用户的逻辑日历(logical calendar)
- (id)initWithCalendarIdentifier:(NSString *)identifier;
identifier的范围可以是:NSGregorianCalendar 阳历、NSBuddhistCalendar 佛历、NSChineseCalendar 中国日历、NSHebrewCalendar 希伯来日历、NSIslamicCalendar 伊斯兰日历、NSIslamicCivilCalendar 伊斯兰民事日历、NSJapaneseCalendar 日本日历
- (void)setLocale:(NSLocale *)locale;设置区域
- (void)setTimeZone:(NSTimeZone *)tz;设置时区
- (void)setFirstWeekday:(NSUInteger)value;设定每周的第一天从星期几开始，比如:. 如需设定从星期日开始，则value传入1；. 如需设定从星期一开始，则value传入2;
- (void)setMinimumDaysInFirstWeek:(NSUInteger)value;设定作为(每年及每月)第一周必须包含的最少天数，比如: 如需设定第一周最少包括7天，则value传入7;
------------Getting Information About a Calendar------------
- (NSString *)calendarIdentifier返回日历标示符(identifier)。
- (NSLocale *)locale;返回日历指定的地区信息。
- (NSTimeZone *)timeZone;返回日历指定的时区信息。
- (NSUInteger)firstWeekday;
- (NSRange)maximumRangeOfUnit:(NSCalendarUnit)unit;返回单元的最大范围。
就Gregorian来说有:
NSEraCalendarUnit => 0 - 2；
NSYearCalendarUnit => 1 - 10000；
NSMonthCalendarUnit = 1 - 12；
NSDayCalendarUnit = 1 - 31；
NSHourCalendarUnit = 0 - 24；
NSMinuteCalendarUnit = 0 - 60；
NSSecondCalendarUnit = 0 - 60；
NSWeekCalendarUnit = 1 - 53；
NSWeekdayCalendarUnit = 1 - 7
- (NSRange)minimumRangeOfUnit:(NSCalendarUnit)unit;返回单元的最小范围。
- (NSUInteger)ordinalityOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
返回某个特定时间(date)其对应的小的时间单元(smaller)在大的时间单元(larger)中的顺序，比如:
要取得2008/11/12在当月的第几周则可以这样调用该方法:[calendar ordinalityOfUnit:NSWeekOrdinalCalendarUnit inUnit: NSWeekCalendarUnit forDate: someDate]; 注: someDate存放了2008/11/12
- (NSRange)rangeOfUnit:(NSCalendarUnit)smaller inUnit:(NSCalendarUnit)larger forDate:(NSDate *)date
返回某个特定时间(date)其对应的小的时间单元(smaller)在大的时间单元(larger)中的范围，比如:
. 要取得2008/11/12在所在月份的日期范围则可以这样调用该方法:[calendar ordinalityOfUnit:NSDayCalendarUnit inUnit: NSMonthCalendarUnit forDate:fDate]; 则返回1-31。注: fDate存放了2008/11/12
- (BOOL)rangeOfUnit:(NSCalendarUnit)unit startDate:(NSDate **)sDate interval:(NSTimeInterval *)unitSecs forDate:(NSDate *)date;
用于返回日期date(参数)所在的那个日历单元unit(参数)的开始时间(sDate)。其中参数unit指定了日历单元，参数sDate用于返回日历单元的第一天，参数unitSecs用于返回日历单元的长度(以秒为单位)，参数date指定了一个特定的日期。如果startDate和interval均为可计算的，那么函数返回YES否则返回NO.注意statDate参数类型。
------------Calendrical Calculations------------
- (NSDateComponents *)components:(NSUInteger)unitFlags fromDate:(NSDate *)date；calendar根据unit格式将date分解成指定components；
- (NSDateComponents *)components:(NSUInteger)unitFlags fromDate:(NSDate *)startingDate toDate:(NSDate *)resultDate options:(NSUInteger)opts；calendar根据unit格式，返回俩个日期相差的components(这里components代表着a duration of time)
- (NSDate *)dateByAddingComponents:(NSDateComponents *)comps toDate:(NSDate *)date options:(NSUInteger)opts；返回一个时间，calendar在date基础上增加了components(这里components也代表着a duration of time)后；
- (NSDate *)dateFromComponents:(NSDateComponents *)comps；calendar用components计算出来的date
