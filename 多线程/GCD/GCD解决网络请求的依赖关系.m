1.线程同步 -- 组队列（dispatch_group）

//使用方式1
dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
dispatch_group_t group = dispatch_group_create();

dispatch_group_async(group, queue, ^{ /*加载图片1 */ });
dispatch_group_async(group, queue, ^{ /*加载图片2 */ });
dispatch_group_async(group, queue, ^{ /*加载图片3 */ }); 
//内部本身是异步的,不会阻塞当前线程
dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 合并图片… …
});

//使用方式2 
//创建一个dispatch_group_t， 每次网络请求前先dispatch_group_enter(该方法后面的异步任务会被纳入到队列组的监听范围),请求回调后再dispatch_group_leave,对于enter和leave必须配合使用，有几次enter就要有几次leave，否则group会一直存在。当所有enter的block都leave后，会执行dispatch_group_notify的block。
dispatch_group_t dispatchGroup = dispatch_group_create();
//进入(网络请求开始前)
dispatch_group_enter(dispatchGroup);
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"第一个请求完成");
    //离开(网络请求结束后)
    dispatch_group_leave(dispatchGroup);
});

//进入(网络请求开始前)
dispatch_group_enter(dispatchGroup);
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"第二个请求完成");
    //离开(网络请求结束后)
    dispatch_group_leave(dispatchGroup);
});
//不会阻塞当前线程,马上返回
dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
    NSLog(@"请求完成");
});


//阻塞当前的线程,直到dispatch group中的所有任务完成才会返回,可能会卡住主线程,造成页面卡顿,谨慎使用
dispatch_group_wait(serviceGroup,DISPATCH_TIME_FOREVER);

2.栅栏函数（dispatch_barrier):

/* 创建并发队列,注意:不能使用全局并发队列,只能使用自己创建的并发队列 */
dispatch_queue_t concurrentQueue = dispatch_queue_create("test.concurrent.queue", DISPATCH_QUEUE_CONCURRENT);
/* 添加两个并发操作A和B，即A和B会并发执行 */
dispatch_async(concurrentQueue, ^(){
    NSLog(@"OperationA");
});
dispatch_async(concurrentQueue, ^(){
    NSLog(@"OperationB");
});
//栅栏函数 (其之前的全局并发队列正常执行,但是其以后的队列会在之前的队列执行完毕之后执行,起到了一个阻隔的作用)（注意：该函数只能搭配自定义并行队列 dispatch_queue_t 使用。不能使用： dispatch_get_global_queue ，否则 dispatch_barrier_async 的作用会和 dispatch_async 的作用一模一样。 ）
/* 添加barrier障碍操作，会等待前面的并发操作结束，并暂时阻塞后面的并发操作直到其完成 */
dispatch_barrier_async(concurrentQueue, ^(){
    NSLog(@"OperationBarrier!");
});
/* 继续添加并发操作C，要等待barrier障碍操作结束才能开始 */
dispatch_async(concurrentQueue, ^(){
    NSLog(@"OperationC");
});

3.线程同步 -- 信号量机制（dispatch_semaphore）：先执行任务一,任务一执行完毕再去执行任务二

/* 创建一个信号量 */
dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
/* 任务1 */
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    /* 耗时任务1 */
    NSLog(@"任务1开始");
    [NSThread sleepForTimeInterval:3];
    NSLog(@"任务1结束");
    /* 任务1结束，发送信号告诉任务2可以开始了 */
    dispatch_semaphore_signal(semaphore);
});
/* 任务2 */
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    /* 等待任务1结束获得信号量, 无限等待 */
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    /* 如果获得信号量则开始任务2 */
    NSLog(@"任务2开始");
    [NSThread sleepForTimeInterval:3];
    NSLog(@"任务2结束");
});

//我们每一次遍历，都让其dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER)，这个时候线程会等待，阻塞当前线程，直到dispatch_semaphore_signal(sem)调用之后，而我们dispatch_semaphore_signal(sem)是在网络请求的回调里调用的

    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
    for (int i=0; i<10; i++) {
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"%d---%d",i,i);
            dispatch_semaphore_signal(sem);
        }];
        
        [task resume];
        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"end");
    });