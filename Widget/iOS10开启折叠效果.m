// 在viewDidLoad中添加这段代码可以使用折叠效果
typedef NS_ENUM(NSInteger, NCWidgetDisplayMode) {
    NCWidgetDisplayModeCompact, // Fixed height
    NCWidgetDisplayModeExpanded, // Variable height
} NS_ENUM_AVAILABLE_IOS(10_0);

#pragma mark - iOS 10 新增的方法
// 在- (void)viewWillAppear:(BOOL)animated; 方法中设置一下就好：
if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0) {
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

// 然后实现代理方法
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize

{
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = maxSize;
    } else if (activeDisplayMode == NCWidgetDisplayModeExpanded) {
        CGFloat height = 200;//你要设置的展开时候的高度；
        self.preferredContentSize = CGSizeMake(0, height);
    }
}
