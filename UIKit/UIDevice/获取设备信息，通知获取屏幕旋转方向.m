- (void)handleDeviceOrientationDidChange:(UIInterfaceOrientation)interfaceOrientation
{
    //1.获取 当前设备 实例
    UIDevice *device = [UIDevice currentDevice] ;
    
    /**
     *  2.取得当前Device的方向，Device的方向类型为Integer
     *
     *  必须调用beginGeneratingDeviceOrientationNotifications方法后，此orientation属性才有效，否则一直是0。orientation用于判断设备的朝向，与应用UI方向无关
     *
     *  @param device.orientation
     *
     */

    switch (device.orientation) {
        case UIDeviceOrientationFaceUp:
            NSLog(@"屏幕朝上平躺");
            break;
            
        case UIDeviceOrientationFaceDown:
            NSLog(@"屏幕朝下平躺");
            break;
            
            //系統無法判斷目前Device的方向，有可能是斜置
        case UIDeviceOrientationUnknown:
            NSLog(@"未知方向");
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"屏幕向左横置");
            break;
            
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"屏幕向右橫置");
            break;
            
        case UIDeviceOrientationPortrait:
            NSLog(@"屏幕直立");
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"屏幕直立，上下顛倒");
            break;
            
        default:
            NSLog(@"无法辨识");
            break;
    }

}


- (void)viewDidLoad {

    
    //设备名称  e.g. "My iPhone"
    NSString *strName = [[UIDevice currentDevice] name];
    NSLog(@"设备名称：%@", strName);
    
    /**
     * 系统名称 e.g. @"iOS"
     */
    NSString *strSysName = [[UIDevice currentDevice] systemName];
    NSLog(@"系统名称：%@", strSysName);    

    /**
     * 系统版本号 e.g. @"4.0"
     */
    NSString *strSysVersion = [[UIDevice currentDevice] systemVersion];
    NSLog(@"系统版本号：%@", strSysVersion);
    
    /**
     * 设备类型 e.g. @"iPhone", @"iPod touch"
     */
    NSString *strModel = [[UIDevice currentDevice] model];
    NSLog(@"设备类型：%@", strModel);
    
    /**
     * 本地设备模式 localized version of model
     */
    NSString *strLocModel = [[UIDevice currentDevice] localizedModel];
    NSLog(@"本地设备模式：%@", strLocModel);
    
    /**
     * UUID 　可用于唯一地标识该设备
     */
    NSUUID *identifierForVendor = [[UIDevice currentDevice] identifierForVendor];
    NSLog(@"UUID：%@", identifierForVendor.UUIDString);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)viewDidAppear:(BOOL)animated
{
    
    /**
     *  开始生成 设备旋转 通知
     */
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    
    /**
     *  添加 设备旋转 通知
     *
     *  @param handleDeviceOrientationDidChange: handleDeviceOrientationDidChange: description
     *
     *  @return return value description
     */
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDeviceOrientationDidChange:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil
     ];
}



-(void)viewDidDisappear:(BOOL)animated
{
    
    /**
     *  销毁 设备旋转 通知
     *
     *  @return return value description
     */
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:nil
     ];
    
    /**
     *  结束 设备旋转通知
     *
     *  @return return value description
     */
    [[UIDevice currentDevice]endGeneratingDeviceOrientationNotifications];
    
}

@end