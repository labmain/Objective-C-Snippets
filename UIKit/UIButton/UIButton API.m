@interface UIBUtton
// button的便利构造方法
// 参数buttonType是button的类型
+ (id)buttonWithType:(UIButtonType)buttonType;
// 能够定义的button类型
 typedef NS_ENUM(NSInteger, UIButtonType) {
     UIButtonTypeCustom = 0,                        //自定义风格
     UIButtonTypeSystem NS_ENUM_AVAILABLE_IOS(7_0), //系统样式，从iOS7开始使用
     UIButtonTypeDetailDisclosure,                  //蓝色小箭头按钮，主要做详细说明用
     UIButtonTypeInfoLight,                         //亮色感叹号
     UIButtonTypeInfoDark,                          //暗色感叹号
     UIButtonTypeContactAdd,                        //十字加号按钮
     UIButtonTypeRoundedRect = UIButtonTypeSystem,  //圆角矩形，从iOS7废弃，iOS6中可以使用
 };
// button的内容偏移量。默认为UIEdgeInsetsZero（我习惯称它为偏移量）
// UIEdgeInsets就是插入间隔区域。正值表示间隔值，负值表示超出参照物的距离。
// UIEdgeInsetsMake(top, left, bottom, right)有四个值需要设置，分别距离上左下右边的间隔。
@property(nonatomic) UIEdgeInsets contentEdgeInsets;
// button的标题偏移量。这个属性和图片偏移量是相对的，比如：自定义一个按钮实现的效果是图片在左边，标题在右边，可以用这个属性，设置完标题偏移量，图片偏移量就是相对于标题的。默认为UIEdgeInsetsZero
@property(nonatomic) UIEdgeInsets titleEdgeInsets;
// button的状态为高亮时，文本的阴影会反转。默认是NO
@property(nonatomic) BOOL reversesTitleShadowWhenHighlighted;
// button的图片偏移量。默认为UIEdgeInsetsZero
@property(nonatomic) UIEdgeInsets imageEdgeInsets;
// button的状态为高亮时，图像变暗。默认是YES
@property(nonatomic) BOOL adjustsImageWhenHighlighted;
// button的状态为禁用时，图像变暗。默认是YES
@property(nonatomic) BOOL adjustsImageWhenDisabled;
// button的状态为高亮时，发光。默认是NO
@property(nonatomic) BOOL showsTouchWhenHighlighted;
// iOS6中高亮颜色，默认是蓝色。iOS7中系统的一些样式DetailDisclosure InfoLight InfoDark ContactAdd颜色会改变，其他的没看到效果。
@property(nonatomic,retain) UIColor *tintColor NS_AVAILABLE_IOS(5_0);
// button的样式
@property(nonatomic,readonly) UIButtonType buttonType;
// 设置button的标题，后面参数是状态，在不同的状态显示不同的标题。
- (void)setTitle:(NSString *)title forState:(UIControlState)state;
// button的状态。包括一些其他的控制的状态
typedef NS_OPTIONS(NSUInteger, UIControlState) {
    UIControlStateNormal       = 0,      //正常状态
    UIControlStateHighlighted  = 1 << 0, //高亮状态
    UIControlStateDisabled     = 1 << 1, //禁用状态
    UIControlStateSelected     = 1 << 2, //选中状态
    UIControlStateApplication  = 0x00FF0000,
    UIControlStateReserved     = 0xFF000000
};
// 设置button的标题颜色
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
// 设置button的标题阴影颜色
- (void)setTitleShadowColor:(UIColor *)color forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
// 设置button的图片。比如设置左边图片右边标题，则使用这个方法，而不是设置背景图。
- (void)setImage:(UIImage *)image forState:(UIControlState)state;
// 设置button的背景图片
- (void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state UI_APPEARANCE_SELECTOR;
// 设置button的多样化标题。比如中间一个字字体为10号颜色为红色，其他字为绿色。
- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state NS_AVAILABLE_IOS(6_0);
// 返回button的标题。在不同状态的标题
- (NSString *)titleForState:(UIControlState)state;
// 返回button的标题颜色
- (UIColor *)titleColorForState:(UIControlState)state;
// 返回button的标题阴影颜色
- (UIColor *)titleShadowColorForState:(UIControlState)state;
// 返回button的图片
- (UIImage *)imageForState:(UIControlState)state;
// 返回button的背景图片
- (UIImage *)backgroundImageForState:(UIControlState)state;
// 返回button的多样化标题
- (NSAttributedString *)attributedTitleForState:(UIControlState)state NS_AVAILABLE_IOS(6_0);
// button的当前标题。当按钮状态改变时值自动改变，可以做判断，当前标题是全文则点击展开标题设置为收起，当前标题是收起则点击收起全文。
@property(nonatomic,readonly,retain) NSString *currentTitle;
// button的当前标题颜色
@property(nonatomic,readonly,retain) UIColor *currentTitleColor;
// button的当前标题阴影颜色
@property(nonatomic,readonly,retain) UIColor *currentTitleShadowColor;
// button的当前图片。切换不同图片，比如做单选，多选可以使用。
@property(nonatomic,readonly,retain) UIImage *currentImage;
// button的当前背景图片
@property(nonatomic,readonly,retain) UIImage *currentBackgroundImage;
// button的当前多样化标题
@property(nonatomic,readonly,retain) NSAttributedString *currentAttributedTitle NS_AVAILABLE_IOS(6_0);
// button的标题label。设置字体大小
@property(nonatomic,readonly,retain) UILabel *titleLabel NS_AVAILABLE_IOS(3_0);
// button的图片视图
@property(nonatomic,readonly,retain) UIImageView *imageView NS_AVAILABLE_IOS(3_0);
// 返回背景绘制区域
- (CGRect)backgroundRectForBounds:(CGRect)bounds;
// 返回内容绘制区域。内容区域是显示图片和标题及他们特定对齐缩放等的范围
- (CGRect)contentRectForBounds:(CGRect)bounds;
// 返回标题的绘制区域
- (CGRect)titleRectForContentRect:(CGRect)contentRect;
// 返回图片的绘制区域
- (CGRect)imageRectForContentRect:(CGRect)contentRect;
@end

// 下面的属性都已废弃
@interface UIButton(UIButtonDeprecated)
@property(nonatomic,retain) UIFont *font NS_DEPRECATED_IOS(2_0, 3_0);
@property(nonatomic) NSLineBreakMode lineBreakMode NS_DEPRECATED_IOS(2_0, 3_0);
@property(nonatomic) CGSize titleShadowOffset NS_DEPRECATED_IOS(2_0, 3_0);
