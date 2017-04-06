- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![tapGesture respondsToSelector:@selector(locationInView:)]) {
        [tapGesture release];
        tapGesture = nil;
    } else {
        tapGesture.delegate = self;
        tapGesture.numberOfTapsRequired = 1;    // The default value is 1.
        tapGesture.numberOfTouchesRequired = 1; // The default value is 1.
        [self.view addGestureRecognizer:tapGesture];
    }
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view

    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateEnded: { // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded // 正常情况下只响应这个消息
            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");
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

// 询问一个手势接收者是否应该开始解释执行一个触摸接收事件
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
//    CGPoint currentPoint = [gestureRecognizer locationInView:self.view];
//    if (CGRectContainsPoint(CGRectMake(0, 0, 100, 100), currentPoint) ) {
//        return YES;
//    }
//
//    return NO;

    return YES;
}

// 询问delegate，两个手势是否同时接收消息，返回YES同事接收。返回NO，不同是接收（如果另外一个手势返回YES，则并不能保证不同时接收消息）the default implementation returns NO。
// 这个函数一般在一个手势接收者要阻止另外一个手势接收自己的消息的时候调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return NO;
}

// 询问delegate是否允许手势接收者接收一个touch对象
// 返回YES，则允许对这个touch对象审核，NO，则不允许。
// 这个方法在touchesBegan:withEvent:之前调用，为一个新的touch对象进行调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return YES;
}
