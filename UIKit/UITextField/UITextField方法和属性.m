// 初始化一个文字框：
UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 30, 100, 100)];

@interface UITextField : UIControl <UITextInput, NSCoding, UIContentSizeCategoryAdjusting>
// 设置和获取文字框文字：
@property(nonatomic,copy)  NSString *text;

// 通过AttributedString创建和获取文字：
@property(nonatomic,copy)   NSAttributedString  *attributedText；

// 设置字体颜色属性：
@property(nonatomic,retain) UIColor  *textColor;

// 设置字体属性：
@property(nonatomic,retain) UIFont  *font;

// 设置字体对齐格式：
@property(nonatomic)NSTextAlignment     textAlignment;

// 设置输入框风格：
@property(nonatomic) UITextBorderStyle    borderStyle;

// 这个风格是一个枚举，如下：
typedef NS_ENUM(NSInteger, UITextBorderStyle) {
    //没有任何边框
    UITextBorderStyleNone,
    //线性边框
    UITextBorderStyleLine,
    //阴影效果边框
    UITextBorderStyleBezel,
    //原型效果边框
    UITextBorderStyleRoundedRect
};

// 设置默认字体属性
@property(nonatomic,copy)  NSDictionary *defaultTextAttributes；
// 这个属性的设置会影响到全部字体的属性。

// 设置缺省时显示的灰度字符串
@property(nonatomic,copy)  NSString  *placeholder;

// 通过AttributedString设置缺省字符串
@property(nonatomic,copy)  NSAttributedString  *attributedPlaceholder；

// 设置是否在开始编辑时清空输入框内容
@property(nonatomic) BOOL  clearsOnBeginEditing;

// 设置字体大小是否随宽度自适应（默认为NO）
@property(nonatomic)  BOOL   adjustsFontSizeToFitWidth;

// 设置最小字体大小
@property(nonatomic) CGFloat    minimumFontSize;

// 设置背景图片（会被拉伸）
@property(nonatomic,retain) UIImage *background;

// 设置禁用时的背景图片
@property(nonatomic,retain) UIImage  *disabledBackground;

// 是否正在编辑（只读属性）
@property(nonatomic,readonly,getter=isEditing) BOOL editing;

// 是否允许更改字符属性字典
@property(nonatomic) BOOL allowsEditingTextAttributes；

// 设置属性字典
@property(nonatomic,copy) NSDictionary *typingAttributes；

// 设置清除按钮的显示模式
@property(nonatomic) UITextFieldViewMode  clearButtonMode;

// 这是一个枚举，如下：
typedef NS_ENUM(NSInteger, UITextFieldViewMode) {
    //从不显示
    UITextFieldViewModeNever,
    //编辑的时候显示
    UITextFieldViewModeWhileEditing,
    //非编辑的时候显示
    UITextFieldViewModeUnlessEditing,
    //任何时候都显示
    UITextFieldViewModeAlways
};

// 设置输入框左边的view
@property(nonatomic,retain) UIView *leftView;

// 设置输入框左视图的显示模式
@property(nonatomic)  UITextFieldViewMode  leftViewMode;



// 设置输入框右边的view
@property(nonatomic,retain) UIView *rightView;

// 设置输入框右视图的显示模式
@property(nonatomic)  UITextFieldViewMode  rightViewMode;

// 设置输入框成为第一响应时弹出的视图和辅助视图（类似键盘）
@property (readwrite, retain) UIView *inputView;
@property (readwrite, retain) UIView *inputAccessoryView;

// 这个属性设置是否允许再次编辑时在内容中间插入内容
@property(nonatomic) BOOL clearsOnInsertion；

// 注销第一响应（収键盘）
- (BOOL)endEditing:(BOOL)force;

#pragma mark - UITextFieldDelegate 代理中的方法

// 点击输入框时触发的方法，返回YES则可以进入编辑状态，NO则不能。
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;

// 开始编辑时调用的方法
- (void)textFieldDidBeginEditing:(UITextField *)textField;

// 将要结束编辑时调用的方法，返回YES则可以结束编辑状态，NO则不能
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;

// 结束编辑调用的方法
- (void)textFieldDidEndEditing:(UITextField *)textField;

// 输入字符时调用的方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

// 点击清除按钮时调用的函数，返回YES则可以清除，点击NO则不能清除
- (BOOL)textFieldShouldClear:(UITextField *)textField;

// 点击return键触发的函数
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@end
