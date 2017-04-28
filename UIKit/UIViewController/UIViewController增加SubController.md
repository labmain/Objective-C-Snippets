## 注意

当我们调用`addChildViewController`方法后，必须调用`didMoveToParentViewController`方法。
`[子视图控制器 didMoveToParentViewController:父视图控制器]`
当调用`removeFromParentViewController`方法前，必须先调用`willMoveToParentViewController`方法，且`parent`参数为`nil`：
`[将要删除的视图控制器 willMoveToParentViewController:nil];`
当从一个视图控制容器中添加或者移除`viewController`后，该方法被调用。
```objc
-(void)willMoveToParentViewController:(UIViewController *)parent
-(void)didMoveToParentViewController:(UIViewController *)parent
```
parent：父视图控制器，添加时parent为父视图控制器，删除时parent为nil

在调用`addChildViewController`之后，必需调用`didMoveToParentViewController:parentViewController:parentVC`(若不调用该方法，`chileVC`中的`didMoveToParent`方法不会自动调用)。`willMoveToParentViewController`默认调用了。


## 添加

```objc
#pragma mark - 添加子控制器
- (void)addContentController:(UIViewController*)newVC
{
    [self addChildViewController:newVC];
    [self.view addSubview:newVC.view];
    [newVC didMoveToParentViewController:self];//必需调用这句 willMove:self由系统调用
}
```

## 删除

```objc
#pragma mark - 删除子控制器
- (void)deleteContentController: (UIViewController*)viewController {
    [viewController willMoveToParentViewController:nil];//删除前必需调用，系统默认调用didMove:nil
    [viewController.view removeFromSuperview];
    [viewController removeFromParentViewController];
}
```

## 切换

```objc
#pragma mark - 切换子控制器(切换)
- (void)changeFromViewController: (UIViewController*)oldVC
                toViewController: (UIViewController*)newVC {

    [self transitionFromViewController: oldVC toViewController: newVC
                              duration: 0.25 options:0
                            animations: Nil
                            completion: Nil];
}
```

## UIStoryBoard创建（xib没有）

在StoryBoard中拖UIContainerView并绑定Controller,其效果与2使用代码添加效果是一样的
