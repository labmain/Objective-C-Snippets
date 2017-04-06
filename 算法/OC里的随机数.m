// OC 中常用的产生随机数的方法有arc4random,  arc4random_uniform,random。下面以产生[0, 100)的随机数为例来说明。

0.arc4random
// 函数原型

u_int32_t    arc4random(void);
// arc4random（）产生的随机数范围较大

arc4random() % 100;

2.arc4random_uniform
// 函数原型

u_int32_t arc4random_uniform(u_int32_t /*upper_bound*/);
// 使用arc4random_uniform可以直接指定上限

arc4random_uniform(100);

3.random
// 函数原型

long random(void);
// 使用random需要先种种子

srandom((unsigned int)time(time_t *)NULL); //初始化时，设置下种子
random() % 100;
