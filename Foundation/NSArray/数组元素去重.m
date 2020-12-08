1.利用NSDictionary的AllKeys（AllValues）方法
可以将NSArray中的元素存入一个字典，然后利用AllKeys或者AllValues取得字典的所有键或值，这些键或值都是去重的。
示例代码：
    NSArray *arr = @[@111,@222,@111];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (NSNumber *number in arr) {
        [dict setObject:number forKey:number];
    }
    NSLog(@"%@",[dict allValues]);
输出结果为：
2013-05-21 12:03:49.449 test1[4377:c07] (
    111,
    222
)

2.利用NSSet的AllObjects方法
这种方法更快，利用NSSet不会添加重复元素的特性。不过去重的数组没有进行排序，如果需要排序，可以使用NSSortDescriptor类。
示例代码：
    NSArray *arr = @[@111,@222,@111];
    NSSet *set = [NSSet setWithArray:arr];
    NSLog(@"%@",[set allObjects]);
输出结果为：
2013-05-21 12:06:26.508 test1[4547:c07] (
    111,
    222
)
