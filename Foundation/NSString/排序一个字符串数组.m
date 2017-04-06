方法一：

NSArray *ary = @[@"a3",@"a1",@"a2",@"a10",@"a24"];
NSLog(@"%@",ary);
NSArray *myary = [ary sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
    return (NSComparisonResult)[obj1 compare:obj2 options:NSNumericSearch];
}];
NSLog(@"%@",myary);
结果
 ( a3,a1, a2, a10, a24 )
 ( a1, a2,a3, a10, a24 )
方法二：

NSArray *ary = @[@"a3",@"a1",@"a2",@"a24",@"a14"];
NSLog(@"%@",ary);
NSSortDescriptor *sd1 = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];//yes升序排列，no,降序排列
NSArray *myary = [ary sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sd1, nil]];//注意这里的ary进行排序后会生产一个新的数组指针，myary，不能在用ary,ary还是保持不变的。
NSLog(@"%@",myary);
//    (a3, a1, a2,a24,a14)
//    (a3, a24, a2, a14, a1)
方法三：

[ary sortedArrayUsingSelector:@selector(compare:)];//这个是一直默认升序
