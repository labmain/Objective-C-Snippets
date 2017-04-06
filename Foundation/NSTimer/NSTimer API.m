/*    NSTimer.h
    Copyright (c) 1994-2015, Apple Inc. All rights reserved.
*/

#import <Foundation/NSObject.h>
#import <Foundation/NSDate.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer : NSObject

/**  这下面主要是一些构造方法*/


// Use the timerWithTimeInterval:invocation:repeats: or timerWithTimeInterval:target:selector:userInfo:repeats: class method to create the timer object without scheduling it on a run loop. (After creating it, you must add the timer to a run loop manually by calling the addTimer:forMode: method of the corresponding NSRunLoop object.)
// 创建一个定时器，但是么有添加到运行循环，我们需要在创建定时器后手动的调用 NSRunLoop 对象的 addTimer:forMode: 方法。
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;

// Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
// 创建一个timer并把它指定到一个默认的runloop模式中，并且在 TimeInterval时间后 启动定时器
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;

// Use the timerWithTimeInterval:invocation:repeats: or timerWithTimeInterval:target:selector:userInfo:repeats: class method to create the timer object without scheduling it on a run loop. (After creating it, you must add the timer to a run loop manually by calling the addTimer:forMode: method of the corresponding NSRunLoop object.)
// 创建一个定时器，但是么有添加到运行循环，我们需要在创建定时器后手动的调用 NSRunLoop 对象的 addTimer:forMode: 方法。
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

// Creates and returns a new NSTimer object and schedules it on the current run loop in the default mode.
// 创建一个timer并把它指定到一个默认的runloop模式中，并且在 TimeInterval时间后 启动定时器
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

// 默认的初始化方法，（创建定时器后，手动添加到 运行循环，并且手动触发才会启动定时器）
- (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep NS_DESIGNATED_INITIALIZER;


// You can use this method to fire a repeating timer without interrupting its regular firing schedule. If the timer is non-repeating, it is automatically invalidated after firing, even if its scheduled fire date has not arrived.
// 启动 Timer 触发Target的方法调用但是并不会改变Timer的时间设置。 即 time没有到达到，Timer会立即启动调用方法且没有改变时间设置，当时间 time 到了的时候，Timer还是会调用方法。
- (void)fire;

// 这是设置定时器的启动时间，常用来管理定时器的启动与停止
@property (copy) NSDate *fireDate;
      // 启动定时器
          timer.fireDate = [NSDate distantPast];
      //停止定时器
          timer.fireDate = [NSDate distantFuture];
      // 开启
         [time setFireDate:[NSDate  distanPast]]
      // NSTimer   关闭
        ［time  setFireDate:[NSDate  distantFunture]］
      //继续。
        [timer setFireDate:[NSDate date]];


// 这个是一个只读属性，获取定时器调用间隔时间
@property (readonly) NSTimeInterval timeInterval;

// Setting a tolerance for a timer allows it to fire later than the scheduled fire date, improving the ability of the system to optimize for increased power savings and responsiveness. The timer may fire at any time between its scheduled fire date and the scheduled fire date plus the tolerance. The timer will not fire before the scheduled fire date. For repeating timers, the next fire date is calculated from the original fire date regardless of tolerance applied at individual fire times, to avoid drift. The default value is zero, which means no additional tolerance is applied. The system reserves the right to apply a small amount of tolerance to certain timers regardless of the value of this property.
// As the user of the timer, you will have the best idea of what an appropriate tolerance for a timer may be. A general rule of thumb, though, is to set the tolerance to at least 10% of the interval, for a repeating timer. Even a small amount of tolerance will have a significant positive impact on the power usage of your application. The system may put a maximum value of the tolerance.

// 这是7.0之后新增的一个属性，因为NSTimer并不完全精准，通过这个值设置误差范围
@property NSTimeInterval tolerance NS_AVAILABLE(10_9, 7_0);

// 停止 Timer ---> 唯一的方法将定时器从循环池中移除
- (void)invalidate;

// 获取定时器是否有效
@property (readonly, getter=isValid) BOOL valid;

// 获取参数信息---> 通常传入的是 nil
@property (nullable, readonly, retain) id userInfo;

@end

NS_ASSUME_NONNULL_END
