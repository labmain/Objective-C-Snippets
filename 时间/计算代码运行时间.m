// 第一种：（最简单的NSDate）
NSDate* tmpStartData = [NSDate date];
//You code here...
double deltaTime = [[NSDate date] timeIntervalSinceDate:tmpStartData];
NSLog(@"cost time = %f", deltaTime);

// 第二种：（将运行代码放入下面的Block中，返回时间）
#import <mach/mach_time.h>  // for mach_absolute_time() and friends

CGFloat BNRTimeBlock (void (^block)(void)) {
    mach_timebase_info_data_t info;
    if (mach_timebase_info(&info) != KERN_SUCCESS) return -1.0;

    uint64_t start = mach_absolute_time ();
    block ();
    uint64_t end = mach_absolute_time ();
    uint64_t elapsed = end - start;

    uint64_t nanos = elapsed * info.numer / info.denom;
    return (CGFloat)nanos / NSEC_PER_SEC;
}

// 第三种：
/**
 * 计算脚本时间
 * @param $last 最后一次的运行clock
 * @param $key  标识
 * @return 当前clock
 */
double t(double last, char* key){
    clock_t now = clock();
    printf("time:%fs \t key:%s \n", (last != 0) ? (double)(now - last) / CLOCKS_PER_SEC : 0, key);
    return now;
}

double t1 = t(0, "");
//do something
t(t1, "end");
