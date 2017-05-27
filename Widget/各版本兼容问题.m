#pragma mark - 高度问题
// iOS8、9是老式的下拉刷新，并没有折叠和展开功能，默认的Widget高度为 self.preferredContentSize 设置的高度
// iOS 10 高度默认是110,超过尺寸的话，需要开启展开效果
if ([[[UIDevice currentDevice] systemVersion] floatValue] < 10.0) {
    self.preferredContentSize = CGSizeMake(0,110);
}
#pragma mark - 背景颜色
// iOS8，9 背景色是暗色，iOS10 是 两色主题
// 你可以构造两个不同的界面，分别用于 iOS 10 以下的版本和 iOS 10+ 的版本，或者确认一个单独的界面能够同时兼容深色和亮色背景。
// 当然也可以设置统一的背景颜色。

#pragma mark - 位置偏移
// iOS 8,9 默认会偏移
// 修改偏移
// 取消widget默认的inset，让应用靠左
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets {
    return UIEdgeInsetsZero;
}
