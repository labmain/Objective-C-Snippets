// 1.1用于创建NSDate实例的类方法有

+ (id)date;
//返回当前时间

+ (id)dateWithTimeIntervalSinceNow:(NSTimeInterval)secs;   
//返回以当前时间为基准，然后过了secs秒的时间

+ (id)dateWithTimeIntervalSinceReferenceDate:(NSTimeInterval)secs;
//返回以2001/01/01 GMT为基准，然后过了secs秒的时间

+ (id)dateWithTimeIntervalSince1970:(NSTimeInterval)secs;
//返回以1970/01/01 GMT为基准，然后过了secs秒的时间

+ (id)distantFuture;
//返回很多年以后的未来的某一天。
//比如你需要一个比现在(Now)晚(大)很长时间的时间值，则可以调用该方法。测试返回了4000/12/31 16:00:00

+ (id)distantPast;
//返回很多年以前的某一天。
//比如你需要一个比现在(Now)早(小)大很长时间的时间值，则可以调用该方法。测试返回了公元前0001/12/31 17:00:00

// 1.2 用于创建NSDate实例的实例方法有

- (id)addTimeInterval:(NSTimeInterval)secs;
//返回以目前的实例中保存的时间为基准，然后过了secs秒的时间



// 1.3用于初始化NSDate实例的实例方法有
- (id)init;

//初始化为当前时间。类似date方法
- (id)initWithTimeIntervalSinceReferenceDate:(NSTimeInterval)secs;
//初始化为以2001/01/01 GMT为基准，然后过了secs秒的时间。类似dateWithTimeIntervalSinceReferenceDate:方法

- (id)initWithTimeInterval:(NSTimeInterval)secs sinceDate:(NSDate *)refDate;

//初始化为以refDate为基准，然后过了secs秒的时间
- (id)initWithTimeIntervalSinceNow:(NSTimeInterval)secs;
//初始化为以当前时间为基准，然后过了secs秒的时间

