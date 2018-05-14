NSTimer 自带的方法中是没有暂停和继续的方法的，

但是NSTimer有个方法是 setFireDate

可以利用这个方法实现暂停和继续

创建：

创建一个定时器进行重复执行一个方法

_timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(method) userInfo:nil repeats:true];



暂停：

原理是把触发时间设置在未来，既很久之后，这样定时器自动进入等待触发的状态，估计要等很久。。。 

[_timer setFireDate:[NSDatedistantFuture]];



开始：

原理是把触发时间设置为现在，设置后定时器马上进入工作状态。

[_timer setFireDate:[NSDatedate]];



停止：

系统自带方法，停止定时器


[_timerinvalidate];
