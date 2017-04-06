//获取到当前的时间
NSDate *nowDate = [NSDate date];

//创建一个工具，一个封装了具体年月日、时秒分、周、季度等的类
NSDateComponents *dateComponents = [[NSDateComponents alloc] init];

//创建一个日历，它提供了大部分的日期计算接口，并且允许您在NSDate和NSDateComponents之间转换
NSCalendar *dateCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

// NSDate 转 NSDateComponents所需要设置的值，可根据需要自己设置，这里是年～秒全部获取，如果某个没有写的话，比如NSCalendarUnitHour，你转成NSDateComponents后，会是一个很大或很小的数
NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

//为dateComponents获取值，该值等价于nowDate
dateComponents = [dateCalendar components:unitFlags fromDate:nowDate];

//创建一个NSDateComponents，开始设置你想要的时间
NSDateComponents *myCompoentes = [[NSDateComponents alloc] init];

//下面的值可以按照你的意愿去替换
[myCompoentes setYear:dateComponents.year];

[myCompoentes setMonth:dateComponents.month];

[myCompoentes setWeekday:dateComponents.weekday];

[myCompoentes setDay:dateComponents.day];

[myCompoentes setHour:dateComponents.hour+1];

[myCompoentes setMinute:dateComponents.minute];

[myCompoentes setSecond:dateComponents.second];

//把通过myCompoentes设置的值转为NSDate格式，这个NSDate就是你想要的时间
NSDate *myDate = [dateCalendar dateFromComponents:myCompoentes];

NSLog(@"%@", myDate);
