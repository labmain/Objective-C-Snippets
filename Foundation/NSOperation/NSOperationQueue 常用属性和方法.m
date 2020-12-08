取消/暂停/恢复操作
// 可以取消队列的所有操作。
- (void)cancelAllOperations;
// 判断队列是否处于暂停状态。 YES 为暂停状态，NO 为恢复状态。
- (BOOL)isSuspended;
// 可设置操作的暂停和恢复，YES 代表暂停队列，NO 代表恢复队列。
- (void)setSuspended:(BOOL)b;

操作同步
// 阻塞当前线程，直到队列中的操作全部执行完毕。
- (void)waitUntilAllOperationsAreFinished;

添加/获取操作
// 向队列中添加一个 NSBlockOperation 类型操作对象。
- (void)addOperationWithBlock:(void (^)(void))block;
// 向队列中添加操作数组，wait 标志是否阻塞当前线程直到所有操作结束
- (void)addOperations:(NSArray *)ops waitUntilFinished:(BOOL)wait;
// 当前在队列中的操作数组（某个操作执行结束后会自动从这个数组清除）。
- (NSArray *)operations;
// 当前队列中的操作数。
- (NSUInteger)operationCount;

获取队列
// 获取当前队列，如果当前线程不是在 NSOperationQueue 上运行则返回 nil。
+ (id)currentQueue;
// 获取主队列。
+ (id)mainQueue;