<UIGestureRecognizerDelegate>
// 遍历Nav的View手势，给ScrollView 添加手势
NSArray *gestureArray = self.navigationController.view.gestureRecognizers;
for (UIGestureRecognizer *gesture in gestureArray) {
    if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        [self.scrollView.panGestureRecognizer requireGestureRecognizerToFail:gesture];
    }
}
// 手势传递到下面的View
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}