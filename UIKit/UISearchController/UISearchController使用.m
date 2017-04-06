UISearchController的使用步骤：

1、创建

//创建UISearchController
_searchController = [[UISearchController alloc]initWithSearchResultsController:nil];


2、设置代理

//设置代理
_searchController.delegate = self;
_searchController.searchResultsUpdater= self;


3、设置属性

//设置UISearchController的显示属性，以下3个属性默认为YES
//搜索时，背景变暗色
_searchController.dimsBackgroundDuringPresentation = NO;
//搜索时，背景变模糊
_searchController.obscuresBackgroundDuringPresentation = NO;
//隐藏导航栏
_searchController.hidesNavigationBarDuringPresentation = NO;


4、实现代理

- (void)willPresentSearchController:(UISearchController *)searchController;
- (void)didPresentSearchController:(UISearchController *)searchController;
- (void)willDismissSearchController:(UISearchController *)searchController;
- (void)didDismissSearchController:(UISearchController *)searchController;
- (void)presentSearchController:(UISearchController *)searchController;

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController;


注意点：

1、如果你希望在同一个视图中显示搜索结果，则通过[[UISearchController alloc]initWithSearchResultsController:nil]。但是这是不支持TVOS，请提供TVOS一定要指定结果控制器。

[[UISearchController alloc]initWithSearchResultsController:VC]，可以实现指定结果控制器。
