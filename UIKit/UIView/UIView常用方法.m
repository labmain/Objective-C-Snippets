// 从父控件中移除一个控件
- (void)removeFromSuperview;
// 添加一个子控件(可以将子控件插入到subviews数组中index这个位置)
- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index;
// 交换subviews数组中所存放子控件的位置
- (void)exchangeSubviewAtIndex:(NSInteger)index1 withSubviewAtIndex:(NSInteger)index2;
// 添加一个子控件(新添加的控件默认都在subviews数组的后面, 新添加的控件默认都显示在最上面\最顶部)
- (void)addSubview:(UIView *)view;
// 添加一个子控件view(被挡在siblingSubview的下面)
- (void)insertSubview:(UIView *)view belowSubview:(UIView *)siblingSubview;
// 添加一个子控件view(盖在siblingSubview的上面)
- (void)insertSubview:(UIView *)view aboveSubview:(UIView *)siblingSubview;
// 将某个子控件拉到最上面(最顶部)来显示
- (void)bringSubviewToFront:(UIView *)view;
// 将某个子控件拉到最下面(最底部)来显示
- (void)sendSubviewToBack:(UIView *)view;
/**系统自动调用(留给子类去实现)**/
- (void)didAddSubview:(UIView *)subview;
- (void)willRemoveSubview:(UIView *)subview;
- (void)willMoveToSuperview:(UIView *)newSuperview;
- (void)didMoveToSuperview;
- (void)willMoveToWindow:(UIWindow *)newWindow;
- (void)didMoveToWindow;
/**系统自动调用**/
// 是不是view的子控件或者子控件的子控件(是否为view的后代)
- (BOOL)isDescendantOfView:(UIView *)view;  // returns YES for self.
// 通过tag获得对应的子控件(也可以或者子控件的子控件)
- (UIView *)viewWithTag:(NSInteger)tag;     // recursive search. includes self
/**系统自动调用(留给子类去实现)**/
// 控件的frame发生改变的时候就会调用,一般在这里重写布局子控件的位置和尺寸
// 重写了这个写方法后,一定调用[super layoutSubviews];
- (void)layoutSubviews;
