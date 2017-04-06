- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets
// 这个方法只接收一个UIEdgeInsets类型的参数，可以通过设置UIEdgeInsets的left、right、top、bottom来分别指定左端盖宽度、右端盖宽度、顶端盖高度、底端盖高度

CGFloat top = 25; // 顶端盖高度
CGFloat bottom = 25 ; // 底端盖高度
CGFloat left = 10; // 左端盖宽度
CGFloat right = 10; // 右端盖宽度  
UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
// 伸缩后重新赋值
image = [image resizableImageWithCapInsets:insets];


- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode
// 对比iOS5.0中的方法，只多了一个UIImageResizingMode参数，用来指定拉伸的模式：
// UIImageResizingModeStretch：拉伸模式，通过拉伸UIEdgeInsets指定的矩形区域来填充图片
// UIImageResizingModeTile：平铺模式，通过重复显示UIEdgeInsets指定的矩形区域来填充图片
CGFloat top = 25; // 顶端盖高度
CGFloat bottom = 25 ; // 底端盖高度
CGFloat left = 10; // 左端盖宽度
CGFloat right = 10; // 右端盖宽度
UIEdgeInsets insets = UIEdgeInsetsMake(top, left, bottom, right);
// 指定为拉伸模式，伸缩后重新赋值
image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];

Xcode自带的Show Slicing 功能

选中Assets中的图片,右下角有一个Show Slicing ,点击Show Slicing 以后, 会显示如下界面, 点击图中的Start Slicing，拖动虚线,调整拉伸区域, 虚线内的白色区域会被拉伸, 注意要保留住四周的圆角,选择好拉伸区域以后, 点击右下角的Show Overview,就会保存拉伸后的效果了.
