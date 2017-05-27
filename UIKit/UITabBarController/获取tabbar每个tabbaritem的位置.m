当item有两个的时候，每一个item的宽度是屏幕的1/6。
第一个item的起始位置是1/6*Width，第二个item的起始位置是4/6*Width

当item有三个的时候，每一个item的宽度是屏幕的1/9。
第一个item的起始位置是1/9*Width，第二个item的起始位置是4/9*Width，第三个item的起始位置是7/9*Width

当item有四个的时候，每一个item的宽度是屏幕的1/12。
第一个item的起始位置是1/12*Width，第二个item的起始位置是4/12*Width，第三个item的起始位置是7/12*Width，第四个item的起始位置是10/12*Width

当item有五个的时候，每一个item的宽度是屏幕的1/15。
第一个item的起始位置是1/15*Width，第二个item的起始位置是4/15*Width，第三个item的起始位置是7/15*Width，第四个item的起始位置是13/15*Width

当item有六个的时候，每一个item的宽度还是屏幕的1/15。
item最多显示五个，多的就跑到另一个页面去了。可以自己试验一下。

那么我们可以总结出这么一个规律，就是分子是1，4，7，10，13这样一个等差数列，而分母是3，6，9，12，15这样一个等比数列，那么计算每个item的位置就很简单了，像这样：(这是计算当前点选的item的起始位置)

#pragma mark - 结论

(3.0*CGFloat(self.tabbarController.selectedIndex+1)-2.0)*ScreenWidth/CGFloat(self.tabbarController.tabBar.items.count*3)
