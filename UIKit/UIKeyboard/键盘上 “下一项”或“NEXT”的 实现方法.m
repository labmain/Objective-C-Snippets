#pragma mark - UITextfieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    BOOL retValue = NO;
    // see if we're on the username or password fields
    if (textField == self.accountFiled)//当是 “第一个”输入框时
    {
        if ([textField.text length]  == 11)//输入的号码完整时
        {
            [self.passwordFiled becomeFirstResponder];// “第二个”输入框 作为 键盘的第一 响应者，光标 进入此输入框中
            retValue = NO;
        }else{
            [SVProgressHUD showInfoWithStatus:@"请输入完整的手机号!"];
        }
    }
    else
    {
        [self.passwordFiled resignFirstResponder];//如果 现在 是 第二个输入框，那么 键盘 隐藏
    }
    return retValue;
}