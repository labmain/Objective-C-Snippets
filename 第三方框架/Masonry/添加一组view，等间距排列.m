/**
* 多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
*
* @param axisType 轴线方向
* @param fixedSpacing 间隔大小
* @param leadSpacing 头部间隔
* @param tailSpacing 尾部间隔
*/
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType withFixedSpacing:(CGFloat)fixedSpacing leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;
/**
* 多个固定大小的控件的等间隔排列,变化的是间隔的空隙
*
* @param axisType 轴线方向
* @param fixedItemLength 每个控件的固定长度或者宽度值
* @param leadSpacing 头部间隔
* @param tailSpacing 尾部间隔
*/
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType withFixedItemLength:(CGFloat)fixedItemLength leadSpacing:(CGFloat)leadSpacing tailSpacing:(CGFloat)tailSpacing;

//这里加了一组长的一样的View。
[self.view addSubview:customView];
//将View添加到数组中
[self.viewArray addObject:customView];
/*!
    *  self.viewArray: 数组容器
    *  HelperMASAxisTypeVertical： 排列方向
    *  FixedSpacing： 间距
    *  左右间距。。。
    */
[self.viewArray mas_distributeViewsAlongAxis:HelperMASAxisTypeVertical withFixedSpacing:10 leadSpacing:0 tailSpacing:0];
//整体的位置
[self.viewArray mas_makeConstraints:^(MASConstraintMaker *make) {
    make.leading.trailing.mas_equalTo(self.view);
}];
