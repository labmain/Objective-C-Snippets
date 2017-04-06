/********* UIView是iOS系统界面元素的基础，所有的界面元素都是集成自它。它本身完全是由CoreAnimation来实现的。它真正的绘图部分，是一个叫CALayer（Core Animation Layer）的类来管理的。UIView本身，更像是一个CALayer的管理器 ，访问它的跟绘图和跟坐标有关的属性，例如frame，bounds等等，实际上内部都是在访问它所包含的CALayer的相关属性 *********/
//1.View设置动画块中的动画属性变化的曲线
typedef NS_ENUM(NSInteger, UIViewAnimationCurve) {
UIViewAnimationCurveEaseInOut, // slow at beginning and end
UIViewAnimationCurveEaseIn, // slow at beginning
UIViewAnimationCurveEaseOut, // slow at end
UIViewAnimationCurveLinear
};
//2.View内部内容不同显示类型效果
typedef NS_ENUM(NSInteger, UIViewContentMode) {
UIViewContentModeScaleToFill,
UIViewContentModeScaleAspectFit, // contents scaled to fit with fixed aspect. remainder is transparent
UIViewContentModeScaleAspectFill, // contents scaled to fill with fixed aspect. some portion of content may be clipped.
UIViewContentModeRedraw, // redraw on bounds change (calls -setNeedsDisplay)
UIViewContentModeCenter, // contents remain same size. positioned adjusted.
UIViewContentModeTop,
UIViewContentModeBottom,
UIViewContentModeLeft,
UIViewContentModeRight,
UIViewContentModeTopLeft,
UIViewContentModeTopRight,
UIViewContentModeBottomLeft,
UIViewContentModeBottomRight,
};
//3.五种动画效果
typedef NS_ENUM(NSInteger, UIViewAnimationTransition) {
UIViewAnimationTransitionNone, 没有动画
UIViewAnimationTransitionFlipFromLeft, 从左向右旋转翻页
UIViewAnimationTransitionFlipFromRight,从右向左旋转翻页
UIViewAnimationTransitionCurlUp, 卷曲翻页，从下往上
UIViewAnimationTransitionCurlDown, 卷曲翻页 从上往下
};
//4.这些属性是为了自动调整子控件与父控件中间的位置，宽高
typedef NS_OPTIONS(NSUInteger, UIViewAutoresizing) {
UIViewAutoresizingNone = 0, 不自动调整
UIViewAutoresizingFlexibleLeftMargin = 1 << 0,自动调整与superView左边的距离，保证与superView左边的距离不变
UIViewAutoresizingFlexibleWidth = 1 << 1,自动调整自己的宽度，保证与superView左边和右边的距离不变
UIViewAutoresizingFlexibleRightMargin = 1 << 2,自动调整与superView的右边距离，保证与superView左边的距离不变
UIViewAutoresizingFlexibleTopMargin = 1 << 3,自动调整与superView顶部的距离，保证与superView底部的距离不变
UIViewAutoresizingFlexibleHeight = 1 << 4,自动调整自己的高度，保证与superView左边和邮编的距离不变
UIViewAutoresizingFlexibleBottomMargin = 1 << 5,自动调整与superView底部的距离，保证与superView顶部的距离不变
};
//4.关于动画Option的一些可选项
typedef NS_OPTIONS(NSUInteger, UIViewAnimationOptions) {
UIViewAnimationOptionLayoutSubviews = 1 << 0, 提交动画的时候布局子控件，表示子控件将和父控件一同动画
UIViewAnimationOptionAllowUserInteraction = 1 << 1, 动画时允许用户交流，比如触摸
UIViewAnimationOptionBeginFromCurrentState = 1 << 2, 从当前状态开始动画
UIViewAnimationOptionRepeat = 1 << 3, 动画无限重复
UIViewAnimationOptionAutoreverse = 1 << 4, 执行动画回路，前提是设置动画无限重复
UIViewAnimationOptionOverrideInheritedDuration = 1 << 5, 忽略外层动画嵌套的执行时间
UIViewAnimationOptionOverrideInheritedCurve = 1 << 6, 忽略外层动画嵌套的时间变化曲线
UIViewAnimationOptionAllowAnimatedContent = 1 << 7, 通过改变属性和重回实现动画效果，如果key没有提交动画将使用快照
UIViewAnimationOptionShowHideTransitionViews = 1 << 8, 用显隐的方式替代添加移除图层的动画效果
UIViewAnimationOptionOverrideInheritedOptions = 1 << 9, 忽略嵌套继承的选项

UIViewAnimationOptionCurveEaseInOut = 0 << 16, 时间曲线函数，由慢到快
UIViewAnimationOptionCurveEaseIn = 1 << 16, 时间曲线函数，由慢到特别快
UIViewAnimationOptionCurveEaseOut = 2 << 16, 时间曲线函数，由快到慢
UIViewAnimationOptionCurveLinear = 3 << 16, 时间曲线函数，匀速

UIViewAnimationOptionTransitionNone = 0 << 20, 无转场动画
UIViewAnimationOptionTransitionFlipFromLeft = 1 << 20, 转场从左翻转
UIViewAnimationOptionTransitionFlipFromRight = 2 << 20, 转场从右翻转
UIViewAnimationOptionTransitionCurlUp = 3 << 20, 上卷转场
UIViewAnimationOptionTransitionCurlDown = 4 << 20, 下卷转场
UIViewAnimationOptionTransitionCrossDissolve = 5 << 20, 转场交叉消失
UIViewAnimationOptionTransitionFlipFromTop = 6 << 20, 转场上下翻转
UIViewAnimationOptionTransitionFlipFromBottom = 7 << 20, 转场从下翻转
} NS_ENUM_AVAILABLE_IOS(4_0);
//5.关键帧动画的选项参数设置
typedef NS_OPTIONS(NSUInteger, UIViewKeyframeAnimationOptions) {
UIViewKeyframeAnimationOptionLayoutSubviews = UIViewAnimationOptionLayoutSubviews,
UIViewKeyframeAnimationOptionAllowUserInteraction = UIViewAnimationOptionAllowUserInteraction, // turn on user interaction while animating
UIViewKeyframeAnimationOptionBeginFromCurrentState = UIViewAnimationOptionBeginFromCurrentState, // start all views from current value, not initial value
UIViewKeyframeAnimationOptionRepeat = UIViewAnimationOptionRepeat, // repeat animation indefinitely
UIViewKeyframeAnimationOptionAutoreverse = UIViewAnimationOptionAutoreverse, // if repeat, run animation back and forth
UIViewKeyframeAnimationOptionOverrideInheritedDuration = UIViewAnimationOptionOverrideInheritedDuration, // ignore nested duration
UIViewKeyframeAnimationOptionOverrideInheritedOptions = UIViewAnimationOptionOverrideInheritedOptions, // do not inherit any options or animation type

UIViewKeyframeAnimationOptionCalculationModeLinear = 0 << 10, // default
UIViewKeyframeAnimationOptionCalculationModeDiscrete = 1 << 10,
UIViewKeyframeAnimationOptionCalculationModePaced = 2 << 10,
UIViewKeyframeAnimationOptionCalculationModeCubic = 3 << 10,
UIViewKeyframeAnimationOptionCalculationModeCubicPaced = 4 << 10
} NS_ENUM_AVAILABLE_IOS(7_0);
typedef NS_ENUM(NSUInteger, UISystemAnimation) {
UISystemAnimationDelete, // removes the views from the hierarchy when complete
} NS_ENUM_AVAILABLE_IOS(7_0);
typedef NS_ENUM(NSInteger, UIViewTintAdjustmentMode) {
UIViewTintAdjustmentModeAutomatic,

UIViewTintAdjustmentModeNormal,
UIViewTintAdjustmentModeDimmed,
} NS_ENUM_AVAILABLE_IOS(7_0);

