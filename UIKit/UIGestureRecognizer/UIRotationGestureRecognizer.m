- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![rotationGesture respondsToSelector:@selector(locationInView:)]) {
        [rotationGesture release];
        rotationGesture = nil;
    } else {
        rotationGesture.delegate = self;

        [self.view addGestureRecognizer:rotationGesture];
    }
}

- (void)handleGesture:(UIRotationGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view

    /*
       rotation属性： 可以理解为两手指之间的旋转的角度，其实是个比例，相对角度，不是绝对角度
       以刚开始的两个手指对应的两个point的之间的那条直线为标准，此时rotation=1.
       向顺时针旋转，则rotation为正数且不断变大，当旋转360度时，rotation大概为6左右，如果继续顺时针旋转，则角度会不断增加，两圈为12左右，此时若逆时针旋转，角度则不断变小
       向逆时针旋转，则rotation为负数且不断变小，当旋转360度时，rotation大概为-6左右

       velocity属性： 可以理解为两手指之间的移动速度，其实是个速度比例，相对速度，不是绝对速度
       以刚开始的两个手指对应的两个point的之间的距离为标准，此时velocity=0.
       若两手指向顺时针旋转，则velocity为正数，从0开始，随着手指向里捏合的速度越快，值越大，没有上限
       若两手指向逆时针旋转，则velocity为负数数，没有上限，从-0开始，随着手指向外捏合的速度越快，值越小，没有上限
     */
    CGFloat rotation = gestureRecognizer.rotation;
    NSLog(@"===rotation: %f", rotation);

    CGFloat velocity = gestureRecognizer.velocity;
    NSLog(@"======velocity: %f", velocity);

    /*
       旋转手势

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

            gestureRecognizer.view.transform = CGAffineTransformRotate(gestureRecognizer.view.transform, gestureRecognizer.rotation);
            gestureRecognizer.rotation = 0; // 重置 这个相当重要！！！

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
