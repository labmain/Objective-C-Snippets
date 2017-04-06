- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    mScrollHight = scrollView.contentOffset.y;

    CGFloat minAlphaOffset = 44;
    CGFloat maxAlphaOffset = 164;
    CGFloat offset = mScrollHight;
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.navigationBar.alpha = alpha; // 设置导航栏的透明度
}
