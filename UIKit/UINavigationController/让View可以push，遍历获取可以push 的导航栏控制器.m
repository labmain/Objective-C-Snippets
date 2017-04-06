- (void)pushADWebVC
{
    EHMessageWebVC *webVC = [EHMessageWebVC getVC:self.ADUrl];
    [[self getNavVC] pushViewController:webVC animated:YES];
}

- (UINavigationController *)getNavVC
{
    UIResponder *next = self.nextResponder;
    do {
        if ([next isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)next;
        } else {
            next = next.nextResponder;
        }
    } while (next != nil);
    return nil;
}
