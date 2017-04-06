- (void)applicationWillResignActive:(UIApplication *)application;
//说明：当应用程序将要入非活动状态执行，在此期间，应用程序不接收消息或事件，比如来电话了

- (void)applicationDidBecomeActive:(UIApplication *)application;
//说明：当应用程序入活动状态执行，这个刚好跟上面那个方法相反

- (void)applicationDidEnterBackground:(UIApplication *)application;
//说明：当程序被推送到后台的时候调用。所以要设置后台继续运行，则在这个函数里面设置即可

- (void)applicationWillEnterForeground:(UIApplication *)application;
//说明：当程序从后台将要重新回到前台时候调用，这个刚好跟上面的那个方法相反。

- (void)applicationWillTerminate:(UIApplication *)application;
//说明：当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置UIApplicationExitsOnSuspend的键值。

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application;
//说明：iPhone设备只有有限的内存，如果为应用程序分配了太多内存操作系统会终止应用程序的运行，在终止前会执行这个方法，通常可以在这里进行内存清理工作防止程序被终止

- (void)applicationSignificantTimeChange:(UIApplication*)application;
//说明：当系统时间发生改变时执行

- (void)applicationDidFinishLaunching:(UIApplication*)application;
//说明：当程序载入后执行

- (void)application:(UIApplication)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame;
//说明：当StatusBar框将要变化时执行

- (void)application:(UIApplication*)application willChangeStatusBarOrientation:
(UIInterfaceOrientation)newStatusBarOrientation
           duration:(NSTimeInterval)duration;
//说明：当StatusBar框方向将要变化时执行

- (BOOL)application:(UIApplication*)application handleOpenURL:(NSURL*)url;
//说明：当通过url执行

- (void)application:(UIApplication*)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation;
//说明：当StatusBar框方向变化完成后执行

- (void)application:(UIApplication*)application didChangeSetStatusBarFrame:(CGRect)oldStatusBarFrame;
//说明：当StatusBar框变化完成后执行
