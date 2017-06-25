// 使用 NSSet 去重复
NSArray *array1 = @[@"aaa",@"bbb",@"ccc"];
NSArray *array2 = @[@"bbb",@"ccc",@"xxx"];

NSArray *arrayT = [array1 arrayByAddingObjectsFromArray:array2];

NSSet *set = [NSSet setWithArray:arrayT];

NSLog(@"%@",[set allObjects]);
/*
输出：
(
    ccc,
    bbb,
    aaa,
    xxx
)
*/
