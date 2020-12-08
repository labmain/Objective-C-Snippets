取消操作方法
// 可取消操作，实质是标记 isCancelled 状态。
- (void)cancel;

判断操作状态方法
// 判断操作是否已经结束。
- (BOOL)isFinished;
// 判断操作是否已经标记为取消。
- (BOOL)isCancelled;
// 判断操作是否正在在运行。
- (BOOL)isExecuting;
// 判断操作是否处于准备就绪状态，这个值和操作的依赖关系相关。
- (BOOL)isReady;


操作同步
// 阻塞当前线程，直到该操作结束。可用于线程执行顺序的同步。
- (void)waitUntilFinished; 
// completionBlock 会在当前操作执行完毕时执行 completionBlock。
- (void)setCompletionBlock:(void (^)(void))block;
// 添加依赖，使当前操作依赖于操作 op 的完成。
- (void)addDependency:(NSOperation *)op;
// 移除依赖，取消当前操作对操作 op 的依赖。
- (void)removeDependency:(NSOperation *)op; 
// 在当前操作开始执行之前完成执行的所有操作对象数组。
@property (readonly, copy) NSArray<NSOperation *> *dependencies;