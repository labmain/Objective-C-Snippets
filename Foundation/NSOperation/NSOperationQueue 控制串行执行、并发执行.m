/*
关键属性 maxConcurrentOperationCount，叫做最大并发操作数。用来控制一个特定队列中可以有多少个操作同时参与并发执行。

maxConcurrentOperationCount 默认情况下为-1，表示不进行限制，可进行并发执行。
maxConcurrentOperationCount 为1时，队列为串行队列。只能串行执行。
maxConcurrentOperationCount 大于1时，队列为并发队列。操作并发执行，当然这个值不应超过系统限制，即使自己设置一个很大的值，系统也会自动调整为 min{自己设定的值，系统设定的默认最大值}。
*/

/**
 * 设置 MaxConcurrentOperationCount（最大并发操作数）
 */
- (void)setMaxConcurrentOperationCount {

    // 1.创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];

    // 2.设置最大并发操作数
    queue.maxConcurrentOperationCount = 1; // 串行队列
// queue.maxConcurrentOperationCount = 2; // 并发队列
// queue.maxConcurrentOperationCount = 8; // 并发队列

    // 3.添加操作
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"1---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"2---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"3---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
    [queue addOperationWithBlock:^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2]; // 模拟耗时操作
            NSLog(@"4---%@", [NSThread currentThread]); // 打印当前线程
        }
    }];
}