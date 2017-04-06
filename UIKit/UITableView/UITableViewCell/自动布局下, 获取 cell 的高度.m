/** 返回cell的高度*/
-(CGFloat)cellHeghit{
    //重新布局子控件
    [self layoutIfNeeded];
    //获取实际 cell 的高度
    CGSize size = [self systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height;
}export PATH=/home/aven/swift-2.2-RELEASE-ubuntu14.04/usr/bin:$PATH  