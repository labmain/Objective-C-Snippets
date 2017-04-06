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