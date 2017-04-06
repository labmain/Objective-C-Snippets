- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];

    UIPanGestureRecognizer *panPressGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![panPressGesture respondsToSelector:@selector(locationInView:)]) {
        [panPressGesture release];
        panPressGesture = nil;
    } else {
        panPressGesture.delegate = self;
        panPressGesture.maximumNumberOfTouches = NSUIntegerMax;// The default value is NSUIntegerMax.
        /*
           NSUIntegerMax : The maximum value for an NSUInteger.
         */
        panPressGesture.minimumNumberOfTouches = 1;// The default value is 1.
        [view addGestureRecognizer:panPressGesture];
    }
}

// 拖拽手势
- (void)handleGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan: {
            NSLog(@"======UIGestureRecognizerStateBegan");
            break;
        }
        case UIGestureRecognizerStateChanged: {
            NSLog(@"======UIGestureRecognizerStateChanged");

            /*
               让view跟着手指移动

               1.获取每次系统捕获到的手指移动的偏移量translation
               2.根据偏移量translation算出当前view应该出现的位置
               3.设置view的新frame
               4.将translation重置为0（十分重要。否则translation每次都会叠加，很快你的view就会移除屏幕！）
             */

            CGPoint translation = [gestureRecognizer translationInView:self.view];
            view.center = CGPointMake(gestureRecognizer.view.center.x + translation.x, gestureRecognizer.view.center.y + translation.y);
            [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:self.view];//  注意一旦你完成上述的移动，将translation重置为0十分重要。否则translation每次都会叠加，很快你的view就会移除屏幕！
            break;
        }
        case UIGestureRecognizerStateCancelled: {
            NSLog(@"======UIGestureRecognizerStateCancelled");
            break;
        }
        case UIGestureRecognizerStateFailed: {
            NSLog(@"======UIGestureRecognizerStateFailed");
            break;
        }
        case UIGestureRecognizerStatePossible: {
            NSLog(@"======UIGestureRecognizerStatePossible");
            break;
        }
        case UIGestureRecognizerStateEnded: { // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
            /*
               当手势结束后，view的减速缓冲效果

               模拟减速写的一个很简单的方法。它遵循如下策略：
               计算速度向量的长度（i.e. magnitude）
               如果长度小于200，则减少基本速度，否则增加它。
               基于速度和滑动因子计算终点
               确定终点在视图边界内
               让视图使用动画到达最终的静止点
               使用“Ease out“动画参数，使运动速度随着时间降低
             */

            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");

            CGPoint velocity = [gestureRecognizer velocityInView:self.view];                  // 分别得出x，y轴方向的速度向量长度（velocity代表按照当前速度，每秒可移动的像素个数，分xy轴两个方向）
            CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y)); // 根据直角三角形的算法算出综合速度向量长度

            // 如果长度小于200，则减少基本速度，否则增加它。
            CGFloat slideMult = magnitude / 200;

            NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
            float slideFactor = 0.1 * slideMult; // Increase for more of a slide

            // 基于速度和滑动因子计算终点
            CGPoint finalPoint = CGPointMake(view.center.x + (velocity.x * slideFactor),
                                             view.center.y + (velocity.y * slideFactor));

            // 确定终点在视图边界内
            finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
            finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);

            [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                view.center = finalPoint;
            } completion:nil];

            break;
        }
        default: {
            NSLog(@"======Unknow gestureRecognizer");
            break;
        }
    }
}
