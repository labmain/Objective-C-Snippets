{
   UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScrollView)];
    
    [self.scrollView addGestureRecognizer:recognizer];
}
- (void)touchScrollView
{
    [self.view endEditing:YES];
}