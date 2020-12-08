// YSCOperation.h 文件
#import <Foundation/Foundation.h>

@interface YSCOperation : NSOperation

@end

// YSCOperation.m 文件
#import "YSCOperation.h"

@implementation YSCOperation

- (void)main {
    if (!self.isCancelled) {
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---%@", [NSThread currentThread]);
        }
    }
}

@end

然后使用的时候导入头文件YSCOperation.h。
/**
 * 使用自定义继承自 NSOperation 的子类
 */
- (void)useCustomOperation {
    // 1.创建 YSCOperation 对象
    YSCOperation *op = [[YSCOperation alloc] init];
    // 2.调用 start 方法开始执行操作
    [op start];
}