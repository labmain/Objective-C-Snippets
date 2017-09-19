NSString *regex = @"\\babc\\b";
NSString *searchText = @"// Do any abc-abc Abc after abc the view, typically from a nib.";
NSError *error;

// 不区分大小写
NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:&error];
// 对str字符串进行匹配
NSArray *matches = [regular matchesInString:searchText
                                    options:0
                                      range:NSMakeRange(0, searchText.length)];
// 遍历匹配后的每一条记录
for (NSTextCheckingResult *match in matches) {
    NSRange range = [match range];
    NSString *mStr = [searchText substringWithRange:range];
    NSLog(@"%@,%@", NSStringFromRange(range),mStr);
}
