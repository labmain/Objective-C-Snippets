程序启动的完整过程
1.main函数
2.UIApplicationMain
    • 创建UIApplication对象
    • 创建UIApplication的delegate对象
3.delegate对象开始处理(监听)系统事件(没有storyboard)
    • 程序启动完毕的时候, 就会调用代理的application:didFinishLaunchingWithOptions:方法
    • 在application:didFinishLaunchingWithOptions:中创建UIWindow
    • 创建和设置UIWindow的rootViewController
    • 显示窗口
3.根据Info.plist获得最主要storyboard的文件名,加载最主要的storyboard(有storyboard)
    • 创建UIWindow
    • 创建和设置UIWindow的rootViewController
    • 显示窗口
    // 程序第一次加载完毕(app启动完毕后就会调用)
    - (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
    // 程序已经进入后台
// app进入后台的时候调用 一般在这里保存应用的数据(游戏数据,比如暂停游戏)
- (void)applicationDidEnterBackground:(UIApplication*)application
    // 程序将要进入前台
// 恢复数据
- (void)applicationWillEnterForeground:(UIApplication*)application
    // 程序将要失去焦点 - 不能交互
- (void)applicationWillResignActive:(UIApplication*)application
    // 程序已经获取焦点 - 可以交互
- (void)applicationDidBecomeActive:(UIApplication*)application
    // 程序挂了
// 注意:1.用户主动关闭 2.系统因为内存不够关闭了程序
- (void)applicationWillTerminate:(UIApplication*)application
    // 程序接收到内存警告,清除不需要再使用的内存
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
