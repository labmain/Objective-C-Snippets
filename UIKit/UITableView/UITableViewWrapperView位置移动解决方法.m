- (void)viewWillLayoutSubviews {

    if (self.view.subviews[0] != self.tableView) {
        //self.tableView是我们希望正常显示cell的视图
        self.tableView.subviews[0].frame = CGRectMake(0, 64, kScreenW, kScreenH);
    }

}

/*或者设置 tableView的y : 64*/
//如果navigationbar.translucent = YES; scrollview会被自动设置contentInset.top=64

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    _tableView.contentInset = UIEdgeInsetsZero;
    _tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
}
