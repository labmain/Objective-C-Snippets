NSMutableIndexSet *indexSets = [[NSMutableIndexSet alloc] init];
for (int i = 0; i < self.buddyList.count; i++) {
    for (int j = 0; j < self.group.members.count; j++) {
        if ([self.buddyList[i].username isEqualToString:self.group.members[j]]) {
            NSLog(@"%@",self.buddyList[i].username);
            // 标记需要删除的位置
            [indexSets addIndex:i];
        }
    }
}
[self.buddyList removeObjectsAtIndexes:indexSets];

// 无需循环 直接 过滤
NSArray *array1 = @[@"aaa",@"bbb",@"ccc"];
NSArray *array2 = @[@"bbb",@"ccc",@"xxx"];

NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",array2];

NSArray * filter = [array1 filteredArrayUsingPredicate:filterPredicate];

NSLog(@"%@",filter);
/*
输出
(
aaa
)
*/
