<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

- (void)addpicClick{
    UIActionSheet *myActionSheet;
    myActionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相册", @"拍照", nil];
    [myActionSheet showInView:self.view];
}



#pragma mark actionSheet点击事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if(buttonIndex == 2){
        //取消
        return;
    }
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // 设置代理
    imagePicker.delegate =self;
    // 设置允许编辑
//    imagePicker.allowsEditing = YES;
    
    if (buttonIndex == 0) {
        //相册
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }else{
        //照相
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    
    // 显示图片选择器
    [self presentViewController:imagePicker animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate
// 当选中一个照片的时候调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 获取选中的照片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
    // 获取编辑之后的图片
//    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    // 压缩图片
        self.image = [image scaleImageToWidth:1024];
    
    // 把选中的照片绘制到画板
        self.addPicBtn.imageView.image = image;
    self.addPicLabel.hidden = YES;
    [self.addPicBtn setImage:self.image forState:UIControlStateNormal];
    [self dismissViewControllerAnimated:YES completion:nil];
}