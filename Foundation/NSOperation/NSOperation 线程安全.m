/**
 * 线程安全：使用 NSLock 加锁
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 */

- (void)initTicketStatusSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程

    self.ticketSurplusCount = 50;

    self.lock = [[NSLock alloc] init];  // 初始化 NSLock 对象

    // 1.创建 queue1,queue1 代表北京火车票售卖窗口
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1;

    // 2.创建 queue2,queue2 代表上海火车票售卖窗口
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    queue2.maxConcurrentOperationCount = 1;

    // 3.创建卖票操作 op1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketSafe];
    }];

    // 4.创建卖票操作 op2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketSafe];
    }];

    // 5.添加操作，开始卖票
    [queue1 addOperation:op1];
    [queue2 addOperation:op2];
}

/**
 * 售卖火车票(线程安全)
 */
- (void)saleTicketSafe {
    while (1) {
        // 加锁
        [self.lock lock];

        if (self.ticketSurplusCount > 0) {
            //如果还有票，继续售卖
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数:%d 窗口:%@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        }

        // 解锁
        [self.lock unlock];

        if (self.ticketSurplusCount <= 0) {
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}