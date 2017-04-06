- (NSTimeInterval)timeIntervalSinceDate:(NSDate *)refDate;
//以refDate为基准时间，返回实例保存的时间与refDate的时间间隔

- (NSTimeInterval)timeIntervalSinceNow;
//以当前时间(Now)为基准时间，返回实例保存的时间与当前时间(Now)的时间间隔

- (NSTimeInterval)timeIntervalSince1970;
//以1970/01/01 GMT为基准时间，返回实例保存的时间与1970/01/01 GMT的时间间隔

- (NSTimeInterval)timeIntervalSinceReferenceDate;
//以2001/01/01 GMT为基准时间，返回实例保存的时间与2001/01/01 GMT的时间间隔

+ (NSTimeInterval)timeIntervalSinceReferenceDate;
//以2001/01/01 GMT为基准时间，返回当前时间(Now)与2001/01/01 GMT的时间间隔