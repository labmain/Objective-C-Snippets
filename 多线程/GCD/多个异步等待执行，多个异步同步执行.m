typedef void (^someBlock)(BOOL success);

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // [self test111];
//    [self test222];
    [self test333];
}
/// 多个异步同步执行
- (void)test111
{
// dispatch_group_notify 等待调度组执行完毕之后，再执行自己的。
    dispatch_group_t serviceGroup = dispatch_group_create();

// Start the first task
    dispatch_group_enter(serviceGroup);

    [self startTask:5  Block:^(BOOL success) {
        NSLog(@"1111");

        dispatch_group_leave(serviceGroup);
    }];

// Start the second task
    dispatch_group_enter(serviceGroup);

    [self startTask:1 Block:^(BOOL success) {
        NSLog(@"222");
        dispatch_group_leave(serviceGroup);
    }];

    dispatch_group_notify(serviceGroup, dispatch_get_main_queue(), ^{
        NSLog(@"finish");
    });

    NSLog(@"next");
}
/// 多个异步等待执行
- (void)test222
{
// 创建一个调度组，使用wait监听进组出组的情况，当调度组计数为0的时候，进行下一步。
    dispatch_group_t serviceGroup = dispatch_group_create();

// Start the first task
    dispatch_group_enter(serviceGroup);

    [self startTask:5  Block:^(BOOL success) {
        NSLog(@"1111");
        dispatch_group_leave(serviceGroup);
    }];

    dispatch_group_wait(serviceGroup, DISPATCH_TIME_FOREVER);

// Start the second task
    dispatch_group_enter(serviceGroup);

    [self startTask:1 Block:^(BOOL success) {
        NSLog(@"222");
        dispatch_group_leave(serviceGroup);
    }];

    dispatch_group_wait(serviceGroup, DISPATCH_TIME_FOREVER);

    NSLog(@"finish");
}
// 跟 test222 道理一样，循环顺序等待调用异步方法
- (void)test333
{
    // 创建一个调度组，使用wait监听进组出组的情况，当调度组计数为0的时候，进行下一步。
    dispatch_group_t serviceGroup = dispatch_group_create();

    for (int i = 0; i < 3; i++) {
        dispatch_group_wait(serviceGroup, DISPATCH_TIME_FOREVER);
        // Start the first task
        dispatch_group_enter(serviceGroup);

        [self startTask:2  Block:^(BOOL success) {
            NSLog(@"这是第%d个任务",i);
            dispatch_group_leave(serviceGroup);
        }];
    }
    dispatch_group_wait(serviceGroup, DISPATCH_TIME_FOREVER);

    NSLog(@"finish");
}
- (void)startTask:(NSInteger)time Block:(someBlock)block
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
            block(YES);
        });
    });
}