@protocol UICoordinateSpace
– (CGPoint)convertPoint:(CGPoint)point toCoordinateSpace:(id )coordinateSpace NS_AVAILABLE_IOS(8_0);
– (CGPoint)convertPoint:(CGPoint)point fromCoordinateSpace:(id )coordinateSpace NS_AVAILABLE_IOS(8_0);
– (CGRect)convertRect:(CGRect)rect toCoordinateSpace:(id )coordinateSpace NS_AVAILABLE_IOS(8_0);
– (CGRect)convertRect:(CGRect)rect fromCoordinateSpace:(id )coordinateSpace NS_AVAILABLE_IOS(8_0);

@property (readonly, nonatomic) CGRect bounds NS_AVAILABLE_IOS(8_0);
@end

//6.UIView有个layer属性，可以返回它的主CALayer实例，UIView有一个layerClass方法，返回主layer所使用的类，UIView的子类，可以通过重载这个方法，来让UIView使用不同的CALayer来显示。
+ (Class)layerClass; // default is [CALayer class]. Used when creating the underlying layer for the view.
//7.初始化View并设置frame大小
– (instancetype)initWithFrame:(CGRect)frame; // default initializer
//8.这个属性设置view是否支持触摸点击
@property(nonatomic,getter=isUserInteractionEnabled) BOOL userInteractionEnabled; // default is YES. if set to NO, user events (touch, keys) are ignored and removed from the event queue.
//9.给view添加tag标签
@property(nonatomic) NSInteger tag; // default is 0
//10.view的layer属性
@property(nonatomic,readonly,retain) CALayer *layer; // returns view’s layer. Will always return a non-nil value. view is layer’s delegate

@end

@interface UIView(UIViewGeometry)

