//监听键盘变化
[[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(changeContentViewPosition:)
                                             name:UIKeyboardWillShowNotification
                                           object:nil];

[[NSNotificationCenter defaultCenter] addObserver:self
                                         selector:@selector(changeContentViewPosition:)
                                             name:UIKeyboardWillHideNotification
                                           object:nil];
// 根据键盘状态，调整View的位置
- (void)changeContentViewPosition:(NSNotification *)notification{
    NSDictionary *userInfo = [notification userInfo];
    NSValue *value = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGFloat keyBoardEndY = value.CGRectValue.origin.y;// 得到键盘弹出后的键盘视图所在y坐标

    NSNumber *duration = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSNumber *curve = [userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey];

    // 添加移动动画，使视图跟随键盘移动
    [UIView animateWithDuration:duration.doubleValue animations:^{
        [UIView setAnimationBeginsFromCurrentState:YES];
        [UIView setAnimationCurve:[curve intValue]];

        self.toolview.center = CGPointMake(self.toolview.center.x, keyBoardEndY - 62 - self.toolview.bounds.size.height/2.0);   // keyBoardEndY的坐标包括了状态栏的高度，要减去

    }];
}
- (void)dealloc
{
    //取消订阅通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
