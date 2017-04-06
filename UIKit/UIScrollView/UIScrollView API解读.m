//1.设定滚定条的样式
typedefNS_ENUM(NSInteger, UIScrollViewIndicatorStyle) {
    UIScrollViewIndicatorStyleDefault,     // black with white border. good against any background黑白边框
    UIScrollViewIndicatorStyleBlack,       // black only. smaller. good against a white background纯黑边框
    UIScrollViewIndicatorStyleWhite        // white only. smaller. good against a black background纯白边框
};
//2.在UIScrollView中键盘的消失方式
typedefNS_ENUM(NSInteger, UIScrollViewKeyboardDismissMode) {
    UIScrollViewKeyboardDismissModeNone, 默认样式
    UIScrollViewKeyboardDismissModeOnDrag,      // dismisses the keyboard when a drag begins  设定键盘的消失方式为拖拉页面
    UIScrollViewKeyboardDismissModeInteractive, // the keyboard follows the dragging touch off screen, and may be pulled upward again to cancel the dismiss  设定键盘消失方式为拖拉并点击页面
} NS_ENUM_AVAILABLE_IOS(7_0);
//3.这个参数可以设置减速的速率
UIKIT_EXTERNconst CGFloat UIScrollViewDecelerationRateNormalNS_AVAILABLE_IOS(3_0);
//4.这个参数可以设置减速的速率
UIKIT_EXTERNconst CGFloat UIScrollViewDecelerationRateFastNS_AVAILABLE_IOS(3_0);
//5.从内容视图的原点偏移的一个点
@property(nonatomic)        CGPoint                      contentOffset;
//6.内容视图的大小
@property(nonatomic)        CGSize                       contentSize;
//7.内容视图的距离，是从封闭的滚动视图插图
@property(nonatomic)        UIEdgeInsets                 contentInset;                 around content
//8.滚动视图的代理
@property(nonatomic,assign)id<UIScrollViewDelegate>      delegate;
//9.一个bool值，用来决定是否在某一特定方向禁用滚动
@property(nonatomic,getter=isDirectionalLockEnabled)BOOL directionalLockEnabled;
//10.控制滚动视图是否反弹过去内容的边缘，然后再返回一个布尔值
@property(nonatomic)        BOOL                         bounces;
//11.如果这个属性被设置成YES而且bounces的值是YES，垂直拖动是允许的内容，即使小鱼滚动视图的边界，默认是NO
@property(nonatomic)        BOOL                         alwaysBounceVertical;
//12.一个布尔值，决定是否反弹总是发生在垂直滚动到达结束内容，默认值是NO
@property(nonatomic)        BOOL                         alwaysBounceHorizontal;
//13.一个布尔值决定是否弃用分页滚动视图
@property(nonatomic,getter=isPagingEnabled)BOOL          pagingEnabled;
//14.决定是否弃用滚动
@property(nonatomic,getter=isScrollEnabled)BOOL          scrollEnabled;
//15.控制水平滚动指标是否可见的
@property(nonatomic)        BOOL                         showsHorizontalScrollIndicator;
//16.控制垂直滚动指标是否是可见的
@property(nonatomic)        BOOL                         showsVerticalScrollIndicator;
//17.滚动指标点到滚动视图的边缘的距离
@property(nonatomic)        UIEdgeInsets                 scrollIndicatorInsets;     //18.指示器的风格设置
@property(nonatomic)        UIScrollViewIndicatorStyle   indicatorStyle;
//19.默认减速率
@property(nonatomic)        CGFloat                      decelerationRate NS_AVAILABLE_IOS(3_0);
//20.设置从内容原点偏移到指定点的方法
- (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
//21.滚动一个特定区域的内容以便它在接受是可见的
- (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;
//22.暂时显示滚动指标
- (void)flashScrollIndicators;
//23.返回判断是否用户碰触内容触发滚动（只读）
@property(nonatomic,readonly,getter=isTracking)     BOOL tracking;
//24.一个布尔值知识用户是否已经开始滚动内容
@property(nonatomic,readonly,getter=isDragging)     BOOL dragging;
//25.返回的内容是否在滚动视图后，用户接触他们的手指（只读）
@property(nonatomic,readonly,getter=isDecelerating)BOOL decelerating;
//26.一个布尔值，决定是否推迟滚动视图触摸手势的处理
@property(nonatomic)BOOL delaysContentTouches;
//27.如果这个值设置为YES，那么当你在UIScrollView上面放置任何子视图的时候，当你在子视图上移动的时候，UIScrollView会给子视图发送touchCancel消息，而如果该属性设置为NO，ScollView本身不处理这个消息，全部交给子视图处理
@property(nonatomic)BOOL canCancelContentTouches;
//28.自定义默认行为，当手指触摸在显示的内容由子类重写
- (BOOL)touchesShouldBegin:(NSSet *)touches withEvent:(UIEvent *)event inContentView:(UIView *)view;
//29.它开始发送跟踪邮件的内容视图后动视图调用此方法。如果它从这种方法受到NO便停止拖动和转发触摸时间的内容子视图。
- (BOOL)touchesShouldCancelInContentView:(UIView *)view;
//30.浮点值 指定可应用于滚动视图的内容的最低比例因子
@property(nonatomic)CGFloat minimumZoomScale;
//31.一个浮点值指定可用于滚动视图的内容的最大规模的因素
@property(nonatomic)CGFloat maximumZoomScale;
//32.一个浮点值指定目前用于滚动视图的内容的比例因子
@property(nonatomic)CGFloat zoomScale NS_AVAILABLE_IOS(3_0);            //33.一个浮点数指定当前的缩放比例
- (void)setZoomScale:(CGFloat)scale animated:(BOOL)animatedNS_AVAILABLE_IOS(3_0);
//34.缩小到特定区域的内容，所以它是在接收器中可见
- (void)zoomToRect:(CGRect)rect animated:(BOOL)animatedNS_AVAILABLE_IOS(3_0);
//35.一个布尔值，决定当当缩放超过上限或是下限时是否滚动视图推动内容缩放
@property(nonatomic)BOOL  bouncesZoom;
//36.一个布尔值指示内容是否认为正在方法或者缩小（只读）
@property(nonatomic,readonly,getter=isZooming)      BOOL zooming;
//37.一个布尔值指示缩放已超过指定的接受范围
@property(nonatomic,readonly,getter=isZoomBouncing) BOOL zoomBouncing;
//38.一个布尔值控制是否滚动到顶部的姿态是有效地
@property(nonatomic)BOOL  scrollsToTop;
//39.拖动手势（只读）
@property(nonatomic,readonly) UIPanGestureRecognizer *panGestureRecognizerNS_AVAILABLE_IOS(5_0);
//40.向里向外捏用于缩放
@property(nonatomic,readonly) UIPinchGestureRecognizer *pinchGestureRecognizerNS_AVAILABLE_IOS(5_0);
//41.设置见哦按的小事样式
@property(nonatomic)UIScrollViewKeyboardDismissMode keyboardDismissModeNS_AVAILABLE_IOS(7_0);
@end
@protocol UIScrollViewDelegate<NSObject>
@optional
//42.scrollView正在滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
//43.scrollView正在被拖动的时候调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollViewNS_AVAILABLE_IOS(3_2);
//44. scrollView开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
//45. scrollView将要结束拖拽的时候调用
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0);
//46. scrollView完成拖拽的时候调用
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate;
//47. scrollView将开始降速的时候调用
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView;
//48. scrollView在减速停止了时候执行，手触摸时候执行
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
//49. 滚动动画停止时执行代码改变时触发，也就是setContentOffset改变的时候
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;
//50.返回一个放大或者缩小的视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView;
//51.开始放大或者缩小时候调用
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view NS_AVAILABLE_IOS(3_2);
//52.缩放结束时候调用
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale;
//53.是否支持滚动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView;
//54.滚动顶部时候调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView;
@end
