动画 constrainedSize 更改有些时候，你只想对节点的 bounds 变化作出响应，重新计算其布局。这种情况，可以在节点上调用 transitionLayoutWithSizeRange:animated:。
该方法类似于 transitionLayoutWithAnimation:，但是如果传递的 ASSizeRange 等于当前的 constrainedSizeForCalculatedLayout，则不会触发动画。 这在响应旋转事件和控制器 size 发生变化时非常有用。

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
  [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
  [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
    [self.node transitionLayoutWithSizeRange:ASSizeRangeMake(size, size) animated:YES];
  } completion:nil];
}