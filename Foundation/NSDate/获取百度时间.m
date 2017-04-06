- (NSDate*)requireBAIDUTIME {

NSString*urlString =@"http://www.baidu.com";

NSString* urlStringg = [urlStringstringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

//实例化NSMutableURLRequest，并进行参数配置

NSMutableURLRequest*request = [[NSMutableURLRequestalloc]init];

[requestsetURL:[NSURLURLWithString: urlStringg]];

[requestsetCachePolicy:NSURLRequestReloadIgnoringCacheData];

[requestsetTimeoutInterval:2];

[requestsetHTTPShouldHandleCookies:FALSE];

[requestsetHTTPMethod:@"GET"];

NSHTTPURLResponse*response;

[NSURLConnectionsendSynchronousRequest:request

returningResponse:&responseerror:nil];

//处理返回的数据

//NSString *strReturn = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];

PALog(@"response is %@",response);

NSString*date = [[responseallHeaderFields]objectForKey:@"Date"];

PALog(@"获取网络的字符串......%@",date);

date = [datesubstringFromIndex:5];

date = [datesubstringToIndex:[datelength]-4];

NSDateFormatter*dMatter = [[NSDateFormatteralloc]init];

NSTimeZone*timeZone = [NSTimeZonetimeZoneWithName:@"GMT"];

[dMatter setTimeZone:timeZone];

dMatter.locale= [[NSLocalealloc]initWithLocaleIdentifier:@"en_US_POSIX"];

[dMattersetDateFormat:@"dd MMM yyyy HH:mm:ss"];

NSDate *netDate = [[dMatter dateFromString:date]dateByAddingTimeInterval:60*60*8];

PALog(@"来自网络的最后时间%@",netDate);

returnnetDate;

}
