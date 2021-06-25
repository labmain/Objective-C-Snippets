如果我们使用UINavigationController，会发现在原来的ViewController里修改状态栏的style不起作用了，但是控制状态栏的显示和隐藏依然OK。但是使用UITabBarController依然正常，状态栏不受UITabBarController影响。  
重写UINavigationController的三个方法：
```objc
- (UIStatusBarStyle)preferredStatusBarStyle
{
    NSLog(@"导航栏-%s",__func__);
    return [self.topViewController preferredStatusBarStyle];
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    NSLog(@"导航栏-%s",__func__);
    return UIStatusBarAnimationNone;
}

- (BOOL)prefersStatusBarHidden
{
    NSLog(@"导航栏-%s",__func__);
    return NO;
}
```