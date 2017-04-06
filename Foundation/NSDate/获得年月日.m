// 1.NSDateFormat获取
NSDate *date =[NSDate date];//简书 FlyElephant
NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
[formatter setDateFormat:@"yyyy"];
NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
[formatter setDateFormat:@"MM"];
NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
[formatter setDateFormat:@"dd"];
NSInteger currentDay=[[formatter stringFromDate:date] integerValue];

// 2.NSDateComponents获取
NSLog(@"currentDate = %@ ,year = %ld ,month=%ld, day=%ld",date,currentYear,currentMonth,currentDay);
NSDate  *currentDate = [NSDate date];
NSCalendar *calendar = [NSCalendar currentCalendar];
NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
NSInteger year=[components year];
NSInteger month=[components month];
NSInteger day=[components day];
NSLog(@"currentDate = %@ ,year = %ld ,month=%ld, day=%ld",currentDate,year,month,day);
