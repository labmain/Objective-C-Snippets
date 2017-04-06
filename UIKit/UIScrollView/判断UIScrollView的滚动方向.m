int _lastPosition;    //A variable define in headfile

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int currentPostion = scrollView.contentOffset.y;
    if (currentPostion - _lastPosition > 25) {
        _lastPosition = currentPostion;
        NSLog(@"ScrollUp now");
    }
    else if (_lastPosition - currentPostion > 25)
    {
        _lastPosition = currentPostion;
        NSLog(@"ScrollDown now");
    }
}
// 25 可以是任意数字，可根据自己的需要来设定。


// 升级版：到达顶部或底部时不会反弹
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int currentPostion = scrollView.contentOffset.y;

    if (currentPostion - _lastPosition > 20  && currentPostion > 0) {        //这个地方加上 currentPostion > 0 即可）
        _lastPosition = currentPostion;

        NSLog(@"ScrollUp now");
    }
    else if ((_lastPosition - currentPostion > 20) && (currentPostion  <= scrollView.contentSize.height-scrollView.bounds.size.height-20) ){
        _lastPosition = currentPostion;

        NSLog(@"ScrollDown now");
    }
}
