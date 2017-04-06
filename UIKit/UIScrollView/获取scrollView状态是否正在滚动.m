- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    //NSLog(@"滑动停止（animation）");
    _isScrolling = NO ;
    NSLog(@"滑动停止 = page%@",@(self.currentPage) );
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self performSelector:@selector(scrollViewDidEndScrollingAnimation:) withObject:nil afterDelay:0.3];
    //NSLog(@"滑动中");
    _isScrolling = YES ;
}


// 主动去调scrollViewDidEndScrollingAnimation。
//
// 原理：在- (void)scrollViewDidScroll:(UIScrollView *)scrollView内，创建一个异步调用，等待0.1秒后调scrollViewDidEndScrollingAnimation。由于scrollViewDidScroll会不断被调用，再次触发时取消上一次的异步请求。等到不再滚动时，最后一次的请求不会被取消，最终会跑到scrollViewDidScroll，然后，添加想要在滚动停止时调用的代码即可。
