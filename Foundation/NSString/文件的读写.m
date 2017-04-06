// 1.从文件写入
NSString *str = @"welecome to 北京";
[str writeToFile:@"文件的路径" atomically:原子性(YES/NO) encoding:NSUTF8StringEncoding error:nil];

// 2.文件的读取
NSString *str = [NSString stringWithContentsOfFile:@"待读取的文件的路径" encoding:NSUTF8StringEncoding(编码) error:&err(有没有错误)]

NSError *err;
NSString *str5 = [NSString stringWithContentsOfFile:@"/Users/apple/Desktop/t.txt" encoding:NSUTF8StringEncoding error:&err];
//注意如果读取到内容了,
if (err == nil)
{
    NSLog(@"读取成功的情况");
    NSLog(@"%@",str5);
}
else
{
    NSLog(@"读取失败的情况");
    //可以打印err的信息
    NSLog(@"%@",err);
    //可以通过 [err localizedDescription]; 打印简单的错误信息
    //NSLog(@"%@",[err localizedDescription]);
}
