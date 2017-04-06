[NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]
// 结果为：1480834041

或者：
NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
NSTimeInterval a=[[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970];
NSString *timeString = [NSString stringWithFormat:@"%f", [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970]];
