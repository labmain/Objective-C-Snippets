/** ------ 创建通知 ------**/

//添加 字典，将值通过key值设置传递
NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:self.hospital_id, @"hospital_id",self.hospital, @"hospital", nil];
//创建通知
NSNotification *notification =[NSNotification notificationWithName:@"SelectHospital" object:nil userInfo:dict];
//通过通知中心发送通知
[[NSNotificationCenter defaultCenter] postNotification:notification];


/** ------ 接收通知 ------**/
//注册通知
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationHospitalhospital_DIY:) name:@"SelectHospital_DIY" object:nil];

/// 自定义医院回调
- (void)notificationHospitalhospital_DIY:(NSNotification *)text{
    NSString *hospitalStr = text.userInfo[@"hospital_DIY"];
}

/* ********** 接受通知一定要注销 ********** */
- (void)dealloc{
    //取消订阅通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"SelectHospital_DIY" object:nil];

    // 取消全部通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
