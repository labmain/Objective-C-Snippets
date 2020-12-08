1、页面将要出现时，判断页面是以push方式跳过来，还是以pop方式跳过来的

- (void)viewWillAppear:(BOOL)animated {
    [superview WillAppear:animated];
    if([self isBeingPresented] || [self isMovingToParentViewController]) {
        // push / present
    }else{
        // pop /dismiss to here
    }
}
2、页面将要消失时，判断此时的页面是pop到新页面还是push到新页面

- (void)viewWillDisappear:(BOOL)animated {
    [superview WillDisappear:animated];
    if([self isBeingDismissed] || [self isMovingFromParentViewController]) {
        // pop / dismiss
    }elseif() {
        // push /present from here
    }
}