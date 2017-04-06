@interface UIScrollView : UIView <NSCoding>
@property(nonatomic,readonly,getter=isTracking) BOOL tracking;
当 touch 后还没有拖动的时候值是YES，否则NO

@property(nonatomic,readonly,getter=isZoomBouncing) BOOL zoomBouncing;
当内容放大到最大或者最小的时候值是YES，否则NO

@property(nonatomic,readonly,getter=isZooming) BOOL zooming;
当正在缩放的时候值是YES，否则NO

@property(nonatomic,readonly,getter=isDecelerating) BOOL decelerating;
当滚动后，手指放开但是还在继续滚动中。这个时候是YES，其他时候是NO

@property(nonatomic) CGFloat decelerationRate
设置手指放开后的减速率

@property(nonatomic) CGFloat maximumZoomScale;
表示放大的最大倍数

@property(nonatomic) CGFloat minimumZoomScale;
表示缩小的最小倍数

@property(nonatomic,getter=isPagingEnabled) BOOL pagingEnabled;
当值为YES的时候，就会产生翻页那种效果

@property(nonatomic,getter=isScrollEnabled) BOOL scrollEnabled;
决定是否可以滚动

@property(nonatomic) BOOL delaysContentTouches;
当值为YES的时候，用户一旦触碰，然后再一定时间内没有移动，UIScrollView会发送 tracking events，然后用户移动手指足够长度触发滚动事件，这个时候，UIScrollView发送了-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event到 subview，然后UIScrollView开始滚动。假如值为NO，UIScrollView发送 tracking events 后，就算用户移动手指，UIScrollView也不会滚动。

@property(nonatomic) BOOL showsHorizontalScrollIndicator;
滚动时是否显示水平滚动条

@property(nonatomic) BOOL showsVerticalScrollIndicator;
滚动时是否显示垂直滚动条

@property(nonatomic) BOOL bounces;
默认是YES，就是滚动超过边界会有反弹回来的效果，如果设置为NO，那么滚动到边界就会立刻停止

@property(nonatomic) BOOL bouncesZoom;
这个效果反映在缩放上面，如果缩放超过最大缩放，就会有反弹效果，加入设置为NO，则达到最大或者最小的时候立刻停止

@property(nonatomic,getter=isDirectionalLockEnabled) BOOL directionalLockEnabled;
默认是NO，可以在垂直和水平方向同时运动。当值为YES的时候，加入一开始是垂直或者水平运动，那么接下来会锁定另外一个方向的滚动。加入一开始是对角方向滚动，则不会禁止某个方向

@property(nonatomic) UIScrollViewIndicatorStyle indicatorStyle;
滚动条的样式，基本只是设置颜色

@property(nonatomic) UIEdgeInsets scrollIndicatorInsets;
设置滚动条的位置

@end
