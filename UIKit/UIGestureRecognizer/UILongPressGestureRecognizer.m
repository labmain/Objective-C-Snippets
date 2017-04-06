- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    if (![longPressGesture respondsToSelector:@selector(locationInView:)]) {
        [longPressGesture release];
        longPressGesture = nil;
    }else {
        longPressGesture.delegate = self;
        longPressGesture.numberOfTapsRequired = 0;      // The default number of taps is 0.
        longPressGesture.minimumPressDuration = 0.1f;    // The default duration is is 0.5 seconds.
        longPressGesture.numberOfTouchesRequired = 1;   // The default number of fingers is 1.
        longPressGesture.allowableMovement = 10;        // The default distance is 10 pixels.
        [self.view addGestureRecognizer:longPressGesture];
    }
}


- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer
{
    UIView *view = [gestureRecognizer view]; // 这个view是手势所属的view，也就是增加手势的那个view

    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateEnded:{ // UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded
            NSLog(@"======UIGestureRecognizerStateEnded || UIGestureRecognizerStateRecognized");
            break;
        }
        case UIGestureRecognizerStateBegan:{ //
            NSLog(@"======UIGestureRecognizerStateBegan");
            break;
        }
        case UIGestureRecognizerStateChanged:{ //
            NSLog(@"======UIGestureRecognizerStateChanged");
            break;
        }
        case UIGestureRecognizerStateCancelled:{ //
            NSLog(@"======UIGestureRecognizerStateCancelled");
            break;
        }
        case UIGestureRecognizerStateFailed:{ //
            NSLog(@"======UIGestureRecognizerStateFailed");
            break;
        }
        case UIGestureRecognizerStatePossible:{ //
            NSLog(@"======UIGestureRecognizerStatePossible");
            break;
        }
        default:{
            NSLog(@"======Unknow gestureRecognizer");
            break;
        }
    }
}

// 询问一个手势接收者是否应该开始解释执行一个触摸接收事件
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    CGPoint currentPoint = [gestureRecognizer locationInView:self.view];
    if (CGRectContainsPoint(CGRectMake(0, 0, 100, 100), currentPoint) ) {  
        return YES;
    }

    return NO;
}

// 询问delegate，两个手势是否同时接收消息，返回YES同事接收。返回NO，不同是接收（如果另外一个手势返回YES，则并不能保证不同时接收消息）the default implementation returns NO。
// 这个函数一般在一个手势接收者要阻止另外一个手势接收自己的消息的时候调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return NO;
}

// 询问delegate是否允许手势接收者接收一个touch对象
// 返回YES，则允许对这个touch对象审核，NO，则不允许。
// 这个方法在touchesBegan:withEvent:之前调用，为一个新的touch对象进行调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    return YES;
}
