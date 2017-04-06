- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    /*
       同一个手势只能指定一个方向，不能同时指定多个方向，要指定多个方向 必须用多个手势
     */

    // right
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![swipeGestureRight respondsToSelector:@selector(locationInView:)]) {
        [swipeGestureRight release];
        swipeGestureRight = nil;
    } else {
        swipeGestureRight.delegate = self;
        swipeGestureRight.numberOfTouchesRequired = 1;                        // 手指个数 The default value is 1.
        swipeGestureRight.direction = UISwipeGestureRecognizerDirectionRight; // 同一个手势只能指定一个方向，不能同时指定多个方向，要指定多个方向 必须用多个手势
        [self.view addGestureRecognizer:swipeGestureRight];
    }

    // left
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![swipeGestureLeft respondsToSelector:@selector(locationInView:)]) {
        [swipeGestureLeft release];
        swipeGestureLeft = nil;
    } else {
        swipeGestureLeft.delegate = self;
        swipeGestureLeft.numberOfTouchesRequired = 1;                       // 手指个数 The default value is 1.
        swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft; // 同一个手势只能指定一个方向，不能同时指定多个方向，要指定多个方向 必须用多个手势
        [self.view addGestureRecognizer:swipeGestureLeft];
    }

    // Up
    UISwipeGestureRecognizer *swipeGestureUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![swipeGestureUp respondsToSelector:@selector(locationInView:)]) {
        [swipeGestureUp release];
        swipeGestureUp = nil;
    } else {
        swipeGestureUp.delegate = self;
        swipeGestureUp.numberOfTouchesRequired = 1;                     // 手指个数 The default value is 1.
        swipeGestureUp.direction = UISwipeGestureRecognizerDirectionUp; // 同一个手势只能指定一个方向，不能同时指定多个方向，要指定多个方向 必须用多个手势
        [self.view addGestureRecognizer:swipeGestureUp];
    }

    // Down
    UISwipeGestureRecognizer *swipeGestureDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![swipeGestureDown respondsToSelector:@selector(locationInView:)]) {
        [swipeGestureDown release];
        swipeGestureDown = nil;
    } else {
        swipeGestureDown.delegate = self;
        swipeGestureDown.numberOfTouchesRequired = 1;                       // 手指个数 The default value is 1.
        swipeGestureDown.direction = UISwipeGestureRecognizerDirectionDown; // 同一个手势只能指定一个方向，不能同时指定多个方向，要指定多个方向 必须用多个手势
        [self.view addGestureRecognizer:swipeGestureDown];
    }
}

- (void)handleGesture:(UISwipeGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view

    /*
       direction属性： 用来指明手势滑动的方向的。
     */
    UISwipeGestureRecognizerDirection direction = gestureRecognizer.direction;
    switch (direction) {
        case UISwipeGestureRecognizerDirectionRight: {
            NSLog(@"direction==UISwipeGestureRecognizerDirectionRight");
            break;
        }
        case UISwipeGestureRecognizerDirectionLeft: {
            NSLog(@"direction==UISwipeGestureRecognizerDirectionLeft");
            break;
        }
        case UISwipeGestureRecognizerDirectionUp: {
            NSLog(@"direction==UISwipeGestureRecognizerDirectionUp");
            break;
        }
        case UISwipeGestureRecognizerDirectionDown: {
            NSLog(@"direction==UISwipeGestureRecognizerDirectionDown");
            break;
        }
        default:
            break;
    }

    /*
       轻扫手势

       这个一般情况下只响应UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized
     */
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateEnded: { // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");
            break;
        }
        default: {
            NSLog(@"======Unknow gestureRecognizer");
            break;
        }
    }
}
