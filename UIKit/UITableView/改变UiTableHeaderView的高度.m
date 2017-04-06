CGRect newFrame = headerView.frame;
newFrame.size.height = newFrame.size.height + webView.frame.size.height;
headerView.frame = newFrame;
[self.tableView setTableHeaderView:headerView];


添加动画：
[self.tableView beginUpdates];
[self.tableView setTableHeaderView:headerView];
[self.tableView endUpdates];
