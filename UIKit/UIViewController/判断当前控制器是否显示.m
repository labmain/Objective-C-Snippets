/*
假如一个UIView对象当前正在显示，那么它的window属性肯定为非空值。虽然官方文档未说明UIView未显示时window属性的取值，但是经过简单的测试，大部分情况下UIView未显示时，window的值为空，因此依据此判断当前UIViewController是否正在显示。但是访问UIViewController的view属性时，可能会引起view加载(假如此时还未加载)，这是不必要的，而且还可能引起无法预期的问题。因此在访问view属性之前，最好先检查isViewLoaded属性来避免上述问题。
*/
-(BOOL)isCurrentViewControllerVisible:(UIViewController *)viewController
{
    return (viewController.isViewLoaded && viewController.view.window);
}

//注意：UIView的官方文档中仅注明当view还未添加到window时，window属性为空；但是并未提及当window为nil时，当前view未显示。通过简单的Demo检测上文的方法可满足大部分需求，因此使用时建议进行简单测试！
