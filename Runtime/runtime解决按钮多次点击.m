@interface UIControl (YN)

@property (nonatomic, assign) NSTimeInterval hyn_acceptEventInterval;//添加点击事件的间隔事件

@property (nonatomic, assign) BOOL hyn_ignoreEvent;//

@end



#import@implementation UIControl (YN)

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

static const char *UIcontrol_ignoreEvent = "UIcontrol_ignoreEvent";

- (NSTimeInterval)hyn_acceptEventInterval {

return [objc_getAssociatedObject(self, UIControl_acceptEventInterval) doubleValue];

}

- (void)setHyn_acceptEventInterval:(NSTimeInterval)hyn_acceptEventInterval {

objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(hyn_acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (BOOL)hyn_ignoreEvent {

return [objc_getAssociatedObject(self, UIcontrol_ignoreEvent) boolValue];

}

- (void)setHyn_ignoreEvent:(BOOL)hyn_ignoreEvent {

objc_setAssociatedObject(self, UIcontrol_ignoreEvent, @(hyn_ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

+ (void)load {

Method a = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));

Method b = class_getInstanceMethod(self, @selector(__hyn_sendAction:to:forEvent:));

method_exchangeImplementations(a, b);

}

- (void)__hyn_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {

if (self.hyn_ignoreEvent) return;

if (self.hyn_acceptEventInterval > 0) {

self.hyn_ignoreEvent = YES;

[self performSelector:@selector(setHyn_ignoreEvent:) withObject:@(NO) afterDelay:self.hyn_acceptEventInterval];

}

[self __hyn_sendAction:action to:target forEvent:event];

}

@end



使用：
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;//用Runtime做控制的button

@property (weak, nonatomic) IBOutlet UIView *colorView;//红色的view

@end

@implementation ViewController

- (void)viewDidLoad {

[super viewDidLoad];

//设置一个延迟时间，为了方便观察我这里把动画设置成三秒

self.button.hyn_acceptEventInterval = 3;

}

//Runtime控制的button点击事件

- (IBAction)runtimeAction:(UIButton *)sender {

[UIView animateWithDuration:3 animations:^{

self.colorView.center = CGPointMake(200, 500);

} completion:^(BOOL finished) {

self.colorView.center = CGPointMake(25, 89);

}];

}

//普通的buttonAction

- (IBAction)buttonAction:(UIButton *)sender {

[UIView animateWithDuration:3 animations:^{

self.colorView.center = CGPointMake(200, 500);

} completion:^(BOOL finished) {

self.colorView.center = CGPointMake(25, 89);

}];

}

@end
