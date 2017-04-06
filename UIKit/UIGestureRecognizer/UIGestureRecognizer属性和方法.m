@protocol  UIGestureRecognizerDelegate;
@classUIView, UIEvent, UITouch, UIPress;
//枚举手势的7中状态
typedefNS_ENUM(NSInteger, UIGestureRecognizerState) {
    UIGestureRecognizerStatePossible,     // 尚未识别是何种手势操作（但可能已经触发了触摸事件），默认状态
    UIGestureRecognizerStateBegan,        // 手势已经开始，此时已经被识别，但是这个过程中可能发生变化，手势操作尚未完成
    UIGestureRecognizerStateChanged,      // 手势状态发生转变
    UIGestureRecognizerStateEnded,        // 手势识别操作完成（此时已经松开手指）
    UIGestureRecognizerStateCancelled,    // 手势被取消，恢复到默认状态
    UIGestureRecognizerStateFailed,       // 手势识别失败，恢复到默认状态
    UIGestureRecognizerStateRecognized = UIGestureRecognizerStateEnded  // 手势识别完成同UIGestureRecognizerStateEnded
​};
NS_CLASS_AVAILABLE_IOS(3_2) @interface UIGestureRecognizer : NSObject

//创建的时候就添加触摸事件
- (instancetype)initWithTarget:(nullableid)target action:(nullableSEL)actionNS_DESIGNATED_INITIALIZER; // designated initializer

​//添加触摸执行事件
- (void)addTarget:(id)target action:(SEL)action;

//移除触摸执行事件
- (void)removeTarget:(nullableid)target action:(nullableSEL)action;

//设置手势的状态​
@property(nonatomic,readonly) UIGestureRecognizerState state;

@property(nullable,nonatomic,weak) id <UIGestureRecognizerDelegate> delegate;

//手势是否可用​
@property(nonatomic, getter=isEnabled) BOOL enabled;

//触发手势的视图（一般在触摸执行操作中我们可以通过此属性获得触摸视图进行操作）​
@property(nullable, nonatomic,readonly) UIView *view;

@property(nonatomic) BOOL cancelsTouchesInView;

//手势识别失败前不执行触摸开始事件，默认为NO；如果为YES，那么成功识别则不执行触摸开始事件，失败则执行触摸开始事件；如果为NO，则不管成功与否都执行触摸开始事件；
@property(nonatomic) BOOL delaysTouchesBegan;

@property(nonatomic) BOOL delaysTouchesEnded;

@property(nonatomic, copy) NSArray<NSNumber *> *allowedTouchTypes NS_AVAILABLE_IOS(9_0); // Array of UITouchType's as NSNumbers.

@property(nonatomic, copy) NSArray<NSNumber *> *allowedPressTypes NS_AVAILABLE_IOS(9_0); // Array of UIPressTypes as NSNumbers.

- (void)requireGestureRecognizerToFail:(UIGestureRecognizer*)otherGestureRecognizer;

//在指定视图中的相对位置
- (CGPoint)locationInView:(nullableUIView*)view;

//触摸点的个数（就是同时触摸的手指个数）
- (NSUInteger)numberOfTouches;

//触摸点相对于指定视图的位置
- (CGPoint)locationOfTouch:(NSUInteger)touchIndex inView:(nullableUIView*)view; // the location of a particular touch
@end

@protocol UIGestureRecognizerDelegate <NSObject>

@optional

// 询问一个手势接收者是否应该开始解释执行一个触摸接收事件
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer;

// 询问delegate，两个手势是否同时接收消息，返回YES同事接收。返回NO，不同是接收（如果另外一个手势返回YES，则并不能保证不同时接收消息）the default implementation returns NO。
// 这个函数一般在一个手势接收者要阻止另外一个手势接收自己的消息的时候调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizerNS_AVAILABLE_IOS(7_0);

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0);

// 询问delegate是否允许手势接收者接收一个touch对象
// 返回YES，则允许对这个touch对象审核，NO，则不允许。
// 这个方法在touchesBegan:withEvent:之前调用，为一个新的touch对象进行调用
- (BOOL)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer shouldReceiveTouch:(UITouch*)touch;

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press;

@end
