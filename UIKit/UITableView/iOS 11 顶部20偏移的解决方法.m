 if (@available(iOS 11.0, *)) {
    self.sActivityView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
} else {
    self.automaticallyAdjustsScrollViewInsets = NO;
}


// swift
if #available(iOS 11.0, *) {
    tableView.contentInsetAdjustmentBehavior = .never
} else {
    automaticallyAdjustsScrollViewInsets = false;
}