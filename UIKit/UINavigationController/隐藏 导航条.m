- (void)viewWillAppear:(BOOL)animated 
{
     [self setFullScreen:YES];
} 
- (void)viewWillDisappear:(BOOL)animated
 {
     [self setFullScreen:NO];
 } 
 - (void)setFullScreen:(BOOL)fullScreen 
{
    // 状态条
     [UIApplication sharedApplication].statusBarHidden = fullScreen;
     // 导航条
    [self.navigationController setNavigationBarHidden:fullScreen];
     // tabBar的隐藏通过在初始化方法中设置hidesBottomBarWhenPushed属性来实现
 }