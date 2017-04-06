//获取最顶层的视图控制器
//不论中间采用了 push->push->present还是present->push->present,或是其它交互
- (UIViewController *)theTopviewControler{
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;

    UIViewController *parent = rootVC;

    while ((parent = rootVC.presentedViewController) != nil ) {
        rootVC = parent;
    }

    while ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC topViewController];
    }

    return rootVC;
}

#import <objc/runtime.h>
//当前视图
-(UIViewController *)currentViewController{
    UIViewController *vc;
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[objc_getClass("UIViewController") class]] ) {
            vc=(UIViewController*)nextResponder;

            return vc;
        }
    }
    return vc;
}

//获取UIView所在的视图控制器（UIViewController）
 (1)UIView-Extent.h
#import <UIKit/UIKit.h>

@interface UIView (Extend)
- (UIViewController *)viewController;
@end

(2) UIView-Extent.m

#import "UIView+Extend.h"
@implementation UIView (Extend)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
