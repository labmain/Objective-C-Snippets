dimsBackgroundDuringPresentation -> 是否显示灰色透明的蒙版，默认YES

hidesNavigationBarDuringPresentation -> 是否隐藏导航条，这个一般不需要管，都是隐藏的

searchResultsController -> 就是你初始化传进去的搜索结果VC

searchBar -> 它内部会创建一个搜索框给你。

#pragma mark - 简单使用：
UISearchController *searchController= [[UISearchController alloc] init];  

self.tableView.tableHeaderView = searchController.searchBar;

searchController.searchResultsUpdater =s elf;

searchController.searchBar.delegate = self;

searchController.searchBar.placeholder = @"搜索"; // placeholder

[searchController.searchBar setSearchFieldBackgroundImage:[UIImagehcq_imageNamed:@"business_search_bg"] forState:UIControlStateNormal]; // 设置搜索框内部textField的背景图

[self.searchBar setBackgroundImage:@""] // 设置搜索框背景图，要跟上面的区分哦，两者不一样

[searchController.searchBarsetImage:[UIImagehcq_imageNamed:@"business_search_icon"] forSearchBarIcon:UISearchBarIconSearchstate:UIControlStateNormal];// 设置搜索框内放大镜图片

searchController.searchBar.tintColor=KC_RGB_COLOR(225,225,225);// 设置搜索框内按钮文字颜色，以及搜索光标颜色。

searchController.searchBar.barTintColor=HCQ_VIEW_BACKGROUND_COLOR;// 设置搜索框背景颜色

// Get the instance of the UITextField of the search bar

// 用KVC修改placeholder文字颜色

UITextField*searchField = [self.searchBarvalueForKey:@"_searchField"]; // 先取出textfield

// Change the search bar placeholder text color

[searchFieldsetValue:self.searchBar.tintColorforKeyPath:@"_placeholderLabel.textColor"]; // 然后setValueForKey,搞定

[searchController.searchBarsetValue:@"完成"forKey:@"_cancelButtonText"]; // 设置搜索框那个取消按钮文字

// 如果你不想要搜索框的背景或者希望背景透明，你加上这句代码吧

[[[searchController.searchBar.subviews.firstObject subviews] firstObject] removeFromSuperview];// 直接把背景imageView干掉。在iOS8,9是没问题的，7没测试过。
