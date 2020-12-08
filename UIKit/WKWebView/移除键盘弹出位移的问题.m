NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
[nc removeObserver:_wkWebView name:UIKeyboardWillHideNotification object:nil];
[nc removeObserver:_wkWebView name:UIKeyboardWillShowNotification object:nil];
[nc removeObserver:_wkWebView name:UIKeyboardWillChangeFrameNotification object:nil];
[nc removeObserver:_wkWebView name:UIKeyboardDidChangeFrameNotification object:nil];