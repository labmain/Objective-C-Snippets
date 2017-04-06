NSString *myStr = @"GSBALDQ";
NSMutableArray *array = [NSMutableArray array];
/** 遍历 */
for(int i =0; i < [myStr length]; i++)
{
    [array addObject:[myStr substringWithRange:NSMakeRange(i, 1)]];
}
/** 排序 */
NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
/** 转换 */
myStr = [[sortedArray componentsJoinedByString:@","] stringByReplacingOccurrencesOfString:@"," withString:@""];
NSLog(@"str = %@", myStr);
