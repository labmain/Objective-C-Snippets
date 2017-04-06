<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


// 根据 UIButton 的 Tag 打开相册或者相机
- (void)clickedButtonWithSender:(UIButton *)sender{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // 设置代理
    imagePicker.delegate =self;
    
    switch (sender.tag) {
        case 0:
            //相册
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        case 1:
            //照相
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            break;
        case 2:
            //摄像
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
            imagePicker.videoQuality = UIImagePickerControllerQualityTypeLow; //录像质量
            imagePicker.videoMaximumDuration = 600.0f; //录像最长时间
            break;
            
        default:
            break;
    }
    
    // 显示图片选择器
    [self presentViewController:imagePicker animated:YES completion:nil];
}




#pragma mark - UIImagePickerControllerDelegate
// 当选中一个照片的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 获取编辑之后的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    // 拿到压缩之后的照片
    NSData *data = UIImageJPEGRepresentation([image scaleImageToWidth:1024],0.8);
    UIImage *dataImage = [UIImage imageWithData:data];
    DDLogInfo(@"%@",dataImage);
        
    // 退出控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}