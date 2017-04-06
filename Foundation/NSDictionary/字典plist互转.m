将字典写入文件中
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;

实例：
//快速创建字典
NSDictionary *dict3 = @{@"zs" : @"zhangsan", @"ls" : @"lisi", @"ww" : @"Wangwu"}; ;
//将字典写入到文件中
[dict3 writeToFile:@"/Users/liwei/Desktop/dict.plist" atomically:YES];

从文件中读取字典到内存中
+ (id)dictionaryWithContentsOfFile:(NSString *)path;
//保存结果是xml文件格式,但苹果官方推荐为plist后缀。 把字典放到NSArray中,调用array的writeToFile
+ (id)dictionaryWithContentsOfURL:(NSURL *)url;
