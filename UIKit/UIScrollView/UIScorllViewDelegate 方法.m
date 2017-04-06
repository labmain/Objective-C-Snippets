#pragma mark - UIScorllViewDelegate

// 开始滑动时调用，只调用一次，手指不松开只算一次 1
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDragging");
}
// 滑动时多次调用，offset值改变即滑动过程中，便会调用该代理函数 2
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    NSLog(@" scrollViewDidScroll");
    NSLog(@"ContentOffset  x is  %f,y is %f",scrollView.contentOffset.x,scrollView.contentOffset.y);
}
// 结束滑动时调用，只调用一次，手指离开时执行- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);

// 完成拖拽 3
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    NSLog(@"scrollViewDidEndDragging");
}
// 将开始降速时 4
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewWillBeginDecelerating");
}

// 减速停止了时执行 5
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndDecelerating");
}
// 滚动动画停止时执行,代码改变时出发,也就是setContentOffset改变时
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidEndScrollingAnimation");
}
// 设置放大缩小的视图，要是uiscrollview的subview
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    NSLog(@"viewForZoomingInScrollView");
    return viewA;
}
// 完成放大缩小时调用
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
    viewA.frame=CGRectMake(50,0, 100, 400);
    NSLog(@"scale between minimum and maximum. called after any 'bounce' animations");
}

//如果你不是完全滚动到滚轴视图的顶部，你可以轻点状态栏，那个可视的滚轴视图会一直滚动到顶部，那是默认行为，你可以通过该方法返回NO来关闭它
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewShouldScrollToTop");
    return YES;
}
// 如果已经在顶部,滚动动画完成时调用
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
    NSLog(@"scrollViewDidScrollToTop");
}

没有开启分页的时候，代理方法调用顺序：
scrollViewWillBeginDragging –> scrollViewDidScroll -> scrollViewWillEndDragging -> scrollViewDidEndDragging
 
 开启分页的时候，代理方法调用顺序
scrollViewWillBeginDragging -> scrollViewDidScroll -> scrollViewDidEndDragging ->scrollViewWillBeginDecelerating ->scrollViewDidScroll -> scrollViewDidEndDecelerating
