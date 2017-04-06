@property (nonatomic, strong) NSTimer   *studyTimer;

self.studyTimer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(studyTimeAddUp) userInfo:nil repeats:YES];
[[NSRunLoop currentRunLoop] addTimer:_studyTimer forMode:NSRunLoopCommonModes];


// 注意 销毁！！！

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:YES];

    [_studyTimer invalidate];
    _studyTimer = nil;
}
