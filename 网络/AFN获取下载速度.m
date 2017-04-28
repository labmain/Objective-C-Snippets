AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];;
   //    session                   ：会话
   //    downloadTask              ：下载任务
   //    bytesWritten              ：本次下载字节数
   //    totalBytesWritten         ：已经下载的字节数
   //    totalBytesExpectedToWrite ：总下载字节数
   [manager setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session,
                                               NSURLSessionDownloadTask * _Nonnull downloadTask,
                                               int64_t bytesWritten,
                                               int64_t totalBytesWritten,
                                               int64_t totalBytesExpectedToWrite) {

       // 计算一秒中的速度
       self.totalRead += bytesWritten;

       // 获取当前时间
       NSDate *currentDate = [NSDate date];

       if (!self.date) {
           self.date = [NSDate date];
       }

       // 当前时间和上一秒时间做对比，大于等于一秒就去计算
       if ([currentDate timeIntervalSinceDate:self.date] >= 1) {
           // 时间差
           double time = [currentDate timeIntervalSinceDate:self.date];
           // 计算速度
           self.speed = self.totalRead / time;
           // 维护变量，将计算过的清零
           self.totalRead = 0.0;
           // 维护变量，记录这次计算的时间
           self.date = currentDate;
       }
       if (speedBlock) {
           speedBlock(self.speed);
       }
   }];
