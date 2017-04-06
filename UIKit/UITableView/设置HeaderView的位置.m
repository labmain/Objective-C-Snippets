- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //该方法是当scrollView滑动时触发，因为UITableView继承自UIScrollView因此在这里也可以调用
    CGFloat header = 100;//这个header其实是section1 的header到顶部的距离
    if (scrollView.contentOffset.y <= header&&scrollView.contentOffset.y >= 0) {
    //当视图滑动的距离小于header时
        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
    } else if(scrollView.contentOffset.y>header) {
    //当视图滑动的距离大于header时，这里就可以设置section1的header的位置啦，设置的时候要考虑到导航栏的透明对滚动视图的影响
        scrollView.contentInset = UIEdgeInsetsMake(header + 104, 0, 0, 0);
    }
}
