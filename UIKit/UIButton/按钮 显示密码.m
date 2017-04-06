[_showPDBtn addTarget:self action:@selector(showPDBtnClick) forControlEvents:UIControlEventTouchUpInside];

- (void)showPDBtnClick{
    self.showPDBtn.selected = !self.showPDBtn.selected;
    [self.changePDField setSecureTextEntry:!self.showPDBtn.selected];
}