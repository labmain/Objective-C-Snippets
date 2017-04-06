-(void)viewDidLoad{

    UISwipeGestureRecognizer *recognizer; 
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    // 右滑
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    // 左滑
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    // 上滑
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionUp)];
    [[self view] addGestureRecognizer:recognizer];
    
    UISwipeGestureRecognizer *recognizer;
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    // 下滑
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionDown)];
    [[self view] addGestureRecognizer:recognizer];

}

-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer{
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionDown) {
    
        NSLog(@"swipe down");
            //执行程序
    }
    if(recognizer.direction==UISwipeGestureRecognizerDirectionUp) {
    
        NSLog(@"swipe up");
            //执行程序
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
    
        NSLog(@"swipe left");
            //执行程序
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
    
        NSLog(@"swipe right");
        //执行程序
    }

}

