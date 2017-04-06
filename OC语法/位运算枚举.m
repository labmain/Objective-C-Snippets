// 位运算枚举
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {    二进制值    十进制
    UIViewAutoresizingNone                 = 0,         0000 0000  0
    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,    0000 0001  1
    UIViewAutoresizingFlexibleWidth        = 1 << 1,    0000 0010  2
    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,    0000 0100  4
    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,    0000 1000  8
    UIViewAutoresizingFlexibleHeight       = 1 << 4,    0001 0000  16
    UIViewAutoresizingFlexibleBottomMargin = 1 << 5     0010 0000  32
};
// 使用枚举定义选项,每个选项均可启用或禁用，使用上述方式来定义枚举值,每个枚举值所对应的二进制表示中，只有1个二进制位的值是1。
// 用“按位或操作符”可组合多个选项,用 | 来隔开，如下述实例：
- (void)viewDidLoad {
    [super viewDidLoad];

    [self todo:UIViewAutoresizingFlexibleLeftMargin|
               UIViewAutoresizingFlexibleRightMargin|
               UIViewAutoresizingFlexibleHeight];
}

-(void)todo:(UIViewAutoresizing)type{
    if (type==0) {
        NSLog(@"UIViewAutoresizingNone");
        return;
    }
    if (type & UIViewAutoresizingFlexibleLeftMargin) {
        NSLog(@"UIViewAutoresizingFlexibleLeftMargin");
    }
    if (type & UIViewAutoresizingFlexibleWidth) {
        NSLog(@"UIViewAutoresizingFlexibleWidth");

    }
    if (type & UIViewAutoresizingFlexibleRightMargin) {
        NSLog(@"UIViewAutoresizingFlexibleRightMargin");

    }
    if (type & UIViewAutoresizingFlexibleTopMargin) {
        NSLog(@"UIViewAutoresizingFlexibleTopMargin");

    }
    if (type & UIViewAutoresizingFlexibleHeight) {
        NSLog(@"UIViewAutoresizingFlexibleHeight");

    }
    if (type & UIViewAutoresizingFlexibleBottomMargin) {
        NSLog(@"UIViewAutoresizingFlexibleBottomMargin");
    }
}

// 位移枚举在传入参数时,是使用 或运算 的方式,
/*
// 比如传进来的值是 10,也就是 1010 ;
//1010;
//0010;
 让 10 与上 2 得 2
 让 10 与上 8 得 8
 所以只要二进制位上有值, 就能获得对应的值

 */
//传多个参数 3个
//| (或运算符)   0|1 = 1 0|0 = 0 1|1 = 1  只要有1那么结果就是1
//& (与运算符)   0&1 = 0 0&0 = 0 1&1 = 1  只要有0那么结果就是0


// 输出结果：
/*
UIViewAutoresizingFlexibleLeftMargin
UIViewAutoresizingFlexibleRightMargin
UIViewAutoresizingFlexibleHeight
*/

// 具体见： ~/Users/shun/Dropbox/MySnippets/C/位运算.c
