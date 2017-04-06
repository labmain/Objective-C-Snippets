// 英文键盘高度                   216.0f   
// 中文键盘高度                     252.0f   
// 中文九宫格键盘未输入高度         184.f   
// 中文九宫格输入键盘高度                          251.5f 
那么怎样根据键盘高度的变化来改变textField的位置以达到textField不被遮住的目的呢？
网上搜索之后好像没找到类似的方法，于是自己动手解决，经过试验大体总结出两种方法，都是用notification实现的，但是在实现方式上有些不同。

第一种方法：使用UIKeyboardDidChangeFrameNotification

#import "TestViewController.h"
#define IOS_VERSION ([[UIDevice currentDevice] systemVersion].floatValue)
@interface TestViewController ()<UITextFieldDelegate>{
    CGFloat deltaY;
    float duration;    // 动画持续时间
    CGFloat originalY; // TextField原来的纵坐标
}
@property (retain, nonatomic) UITextField *testField;
@property (assign, nonatomic) NSInteger keyboardPresentFlag; // 键盘弹起的标志,弹出=1，收起=0
@end
@implementation TestViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    _testField = [[UITextField alloc] initWithFrame:CGRectMake(60, 300, 200, 30)];
    _testField.delegate = self;
    _testField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_testField];
    // 获取textField初始位置的Y轴坐标，这里就是30
    originalY = self.testField.frame.origin.y;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];
}
- (void)keyboardWillShow:(NSNotification *)notification {
    CGSize keyboardSize = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    // 获得弹出keyboard的动画时间，也可以手动赋值，如0.25f
    duration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // 得到keyboard在当前controller的view中的Y轴坐标
    CGFloat keyboardOriginY = self.view.frame.size.height - keyboardSize.height;
    
    // textField下边到view顶点的距离减去keyboard的Y轴坐标就是textField要移动的距离，这里是刚好让textField完全显示出来，也可以再在deltaY的基础上再加上一定距离，如20f、30f等
    deltaY = self.testField.frame.origin.y + self.testField.frame.size.height - keyboardOriginY;
    
    // 当deltaY大于0时说明textField会被键盘遮住，需要上移
    if (deltaY > 0) {
        // 以动画的方式改变textField的frame
        [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.testField.frame = CGRectOffset(self.testField.frame, 0, -deltaY);
        } completion:nil];
    }
}
- (void)keyboardWillHide:(NSNotification *)notification {
    // 键盘收起时将textField的位置还原
    [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
        CGRect frame = self.testField.frame;
        frame.origin.y = originalY;
        self.testField.frame = frame;
    } completion:nil];
}
/**
 * 键盘frame变化时执行的通知方法
 * @note 键盘弹出，收起，改变输入法时这个方法都会执行
 */
- (void)keyboardFrameDidChange:(NSNotification *)notification {
    CGSize keyboardSize = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat keyboardOriginY = self.view.frame.size.height - keyboardSize.height;
    deltaY = self.testField.frame.origin.y + self.testField.frame.size.height - keyboardOriginY;
    
    // 键盘在弹出的情况下如果frame有变化就改变textField的位置
    if (self.keyboardPresentFlag == 1) {
        [UIView animateWithDuration:duration delay:0.f options:UIViewAnimationOptionCurveEaseIn animations:^{
            self.testField.frame = CGRectOffset(self.testField.frame, 0, -deltaY);
        } completion:nil];
    }
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.keyboardPresentFlag ++;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.keyboardPresentFlag --;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
