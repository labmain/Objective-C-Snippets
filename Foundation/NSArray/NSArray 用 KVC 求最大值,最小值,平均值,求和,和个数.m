//获取数组中的最大值和最小值 @min.self
NSArray *array = @[@4, @84, @2];
NSLog(@"max = %@", [array valueForKeyPath:@"@max.self"]);

//平均值和求和
NSLog(@"%@", [array valueForKeyPath:@"@sum.self"]);

//平均值和求平均值
NSLog(@"%@", [array valueForKeyPath:@"@avg.self"]);

//求数组中元素的个数
NSLog(@"共%@个", [array valueForKeyPath:@"@count.self"]);