//11.位置和尺寸 以父控件的左上角为原点
@property(nonatomic) CGRect frame;
//12.位置和尺寸 以自己的左上角为原点
@property(nonatomic) CGRect bounds; // default bounds is zero origin, frame size. animatable
//13.中点 以父控件的左上角为原点
@property(nonatomic) CGPoint center; // center is center of frame. animatable
//14.形变属性 缩放 旋转
@property(nonatomic) CGAffineTransform transform; // default is CGAffineTransformIdentity. animatable
@property(nonatomic) CGFloat contentScaleFactor NS_AVAILABLE_IOS(4_0);
//15.返回值决定是否支持多点触摸
@property(nonatomic,getter=isMultipleTouchEnabled) BOOL multipleTouchEnabled; // default is NO
//16.如果设置为YES则当前UIView会毒战整个Touch事件。具体来说就是如果UIView设置了exclusiveTouch属性为YES则当这个UIView成为第一响应者时，在手指离开屏幕前其他view不会相应任何touch事件。
@property(nonatomic,getter=isExclusiveTouch) BOOL exclusiveTouch; // default is NO
//17.当在一个view上添加一个屏幕罩时，但又不影响对下面view的操作，也就是可以通过屏幕罩对下面的view进行操作。
– (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event; // recursively calls -pointInside:withEvent:. point is in the receiver’s coordinate system
//18.这个函数的用处是判断当前的点击或者触摸事件的点是否在当前的view中。
– (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event; // default returns YES if point is in bounds
//19.转换一个点从接受者坐标系到给定视图坐标系
– (CGPoint)convertPoint:(CGPoint)point toView:(UIView *)view;
//20.把一个点从一个坐标系转换到接收者的坐标系
– (CGPoint)convertPoint:(CGPoint)point fromView:(UIView *)view;
//21.转换接收者坐标系中的矩形到其他视图
– (CGRect)convertRect:(CGRect)rect toView:(UIView *)view;
//22.转换一个矩形从其他视图坐标系到接收者坐标系
– (CGRect)convertRect:(CGRect)rect fromView:(UIView *)view;
//23.如果某个视图的这个属性被设置为YES，则其子视图会根据autoresizingMask属性的值自动进行尺寸调整，简单配置一下视图的自动尺寸调整掩码常常就能使应用程序得到合适的行为。否则，应用程序就必须通过重载layoutSubviews方法来提供自己的实现
@property(nonatomic) BOOL autoresizesSubviews;
//24.自动调整子控件与父控件中间的位置，宽高
@property(nonatomic) UIViewAutoresizing autoresizingMask; // simple resize. default is UIViewAutoresizingNone
//25.这个方法会计算并且返回一个最适应接收子视图的大小
– (CGSize)sizeThatFits:(CGSize)size; // return ‘best’ size to fit given size. does not actually resize view. Default is return existing view size
//26.移动并且调整子视图的大小
– (void)sizeToFit; // calls sizeThatFits: with current view bounds and changes bounds size.
@end

@interface UIView(UIViewHierarchy)
//27.取到父view
@property(nonatomic,readonly) UIView *superview;
//28.取到view的子view
@property(nonatomic,readonly,copy) NSArray *subviews;
//29.屏幕窗口
@property(nonatomic,readonly) UIWindow *window;
//30.把当前视图从它的父v视图中移除
– (void)removeFromSuperview;
//31.在视图中插入一个属兔，并且可以设置索引值
– (void)insertSubview:(UIView *)view atIndex:(NSInteger)index;
//32.交换指定位置的两个视图的位置
– (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2;
//33.增加一个子视图控件，新添加的控件默认都是在subviews数组的后面，也就是默认显示在最上面
– (void)addSubview:(UIView *)view;
//34.增加一个子控件，插入到siblingSubview的下面
– (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview;
//35.增加一个子控件，插入到siblingSubview的上面
– (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview;
//36.将一个指定的控件拖动到最上面来显示
– (void)bringSubviewToFront:(UIView *)view;
//37.将一个指定的控件拖动到最下面来显示
– (void)sendSubviewToBack:(UIView *)view;
//38.告诉视图 子视图已经添加，默认不执行任何操作，子类可以重写
– (void)didAddSubview:(UIView *)subview;
//39.通知视图某个子视图即将被移除，默认不执行任何操作，子类可以重写
– (void)willRemoveSubview:(UIView *)subview;
//40.通知即将移动到新的父视图中
– (void)willMoveToSuperview:(UIView *)newSuperview;
//41.通知已经移动到新的父视图
– (void)didMoveToSuperview;
//42.通知即将已移动到新的创楼
– (void)willMoveToWindow:(UIWindow *)newWindow;
//43.通知已经移动到新的窗口
– (void)didMoveToWindow;
//44.返回一个布尔值 盘都某个视图是不是view的子控件或者子控件的子控件
– (BOOL)isDescendantOfView:(UIView *)view; // returns YES for self.
//45.通过tag获得对应tag的子控件
– (UIView *)viewWithTag:(NSInteger)tag; // recursive search. includes self

// Allows you to perform layout before the drawing cycle happens. -layoutIfNeeded forces layout early
//46.在对现在有布局有调整更改后，使用这个方法进行更新
– (void)setNeedsLayout;
//47.强制进行更新layout，通常与上面的方法结合一块使用
– (void)layoutIfNeeded;
//48.一般写在view内部，当控件的大小约束发生变化的时候在这里重写布局子控件的位置和尺寸，一般在这个方法里面或者视图的frame是最准确的
– (void)layoutSubviews; // override point. called by layoutIfNeeded automatically. As of iOS 6.0, when constraints-based layout is used the base implementation applies the constraints-based layout, otherwise it does nothing.

/*
-layoutMargins returns a set of insets from the edge of the view’s bounds that denote a default spacing for laying out content.
If preservesSuperviewLayoutMargins is YES, margins cascade down the view tree, adjusting for geometry offsets, so that setting the left value of layoutMargins on a superview will affect the left value of layoutMargins for subviews positioned close to the left edge of their superview’s bounds
If your view subclass uses layoutMargins in its layout or drawing, override -layoutMarginsDidChange in order to refresh your view if the margins change.
*/
//49.iOS8的新特性，我们可以用这个属性去定义view之间的间距，该属性只对autolayout布局有效。
@property (nonatomic) UIEdgeInsets layoutMargins NS_AVAILABLE_IOS(8_0);
//50. preservesSuperviewLayoutMargins这个属性默认是NO，如果把它设为YES，layoutMargins会根据屏幕中相关view的布局而改变。
@property (nonatomic) BOOL preservesSuperviewLayoutMargins NS_AVAILABLE_IOS(8_0); // default is NO – set to enable pass-through or cascading behavior of margins from this view’s parent to its children
//51.在我们改变view的layoutMargins这个属性时，会触发这个方法，我们在自己的view里面可以重写这个方法来捕获layoutMargins的变化。在大多数情况下，我们可以在这个方法里面触发drawing和layout的update。
– (void)layoutMarginsDidChange NS_AVAILABLE_IOS(8_0);

@end

@interface UIView(UIViewRendering)
//52.如果我们想要在一个UIView中绘图，需要写一个扩展UIView的类，并重写drawRect方法，在这里进行绘图操作。这个方法不能直接调用。苹果要求我们调用UIView类中的setNeedsDisplay方法，则程序会自动调用drawRect方法进行重回（调用setNeedsDisplay会自动调用drawRect）
– (void)drawRect:(CGRect)rect;
//53.调用这个方法会自动调用drawRect方法
– (void)setNeedsDisplay;
//54.同上，直接调用setNeedsDisplay，或者setNeedsDisplayInRect处罚drawRect，但是有个前提条件是rect不能为0
– (void)setNeedsDisplayInRect:(CGRect)rect;
//55.当时YES的时候，如果子视图的范围超出了父视图的边界，那么超出的部分就会被裁剪掉。
@property(nonatomic) BOOL clipsToBounds; // When YES, content and subviews are clipped to the bounds of the view. Default is NO.
//56.view的背景颜色
@property(nonatomic,copy) UIColor *backgroundColor UI_APPEARANCE_SELECTOR; // default is nil. Can be useful with the appearance proxy on custom UIView subclasses.
//57.透明度
@property(nonatomic) CGFloat alpha; // animatable. default is 1.0
//58.不透明度
@property(nonatomic,getter=isOpaque) BOOL opaque; // default is YES. opaque views must fill their entire bounds or the results are undefined. the active CGContext in drawRect: will not have been cleared and may have non-zeroed pixels
//59.如果设置为YES,在view请求之前都会清楚current context buffer，来更新相同区域
@property(nonatomic) BOOL clearsContextBeforeDrawing; // default is YES. ignored for opaque views. for non-opaque views causes the active CGContext in drawRect: to be pre-filled with transparent pixels
//60.隐藏
@property(nonatomic,getter=isHidden) BOOL hidden; // default is NO. doesn’t check superviews
//61.内容显示的模式
@property(nonatomic) UIViewContentMode contentMode; // default is UIViewContentModeScaleToFill
//62.图片的拉伸操作 例如
imageView.image = [UIImage imageNamed:@”image.png”]; [imageView setContentStretch:CGRectMake(150.0/300.0,75.0/150.0,10.0/300.0,10.0/150.0)];
image.png的大小是 210.0  x  126.0 ；
imageView的frame是（9，117，300，150）；
150.0/300.0表示x轴上，前150个像素不进行拉伸。
75.0/150.0表示y轴上，前75个像素不进行拉伸。
10.0/300.0表示x轴上150后的10个像素（151-160）进行拉伸，直到image.png铺满imageView。
10.0/150.0表示y轴上75后的10个（76-85）像素进行拉伸，直到image.png铺满imageView。
@property(nonatomic) CGRect contentStretch NS_DEPRECATED_IOS(3_0,6_0); // animatable. default is unit rectangle {{0,0} {1,1}}. Now deprecated: please use -[UIImage resizableImageWithCapInsets:] to achieve the same effect.
//63.蒙板view
@property(nonatomic,retain) UIView *maskView NS_AVAILABLE_IOS(8_0);

/*
-tintColor always returns a color. The color returned is the first non-default value in the receiver’s superview chain (starting with itself).
If no non-default value is found, a system-defined color is returned.
If this view’s -tintAdjustmentMode returns Dimmed, then the color that is returned for -tintColor will automatically be dimmed.
If your view subclass uses tintColor in its rendering, override -tintColorDidChange in order to refresh the rendering if the color changes.
*/
//63.这个属性使用是改变应用程序的外观的。默认tintColor的值为nil，这表示它将会运用父食欲层次的颜色来进行着色。如果父视图中没有设置tintColor，那么默认系统就会使用蓝色。因此，可以通过root view controller的tintColor来改变系统整体的颜色。
@property(nonatomic,retain) UIColor *tintColor NS_AVAILABLE_IOS(7_0);

/*
-tintAdjustmentMode always returns either UIViewTintAdjustmentModeNormal or UIViewTintAdjustmentModeDimmed. The value returned is the first non-default value in the receiver’s superview chain (starting with itself).
If no non-default value is found, UIViewTintAdjustmentModeNormal is returned.
When tintAdjustmentMode has a value of UIViewTintAdjustmentModeDimmed for a view, the color it returns from tintColor will be modified to give a dimmed appearance.
When the tintAdjustmentMode of a view changes (either the view’s value changing or by one of its superview’s values changing), -tintColorDidChange will be called to allow the view to refresh its rendering.
*/
//64.这个属性可以使tintColor变暗，因此整个视图层次变暗。并且它又三个值在里面选择一个设置。
@property(nonatomic) UIViewTintAdjustmentMode tintAdjustmentMode NS_AVAILABLE_IOS(7_0);

/*
The -tintColorDidChange message is sent to appropriate subviews of a view when its tintColor is changed by client code or to subviews in the view hierarchy of a view whose tintColor is implicitly changed when its superview or tintAdjustmentMode changes.
*/
//65.覆盖这个方法的目的是为了当tintColor改变的时候自定义一些行为。
– (void)tintColorDidChange NS_AVAILABLE_IOS(7_0);

@end

@interface UIView(UIViewAnimation)
//66.开始动画
+ (void)beginAnimations:(NSString *)animationID context:(void *)context; // additional context info passed to will start/did stop selectors. begin/commit can be nested
//67.提交动画
+ (void)commitAnimations; // starts up any animations when the top level animation is commited
//68.设置动画代理
+ (void)setAnimationDelegate:(id)delegate; // default = nil
//69.动画将要开始时执行方法（必须要先设置动画代理）
+ (void)setAnimationWillStartSelector:(SEL)selector; // default = NULL. -animationWillStart:(NSString *)animationID context:(void *)context
//70.动画已结束时执行方法（必须要先设置动画代理）
+ (void)setAnimationDidStopSelector:(SEL)selector; // default = NULL. -animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
//71.设置动画时长
+ (void)setAnimationDuration:(NSTimeInterval)duration; // default = 0.2
//72.动画延迟执行时间
+ (void)setAnimationDelay:(NSTimeInterval)delay; // default = 0.0
//73.设置在动画块内部动画属性改变的开始时间
+ (void)setAnimationStartDate:(NSDate *)startDate; // default = now ([NSDate date])
//74.设置动画曲线，默认是匀速进行
+ (void)setAnimationCurve:(UIViewAnimationCurve)curve; // default = UIViewAnimationCurveEaseInOut
//75.动画的重复播放此时
+ (void)setAnimationRepeatCount:(float)repeatCount; // default = 0.0. May be fractional
//76.设置是否自定翻转当前的动画效果
+ (void)setAnimationRepeatAutoreverses:(BOOL)repeatAutoreverses; // default = NO. used if repeat count is non-zero
//77.设置动画从当前状态开始播放
+ (void)setAnimationBeginsFromCurrentState:(BOOL)fromCurrentState; // default = NO. If YES, the current view position is always used for new animations — allowing animations to “pile up” on each other. Otherwise, the last end state is used for the animation (the default).
//78.在动画块中为视图设置过渡
+ (void)setAnimationTransition:(UIViewAnimationTransition)transition forView:(UIView *)view cache:(BOOL)cache; // current limitation – only one per begin/commit block
//79.设置是否激活动画
+ (void)setAnimationsEnabled:(BOOL)enabled; // ignore any attribute changes while set.
//80.返回一个布尔值表示动画是否结束
+ (BOOL)areAnimationsEnabled;
//81.先检查动画当前是否启用，然后禁止动画，执行block内的方法，最后重新启用动画，而且这个方法不会阻塞基于CoreAnimation的动画
+ (void)performWithoutAnimation:(void (^)(void))actionsWithoutAnimation NS_AVAILABLE_IOS(7_0);

@end

@interface UIView(UIViewAnimationWithBlocks)
//81.block封装参与动画 动画时长 延迟时间 动画选项条件 动画结束的回调
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);
//82.block封装参与动画 动画时长 动画结束的回调
+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // delay = 0.0, options = 0
//83.block封装参与动画 动画时长
+ (void)animateWithDuration:(NSTimeInterval)duration animations:(void (^)(void))animations NS_AVAILABLE_IOS(4_0); // delay = 0.0, options = 0, completion = NULL

/* Performs `animations` using a timing curve described by the motion of a spring. When `dampingRatio` is 1, the animation will smoothly decelerate to its final model values without oscillating. Damping ratios less than 1 will oscillate more and more before coming to a complete stop. You can use the initial spring velocity to specify how fast the object at the end of the simulated spring was moving before it was attached. It’s a unit coordinate system, where 1 is defined as travelling the total animation distance in a second. So if you’re changing an object’s position by 200pt in this animation, and you want the animation to behave as if the object was moving at 100pt/s before the animation started, you’d pass 0.5. You’ll typically want to pass 0 for the velocity. */
//84.
+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);

+ (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);

+ (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // toView added to fromView.superview, fromView removed from its superview

/* Performs the requested system-provided animation on one or more views. Specify addtional animations in the parallelAnimations block. These additional animations will run alongside the system animation with the same timing and duration that the system animation defines/inherits. Additional animations should not modify properties of the view on which the system animation is being performed. Not all system animations honor all available options.
*/
+ (void)performSystemAnimation:(UISystemAnimation)animation onViews:(NSArray *)views options:(UIViewAnimationOptions)options animations:(void (^)(void))parallelAnimations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);

@end
//UIView的关键帧动画
@interface UIView (UIViewKeyframeAnimations)
//84.UIView添加了一个方法用来直接使用关键帧动画而不用辅助CoreAnimation来实现，这个方法需要浮点型的动画持续时长和延迟，一些二进制组成的选项和动画运行的block和动画运行完后最后的block，这是一个标准的UIVIew的动画的实现。
+ (void)animateKeyframesWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay options:(UIViewKeyframeAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
//85.这个方法是用来添加动画序列内的不动点。
+ (void)addKeyframeWithRelativeStartTime:(double)frameStartTime relativeDuration:(double)frameDuration animations:(void (^)(void))animations NS_AVAILABLE_IOS(7_0); // start time and duration are values between 0.0 and 1.0 specifying time and duration relative to the overall time of the keyframe animation
@end

@interface UIView (UIViewGestureRecognizers)

@property(nonatomic,copy) NSArray *gestureRecognizers NS_AVAILABLE_IOS(3_2);

– (void)addGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer NS_AVAILABLE_IOS(3_2);
– (void)removeGestureRecognizer:(UIGestureRecognizer*)gestureRecognizer NS_AVAILABLE_IOS(3_2);

// called when the recognizer attempts to transition out of UIGestureRecognizerStatePossible if a touch hit-tested to this view will be cancelled as a result of gesture recognition
// returns YES by default. return NO to cause the gesture recognizer to transition to UIGestureRecognizerStateFailed
// subclasses may override to prevent recognition of particular gestures. for example, UISlider prevents swipes parallel to the slider that start in the thumb
– (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer NS_AVAILABLE_IOS(6_0);

@end

@interface UIView (UIViewMotionEffects)

/*! Begins applying `effect` to the receiver. The effect’s emitted keyPath/value pairs will be
applied to the view’s presentation layer.

Animates the transition to the motion effect’s values using the present UIView animation
context. */
– (void)addMotionEffect:(UIMotionEffect *)effect NS_AVAILABLE_IOS(7_0);

/*! Stops applying `effect` to the receiver. Any affected presentation values will animate to
their post-removal values using the present UIView animation context. */
– (void)removeMotionEffect:(UIMotionEffect *)effect NS_AVAILABLE_IOS(7_0);

@property (copy, nonatomic) NSArray *motionEffects NS_AVAILABLE_IOS(7_0);

@end

//
// UIView Constraint-based Layout Support
//

typedef NS_ENUM(NSInteger, UILayoutConstraintAxis) {
UILayoutConstraintAxisHorizontal = 0,
UILayoutConstraintAxisVertical = 1
};

// Installing Constraints

/* A constraint is typically installed on the closest common ancestor of the views involved in the constraint.
It is required that a constraint be installed on _a_ common ancestor of every view involved. The numbers in a constraint are interpreted in the coordinate system of the view it is installed on. A view is considered to be an ancestor of itself.
*/
@interface UIView (UIConstraintBasedLayoutInstallingConstraints)
//85.返回当前view中的所有constraints
– (NSArray *)constraints NS_AVAILABLE_IOS(6_0);
//86.添加单个constraint
– (void)addConstraint:(NSLayoutConstraint *)constraint NS_AVAILABLE_IOS(6_0); // This method will be deprecated in a future release and should be avoided.  Instead, set NSLayoutConstraint’s active property to YES.
//87.添加一组contraint
– (void)addConstraints:(NSArray *)constraints NS_AVAILABLE_IOS(6_0); // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint activateConstraints:].
//88.移除单个contraint
– (void)removeConstraint:(NSLayoutConstraint *)constraint NS_AVAILABLE_IOS(6_0); // This method will be deprecated in a future release and should be avoided.  Instead set NSLayoutConstraint’s active property to NO.
//89.移除一组contraint
– (void)removeConstraints:(NSArray *)constraints NS_AVAILABLE_IOS(6_0); // This method will be deprecated in a future release and should be avoided.  Instead use +[NSLayoutConstraint deactivateConstraints:].
@end

// Core Layout Methods

/* To render a window, the following passes will occur, if necessary.

update constraints
layout
display

Please see the conceptual documentation for a discussion of these methods.
*/

@interface UIView (UIConstraintBasedLayoutCoreMethods)
/*******autoLayout的布局过程是update constraints（uodateContraints）->layout subviews(layoutSubviews)->display(drawRect)这三步不是单向的，如果layout的过程中改变了constraint，就会触发update constraints，进行新的一轮迭代。我们在实际代码中，应该避免在此造成死循环 *******/
//90.我们可以调用这个方法触发update Constraints的操作。在neneedsUpdateContraints返回YES时，才能成功触发update Contraints的操作。我们不应该重写这个方法。
– (void)updateConstraintsIfNeeded NS_AVAILABLE_IOS(6_0); // Updates the constraints from the bottom up for the view hierarchy rooted at the receiver. UIWindow’s implementation creates a layout engine if necessary first.
//91.自定义view时，我们应该重写这个方法来设置当前view布局的布局约束，重写这个方法时一定要调用[super updateContraints]
– (void)updateConstraints NS_AVAILABLE_IOS(6_0); // Override this to adjust your special constraints during a constraints update pass
//92.布局系统使用这个返回值来确定是否调用updateContraints
– (BOOL)needsUpdateConstraints NS_AVAILABLE_IOS(6_0);
//93.当一个自定义的view某一个属性的改变可能影响到界面布局，我们应该调用这个方法来告诉布局系统在未来某个时刻需要更新，系统会调用updateContraints去更新布局。
– (void)setNeedsUpdateConstraints NS_AVAILABLE_IOS(6_0);
@end

// Compatibility and Adoption

@interface UIView (UIConstraintBasedCompatibility)

/* by default, the autoresizing mask on a view gives rise to constraints that fully determine the view’s position. Any constraints you set on the view are likely to conflict with autoresizing constraints, so you must turn off this property first. IB will turn it off for you.
*/
//94.我们在使用代码来写自己的约束布局代码时，必须设置当前view的translatesAutoresizingMaskIntoContraints为NO，否则无法工作。
– (BOOL)translatesAutoresizingMaskIntoConstraints NS_AVAILABLE_IOS(6_0); // Default YES
– (void)setTranslatesAutoresizingMaskIntoConstraints:(BOOL)flag NS_AVAILABLE_IOS(6_0);

/* constraint-based layout engages lazily when someone tries to use it (e.g., adds a constraint to a view). If you do all of your constraint set up in -updateConstraints, you might never even receive updateConstraints if no one makes a constraint. To fix this chicken and egg problem, override this method to return YES if your view needs the window to use constraint-based layout.
*/
+ (BOOL)requiresConstraintBasedLayout NS_AVAILABLE_IOS(6_0);

@end

// Separation of Concerns

@interface UIView (UIConstraintBasedLayoutLayering)

/* Constraints do not actually relate the frames of the views, rather they relate the “alignment rects” of views. This is the same as the frame unless overridden by a subclass of UIView. Alignment rects are the same as the “layout rects” shown in Interface Builder 3. Typically the alignment rect of a view is what the end user would think of as the bounding rect around a control, omitting ornamentation like shadows and engraving lines. The edges of the alignment rect are what is interesting to align, not the shadows and such.
*/

/* These two methods should be inverses of each other. UIKit will call both as part of layout computation.
They may be overridden to provide arbitrary transforms between frame and alignment rect, though the two methods must be inverses of each other.
However, the default implementation uses -alignmentRectInsets, so just override that if it’s applicable. It’s easier to get right.
A view that displayed an image with some ornament would typically override these, because the ornamental part of an image would scale up with the size of the frame.
Set the NSUserDefault UIViewShowAlignmentRects to YES to see alignment rects drawn.
*/
– (CGRect)alignmentRectForFrame:(CGRect)frame NS_AVAILABLE_IOS(6_0);
– (CGRect)frameForAlignmentRect:(CGRect)alignmentRect NS_AVAILABLE_IOS(6_0);

/* override this if the alignment rect is obtained from the frame by insetting each edge by a fixed amount. This is only called by alignmentRectForFrame: and frameForAlignmentRect:.
*/
– (UIEdgeInsets)alignmentRectInsets NS_AVAILABLE_IOS(6_0);

/* When you make a constraint on the NSLayoutAttributeBaseline of a view, the system aligns with the bottom of the view returned from this method. A nil return is interpreted as the receiver, and a non-nil return must be in the receiver’s subtree. UIView’s implementation returns self.
*/
– (UIView *)viewForBaselineLayout NS_AVAILABLE_IOS(6_0);

/* Override this method to tell the layout system that there is something it doesn’t natively understand in this view, and this is how large it intrinsically is. A typical example would be a single line text field. The layout system does not understand text – it must just be told that there’s something in the view, and that that something will take a certain amount of space if not clipped.

In response, UIKit will set up constraints that specify (1) that the opaque content should not be compressed or clipped, (2) that the view prefers to hug tightly to its content.

A user of a view may need to specify the priority of these constraints. For example, by default, a push button
-strongly wants to hug its content in the vertical direction (buttons really ought to be their natural height)
-weakly hugs its content horizontally (extra side padding between the title and the edge of the bezel is acceptable)
-strongly resists compressing or clipping content in both directions.

However, you might have a case where you’d prefer to show all the available buttons with truncated text rather than losing some of the buttons. The truncation might only happen in portrait orientation but not in landscape, for example. In that case you’d want to setContentCompressionResistancePriority:forAxis: to (say) UILayoutPriorityDefaultLow for the horizontal axis.

The default ‘strong’ and ‘weak’ priorities referred to above are UILayoutPriorityDefaultHigh and UILayoutPriorityDefaultLow.

Note that not all views have an intrinsicContentSize. UIView’s default implementation is to return (UIViewNoIntrinsicMetric, UIViewNoIntrinsicMetric). The _intrinsic_ content size is concerned only with data that is in the view itself, not in other views. Remember that you can also set constant width or height constraints on any view, and you don’t need to override instrinsicContentSize if these dimensions won’t be changing with changing view content.
*/
UIKIT_EXTERN const CGFloat UIViewNoIntrinsicMetric NS_AVAILABLE_IOS(6_0); // -1
– (CGSize)intrinsicContentSize NS_AVAILABLE_IOS(6_0);
– (void)invalidateIntrinsicContentSize NS_AVAILABLE_IOS(6_0); // call this when something changes that affects the intrinsicContentSize. Otherwise UIKit won’t notice that it changed.

– (UILayoutPriority)contentHuggingPriorityForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
– (void)setContentHuggingPriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);

– (UILayoutPriority)contentCompressionResistancePriorityForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
– (void)setContentCompressionResistancePriority:(UILayoutPriority)priority forAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);
@end

// Size To Fit

UIKIT_EXTERN const CGSize UILayoutFittingCompressedSize NS_AVAILABLE_IOS(6_0);
UIKIT_EXTERN const CGSize UILayoutFittingExpandedSize NS_AVAILABLE_IOS(6_0);

@interface UIView (UIConstraintBasedLayoutFittingSize)
/* The size fitting most closely to targetSize in which the receiver’s subtree can be laid out while optimally satisfying the constraints. If you want the smallest possible size, pass UILayoutFittingCompressedSize; for the largest possible size, pass UILayoutFittingExpandedSize.
Also see the comment for UILayoutPriorityFittingSizeLevel.
*/
– (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize NS_AVAILABLE_IOS(6_0); // Equivalent to sending -systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority: with UILayoutPriorityFittingSizeLevel for both priorities.
– (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority NS_AVAILABLE_IOS(8_0);
@end

// Debugging

/* Everything in this section should be used in debugging only, never in shipping code. These methods may not exist in the future – no promises.
*/
@interface UIView (UIConstraintBasedLayoutDebugging)

/* This returns a list of all the constraints that are affecting the current location of the receiver. The constraints do not necessarily involve the receiver, they may affect the frame indirectly.
Pass UILayoutConstraintAxisHorizontal for the constraints affecting [self center].x and CGRectGetWidth([self bounds]), and UILayoutConstraintAxisVertical for the constraints affecting[self center].y and CGRectGetHeight([self bounds]).
*/
– (NSArray *)constraintsAffectingLayoutForAxis:(UILayoutConstraintAxis)axis NS_AVAILABLE_IOS(6_0);

/* If there aren’t enough constraints in the system to uniquely determine layout, we say the layout is ambiguous. For example, if the only constraint in the system was x = y + 100, then there are lots of different possible values for x and y. This situation is not automatically detected by UIKit, due to performance considerations and details of the algorithm used for layout.
The symptom of ambiguity is that views sometimes jump from place to place, or possibly are just in the wrong place.
-hasAmbiguousLayout runs a check for whether there is another center and bounds the receiver could have that could also satisfy the constraints.
-exerciseAmbiguousLayout does more. It randomly changes the view layout to a different valid layout. Making the UI jump back and forth can be helpful for figuring out where you’re missing a constraint.
*/
– (BOOL)hasAmbiguousLayout NS_AVAILABLE_IOS(6_0);
– (void)exerciseAmbiguityInLayout NS_AVAILABLE_IOS(6_0);
@end

@interface UIView (UIStateRestoration)
@property (nonatomic, copy) NSString *restorationIdentifier NS_AVAILABLE_IOS(6_0);
– (void) encodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
– (void) decodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
@end

@interface UIView (UISnapshotting)
/*
* When requesting a snapshot, ‘afterUpdates’ defines whether the snapshot is representative of what’s currently on screen or if you wish to include any recent changes before taking the snapshot.

If called during layout from a committing transaction, snapshots occurring after the screen updates will include all changes made, regardless of when the snapshot is taken and the changes are made. For example:

– (void)layoutSubviews {
UIView *snapshot = [self snapshotViewAfterScreenUpdates:YES];
self.alpha = 0.0;
}

The snapshot will appear to be empty since the change in alpha will be captured by the snapshot. If you need to animate the view during layout, animate the snapshot instead.

* Creating snapshots from existing snapshots (as a method to duplicate, crop or create a resizable variant) is supported. In cases where many snapshots are needed, creating a snapshot from a common superview and making subsequent snapshots from it can be more performant. Please keep in mind that if ‘afterUpdates’ is YES, the original snapshot is committed and any changes made to it, not the view originally snapshotted, will be included.
*/
– (UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0);
– (UIView *)resizableSnapshotViewFromRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates withCapInsets:(UIEdgeInsets)capInsets NS_AVAILABLE_IOS(7_0); // Resizable snapshots will default to stretching the center
// Use this method to render a snapshot of the view hierarchy into the current context. Returns NO if the snapshot is missing image data, YES if the snapshot is complete. Calling this method from layoutSubviews while the current transaction is committing will capture what is currently displayed regardless if afterUpdates is YES.
– (BOOL)drawViewHierarchyInRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates NS_AVAILABLE_IOS(7_0);
@end
