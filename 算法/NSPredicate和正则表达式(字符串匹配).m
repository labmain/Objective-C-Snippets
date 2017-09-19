简述：Cocoa 提供了NSPredicate 用于指定过滤条件，谓词是指在计算机中表示计算真假值的函数，它使用起来有点儿像SQL 的查询条件，主要用于从集合中分拣出符合条件的对象，也可以用于字符串的正则匹配。

定义(最常用到的方法)：

NSPredicate *ca = [NSPredicate predicateWithFormat:(NSString *), ...];
Format：
// (1)比较运算符>,<,==,>=,<=,!=
可用于数值及字符串
例：@"number > 100"


(2)范围运算符：IN、BETWEEN
例：@"number BETWEEN {1,5}"
    @"address IN {'shanghai','beijing'}"


(3)字符串本身:SELF
例：@"SELF == ‘APPLE’"


(4)字符串相关：BEGINSWITH、ENDSWITH、CONTAINS
例：@"name CONTAIN[cd] 'ang'"   //包含某个字符串
    @"name BEGINSWITH[c] 'sh'"     //以某个字符串开头
    @"name ENDSWITH[d] 'ang'"      //以某个字符串结束
    注:[c]不区分大小写[d]不区分发音符号即没有重音符号[cd]既不区分大小写，也不区分发音符号。


(5)通配符：LIKE
例：@"name LIKE[cd] '*er*'"    //*代表通配符,Like也接受[cd].
    @"name LIKE[cd] '???er*'"

(6)正则表达式：MATCHES
例：NSString *regex = @"^A.+e$";   //以A开头，e结尾
      @"name MATCHES %@",regex

// 谓词和正则表达式
在iOS4.0以前开发者一般是通过谓词（NSPredicate）和加入正则表达式的第三方库（如：RegexKitLite）来实现。其实从iOS4.0开始系统已经原生支持了正则表达式的使用，系统通过自有类NSRegularExpression和NSTextCheckingResult来实现正则表达式的创建和筛选。在表单验证中，我们经常会使用到正则，因为我们需要用它来判断用户输入的字符是否为合法的，如果是不合法的，那么应该提示用户输入错误，并不让提交至服务器。我们也可以通过正则表达式，从用户输入的字符串中过滤并获取我们想要的特定部分。总而言之，正则表达式是非常强大的。

#pragma mark - 方法一、谓词（NSPredicate）创建正则表达式

使用它来判断用户输入的字符串是否为合法的：

// 编写正则表达式：只能是数字或英文，或两者都存在
NSString *regex = @"^[a-z0－9A-Z]*$";
// 创建谓词对象并设定条件的表达式
NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
// 判断的字符串
NSString *str = @"Hello100";
// 对字符串进行判断
if ([predicate evaluateWithObject:str]) {
    NSLog(@"Match");
}
字符串Hello100是符合规则的，因此此例子会在日志输出"Match"。假如我们把“Hello100”换成其它字符（例如是“－、＝”），以上例子将不会输出任何东西。

#pragma mark - 方法二、NSRegularExpression类创建正则表达式

在前言里也说过，我们可以使用正则来过滤并获取我们想要的特定部分，实现方法也很简单，可以用到NSRegularExpression这个类实现：

NSString *url = @"1229436624@qq.com";
NSError *error;
// 创建NSRegularExpression对象并指定正则表达式
NSRegularExpression *regex = [NSRegularExpression
                regularExpressionWithPattern:@"[^@]*\\."
                options:0
                error:&error];
if (!error) { // 如果没有错误
  // 获取特特定字符串的范围
  NSTextCheckingResult *match = [regex firstMatchInString:url
                          options:0
                            range:NSMakeRange(0, [url length])];
  if (match) {
    // 截获特定的字符串
    NSString *result = [url substringWithRange:match.range];
    NSLog(@"%@",result);
  }
} else { // 如果有错误，则把错误打印出来
  NSLog(@"error - %@", error);
}
这个例子是从字符串里检索出以“@”开头“.”结尾的区间字符串，最后检索出来的字符串结尾包括“.”，因此此例子最终输出结果为“qq.”

#pragma mark - 方法三、NSRegularExpression类之抓取多个结果

当一个字符串有多个符合特定规则的字符，我们可以分别获取到符合特定规则的字符：

NSString *regex = @"\\-\\d*\\.";
NSString *str = @"-34023242.-34203020.";
NSError *error;
NSRegularExpression *regular = [NSRegularExpression regularExpressionWithPattern:regex
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:&error];
// 对str字符串进行匹配
NSArray *matches = [regular matchesInString:str
                                    options:0
                                      range:NSMakeRange(0, str.length)];
// 遍历匹配后的每一条记录
for (NSTextCheckingResult *match in matches) {
    NSRange range = [match range];
    NSString *mStr = [str substringWithRange:range];
    NSLog(@"%@", mStr);
}
从指定字符串中获取以“-”开头以“.”结尾的字符，因为可能有多个符合特定规则的字符串，因此我们需要把它们遍历出来，具体 输出结果如下：

[1748:467732] -34023242.
[1748:467732] -34203020.

#pragma mark - 方法四、 利用rangeOfString：option：直接查找

NSString *searchText = @"// Do any additional setup after loading the view, typically from a nib.";

NSRange range = [searchText rangeOfString:@"(?:[^,])*\\." options:NSRegularExpressionSearch];

if (range.location != NSNotFound) {
    NSLog(@"%@", [searchText substringWithRange:range]);
}

options中设定NSRegularExpressionSearch就是表示利用正则表达式匹配，会返回第一个匹配结果的位置。


总结：一般来说，判断用户输入的字符是否合法，只需要使用方法一就可以了。如果是需要捕获用户输入的特定内容，可以用方法二或方法三，如果是可能有多个捕获结果，那么可以使用方法三，否则使用方法二，如果想要检索并获取我们想要的部分，也可以使用方法四，方法四更为简洁，但是只能获取第一个匹配结果。
