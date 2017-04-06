UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
[self.showMoreBtn addGestureRecognizer:pan];


- (void)pan:(UIPanGestureRecognizer *)pan {
CGPoint point = [pan translationInView:self.showMoreBtn];

}