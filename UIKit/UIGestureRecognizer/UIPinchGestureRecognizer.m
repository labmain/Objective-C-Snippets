- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![pinchGesture respondsToSelector:@selector(locationInView:)]) {
        [pinchGesture release];
        pinchGesture = nil;
    } else {
        pinchGesture.delegate = self;
        [self.view addGestureRecognizer:pinchGesture];
    }
}

- (void)handleGesture:(UIPinchGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view

    /*
       scale属性： 可以理解为两手指之间的距离，其实是个比例，相对距离，不是绝对距离
                以刚开始的两个手指对应的两个point的之间的距离为标准，此时scale=1.
                若两手指之间距离减小，则scale不断变小，当两指重合，则变为0
                若两手指之间距离变大，则scale不断增大，没有上限，看屏幕多大

       velocity属性： 可以理解为两手指之间的移动速度，其实是个速度比例，相对速度，不是绝对速度
                以刚开始的两个手指对应的两个point的之间的距离为标准，此时velocity=0.
                若两手指之间距离减小，则velocity为负数，从-0开始，随着手指向里捏合的速度越快，负值越大，没有上限，我测试了下，可以到-20.009099，甚至更大
                若两手指之间距离变大，则velocity不断正数，没有上限，从0开始，随着手指向外捏合的速度越快，值越大，没有上限，我测试了下，可以到170.234663，甚至更大
                注意：在这个过程中，出现了nan值。
                     有关NAN值的介绍如下：（http://www.cnblogs.com/konlil/archive/2011/07/06/2099646.html）

       浮点异常值：NAN，QNAN，SNAN

       32位浮点数在机器中的表示按照IEEE的标准是这样的：
     +------+----------------+-------------------------------+
     | 1bit    |   8bit               |         23bit                            |
     +------+----------------+-------------------------------+
       其中：1bit表示符号位（0表示正，1表示负），8bit表示指数（0~255，实际指数取值还要减去127，即指数取值区间为-127~128）,23bit表示尾数。
       这里所要说的浮点异常值就是这种表示产生的几种特殊值，IEEE规定根据指数和尾数的不同分别可表示如下几种特殊值：
       1. 零值：按上述的浮点表述形式如果指数部分全部为0，并且尾数全部为0，则表示为浮点0.0，并且规定-0 = +0
       2. 非规格化值：如果指数全部为0，尾数非0，则表示非规格化的值，16进制看到的就是[80xxxxxx]h或者[00xxxxxx]h
       3. 无穷值：如果指数全部为1，尾数全部为0，则根据符号位分别表示正无穷大和负无穷大，16进制看到的就是[FF800000]h或者[7F800000]h
       4. NAN：主角来了，如果指数全部为1，尾数非0，则表示这个值不是一个真正的值（Not A Number）。NAN又分成两类：QNAN（Quiet NAN）和SNAN（Singaling NAN）。QNAN与SNAN的不同之处在于，QNAN的尾数部分最高位定义为1，SNAN最高位定义为0；QNAN一般表示未定义的算术运算结果，最常见的莫过于除0运算；SNAN一般被用于标记未初始化的值，以此来捕获异常。
       那么既然NAN不是一个真实的数值，在程序如何判断变量是否变成了NAN呢？大部分语言中针对NAN值都有一系列的函数定义，C语言中最常见的三个函数：
       _isnan(double x);                  //判断是否为NAN
       _finite(double x);                  //判读是否为无穷大
       _fpclass(double x);                //返回一系列的定义值，如：_FPCLASS_QNAN, _FPCLASS_SNAN，具体参考MSDN

     */
    CGFloat scale = gestureRecognizer.scale;
    NSLog(@"======scale: %f", scale);

    CGFloat velocity = gestureRecognizer.velocity;
    NSLog(@"======scvelocityale: %f", velocity);

    /*
       捏合手势

       这个一般情况下只响应
       UIGestureRecognizerStateBegan、
       UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized、
       UIGestureRecognizerStateChanged消息，
       一个UIGestureRecognizerStateBegan，接下去是N多的UIGestureRecognizerStateChanged，scale的值此时会不断的变化，当手指离开时，响应UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized
     */
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateEnded: { // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");
            break;
        }
        case UIGestureRecognizerStateBegan: { //
            NSLog(@"======UIGestureRecognizerStateBegan");
            break;
        }
        case UIGestureRecognizerStateChanged: { //
            NSLog(@"======UIGestureRecognizerStateChanged");

            gestureRecognizer.view.transform = CGAffineTransformScale(gestureRecognizer.view.transform, gestureRecognizer.scale, gestureRecognizer.scale);
            gestureRecognizer.scale = 1; // 重置，很重要！！！

            break;
        }
        case UIGestureRecognizerStateCancelled: { //
            NSLog(@"======UIGestureRecognizerStateCancelled");
            break;
        }
        case UIGestureRecognizerStateFailed: { //
            NSLog(@"======UIGestureRecognizerStateFailed");
            break;
        }
        case UIGestureRecognizerStatePossible: { //
            NSLog(@"======UIGestureRecognizerStatePossible");
            break;
        }
        default: {
            NSLog(@"======Unknow gestureRecognizer");
            break;
        }
    }
}
