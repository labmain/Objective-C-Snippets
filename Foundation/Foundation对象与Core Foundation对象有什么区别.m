// Foundation对象与Core Foundation对象有什么区别
// 1> Foundation对象是OC的，Core Foundation对象是C对象
// 2> 数据类型之间的转换
//  ARC:__bridge_retained、__bridge_transfer
// 在ARC模式下, 不能直接将OC字符串转换成C语言字符串

// 因为C语言的字符不受ARC控制
NSString *str = [NSString stringWithFormat:@"lnj"];
// 注意点, 在ARC中要将OC字符串转换成C语言字符串必须使用__bridge
// 如果是通过__bridge <#type#>  抓获并没有转换它的所有权
CFStringRef strRef = (__bridge CFStringRef)str;
NSString *str = [NSString stringWithFormat:@"lnj"];
// 如果通过__bridge_retained会转换所有权
CFStringRef strRef = (__bridge_retained CFStringRef)str;
//NSLog(@"%@ %@", str, strRef);
// 注意因为转换了所有权, 所以C语言的字符串在不需要使用的时候要进行释放
CFRelease(strRef);
    
    
CFStringRef strRef2 = CFStringCreateWithCString(NULL, "xxoo", kCFStringEncodingASCII);
// 直接转换, 没有转换对象所有权
//NSString *str2 = (__bridge NSString *)strRef2;
// 注意因为转换了所有权, 所以C语言的字符串在不需要使用的时候要进行释放
NSString *str2 = (__bridge_transfer NSString *)strRef2;
 NSLog(@"%@ %@", str2, strRef2);

 非ARC: __bridge
// 在非ARC情况下, Fondation中的对象可以和Core Foundation中的对象直接转换
// OC --> C
NSString *str = @"lnj";
CFStringRef strRef = (CFStringRef)str;
//NSLog(@"%@ %@", str, strRef);
//[str release];
//NSLog(@"%@", strRef);
CFRelease(strRef);
NSLog(@"%@", str);
    
 // C --> OC
 CFStringRef strRef2 = CFStringCreateWithCString(NULL, "xxoo", kCFStringEncodingASCII);
 NSString *str2 = (NSString *)strRef2;
 NSLog(@"%@ %@", str2, strRef2);
/*
 总结:
 非ARC中可以直接转换, 因为非ARC是手动管理内存
 在ARC中, 由于不是手动管理内存, 而CF的对象不受ARC管理, 所以要使用__bridge相关的关键字
  想通过OC-->C  __bridge_retained
  想通过C-->OC  __bridge_transfer
 还可以用 __bridge 但是 __bridge是直接转换对象,并没有转换所有权
 */
