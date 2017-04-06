// IB_DESIGNABLE 的具体使用方法:
// IB_DESIGNABLE的宏的功能就是让XCode动态渲染出该类图形化界面;
// 使用IB_DESIGNABLE的方式，把该宏加在自定义类的前面;

#import <UIKit/UIKit.h>

IB_DESIGNABLE  // 动态刷新

@interface YCCustomView : UIView

// 注意: 加上IBInspectable就可以可视化显示相关的属性哦
/** 可视化设置边框宽度 */
@property (nonatomic, assign)IBInspectable CGFloat borderWidth;
/** 可视化设置边框颜色 */
@property (nonatomic, strong)IBInspectable UIColor *borderColor;

/** 可视化设置圆角 */
@property (nonatomic, assign)IBInspectable CGFloat cornerRadius;

@end

// IBInspectable 的具体使用方法:
// 我们在上面已经知道了IB_DESIGNABLE的使用,我们能立即看到设置的圆角效果(动态刷新),但是有一个问题,我们通过设置Key Path来设置是不是很麻烦~,下面我们通过一种更加直观的方式来设置,如下:

// 重写set方法,根据可视化设置的值设置相关的属性
#import "YCCustomView.h"

@implementation YCCustomView

/**
 *  设置边框宽度
 *
 *  @param borderWidth 可视化视图传入的值
 */
- (void)setBorderWidth:(CGFloat)borderWidth {

    if (borderWidth < 0) return;

    self.layer.borderWidth = borderWidth;
}

/**
 *  设置边框颜色
 *
 *  @param borderColor 可视化视图传入的值
 */
- (void)setBorderColor:(UIColor *)borderColor {

    self.layer.borderColor = borderColor.CGColor;
}

/**
 *  设置圆角
 *
 *  @param cornerRadius 可视化视图传入的值
 */
- (void)setCornerRadius:(CGFloat)cornerRadius {

    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

@end
