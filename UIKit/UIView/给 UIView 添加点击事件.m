UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyboardHide)];
//将触摸事件添加到当前view
[self.view addGestureRecognizer:tapGestureRecognizer];

- (void)keyboardHide{
    [self.view endEditing:YES];
}