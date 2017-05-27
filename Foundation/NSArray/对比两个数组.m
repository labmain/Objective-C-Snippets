// 1.对比较连顺序也有要求的请用
- (BOOL)compareArr:(NSArray *)array1 With:(NSArray *)array2
{
    return [array1 isEqualToArray:array2];
}

// 2.对比较连顺序无要求 只需比较是否相同的请用
- (BOOL)compareArr:(NSArray *)array1 With:(NSArray *)array2
{
    NSSet *setOld = [NSSet setWithArray:array1];
    NSSet *setNew = [NSSet setWithArray:array2];

    return [setOld isEqualToSet:setNew];
}
