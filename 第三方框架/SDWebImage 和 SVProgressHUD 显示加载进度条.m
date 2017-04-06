[imagev sd_setImageWithURL:imageURL placeholderImage:nil options:SDWebImageHighPriority progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    // 注意:加载 UI 要在主线程!!!!
    dispatch_async(dispatch_get_main_queue(), ^{
        float downloadProgress = (float)receivedSize / (float)expectedSize;
        NSLog(@"%.1f",downloadProgress);
        NSLog(@"%ld\t%ld",(long)receivedSize,(long)expectedSize);
        [SVProgressHUD showProgress:downloadProgress];
    });
} completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    if(image){
        CGSize imageSize = [self imageSize:image.size ] ;
        CGPoint center = weakImageV.center;
        weakImageV.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
        weakImageV.center = center;
        [SVProgressHUD dismiss];
    }else{
        [SVProgressHUD showInfoWithStatus:@"您的网络不给力，图片加载失败~"];
    }
    
}];
