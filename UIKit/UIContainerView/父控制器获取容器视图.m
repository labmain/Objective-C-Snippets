- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[EHReviewChoiceReWordBottomContainerView class]]) {
        EHReviewChoiceReWordBottomContainerView *containerView = [segue destinationViewController];
        [containerView setDelegate:self];
    }
}
// 这样就可以获取到segue跳转的View Controller的Controller，然后给其设置代理便可以相互调用。
