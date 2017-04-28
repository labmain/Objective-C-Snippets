//获取数组中的最大值和最小值 @min.self
NSArray *array = @[@4, @84, @2];
NSLog(@"max = %@", [array valueForKeyPath:@"@max.self"]);

//平均值和求和
NSLog(@"%@", [array valueForKeyPath:@"@sum.self"]);

//平均值和求平均值
NSLog(@"%@", [array valueForKeyPath:@"@avg.self"]);

//求数组中元素的个数
NSLog(@"共%@个", [array valueForKeyPath:@"@count.self"]);


// 可以使用. 来一层一层向下索引，当多个字典层级时，取子层级中的属性就非常简单了
NSDictionary *dict1 = @{@"dic1":@{@"dic2":@{@"name":@"lisi",@"info":@{@"age":@"12"}}}};
id res = [dict1 valueForKeyPath:@"dict1.dict2.name"];
// 最后可以输出：res = lisi


// 对NSDictionary数组快速找出相应key对的值
NSArray *array = @[@{@"name": @"cookeee",@"code": @1},
@{@"name": @"jim",@"code": @2},
@{@"name": @"jim",@"code": @1},
@{@"name": @"jbos",@"code": @1}];

NSLog(@"%@", [array valueForKeyPath:@"name"]);
(
cookeee,
jim,
jim,
jbos
