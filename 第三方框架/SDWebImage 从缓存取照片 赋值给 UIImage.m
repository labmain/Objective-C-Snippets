// 从本地缓存取照片
UIImage *image = [[SDWebImageManager sharedManager].imageCache imageFromDiskCacheForKey:[UserAccountViewModel sharedUserAccount].memberImageURL.absoluteString];
// 如果没有，放一张默认 照片
if (image == nil) {
    image  = [UIImage imageNamed:@"message_assistant"];
}
[_memberImage sd_setImageWithURL:[UserAccountViewModel sharedUserAccount].memberImageURL placeholderImage:image];