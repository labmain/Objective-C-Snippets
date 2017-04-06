//压缩图片质量  
+(UIImage *)reduceImage:(UIImage *)image percent:(float)percent  
{  
    NSData *imageData = UIImageJPEGRepresentation(image, percent);  
    UIImage *newImage = [UIImage imageWithData:imageData];  
    return newImage;  
}  
//压缩图片尺寸  
+ (UIImage*)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize  
{  
    // Create a graphics image context  
    UIGraphicsBeginImageContext(newSize);  
    // new size  
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];  
    // Get the new image from the context  
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();  
      
    // End the context  
    UIGraphicsEndImageContext();  
    // Return the new image.  
    return newImage;  
} 

其他方法
/*!
 *  @author 黄仪标, 15-12-01 16:12:01
 *
 *  压缩图片至目标尺寸
 *
 *  @param sourceImage 源图片
 *  @param targetWidth 图片最终尺寸的宽
 *
 *  @return 返回按照源图片的宽、高比例压缩至目标宽、高的图片
 */
- (UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidth {
  CGSize imageSize = sourceImage.size;

  CGFloat width = imageSize.width;
  CGFloat height = imageSize.height;

  CGFloat targetHeight = (targetWidth / width) * height;

  UIGraphicsBeginImageContext(CGSizeMake(targetWidth, targetHeight));
  [sourceImage drawInRect:CGRectMake(0, 0, targetWidth, targetHeight)];

  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return newImage;
}
