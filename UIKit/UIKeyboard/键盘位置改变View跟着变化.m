1、订阅键盘的frame即将改变的通知
//监听键盘frame变化
[[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
2、通知到达后执行的方法,通知到达改变view的位置
- (void)keyboardWillChangeFrame:(NSNotification *)noti {
    //NSLog(@"%@",noti.userInfo);
    //键盘弹出/消失的时候。获取最终位置
    CGRect keyBoardFrame = [noti.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    //用键盘的最终的y值 - view自身的高度,就是要移动的距离
    CGFloat ct = keyBoardFrame.origin.y - self.view.frame.size.height;
    //获取键盘的动画时间
    CGFloat duration = [noti.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] floatValue]; [UIView animateWithDuration:duration animations:^{
    	//平移view
    	self.view.transform = CGAffineTransformMakeTranslation(0, ct);
    }];
}
3、在销毁方法中取消通知 
- (void)dealloc
{
    //取消订阅通知
     [[NSNotificationCenter defaultCenter] removeObserver:self];
 }
4、拖动tableView取消键盘
#pragma mark - scrollView的代理方法 -- UITableViewDelegate -》 UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //退出键盘
     [self.view endEditing:YES];
}
5、点击cell 取消键盘
//点击cell,取消键盘
 - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *) event{
    [self.superview.superview.superview endEditing:YES];
}
