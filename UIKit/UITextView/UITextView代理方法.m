
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;
是否开始编辑

- (BOOL)textViewShouldEndEditing:(UITextView *)textView;
是否结束编辑

- (void)textViewDidBeginEditing:(UITextView *)textView;
开始编辑时触发的方法

- (void)textViewDidEndEditing:(UITextView *)textView;
结束编辑时触发的方法

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;
是否允许字符改变

- (void)textViewDidChange:(UITextView *)textView;
字符内容改变触发的方法

- (void)textViewDidChangeSelection:(UITextView *)textView;
选中内容改变触发的方法

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange;
当文本中的URL进行链接时触发的方法
