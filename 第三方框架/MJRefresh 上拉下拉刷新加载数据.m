@interface PatientDetailViewController ()
@property (nonatomic, strong) NSMutableArray<PatientDetailViewModel *> *patientDetailVM;
@property (nonatomic, assign) NSInteger page;
@end

@implementation PatientDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self prepareTableView];
    [self prepareMJRefreshHeader];

}
- (void)loadNewData {
    // 从第一页开始
    self.page = 1;
    // 网络请求
    [PatientDetailViewModel patient_pingjiaWithPage:self.page finished:^(WSResponseResult<NSArray<PatientDetailViewModel *> *> *result) {
        if (result.error) {
            WSShowHudError(@"%@",result.showMessage);
             [self.tableView.mj_header endRefreshing];
            return ;
        }
        self.page ++;
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_header endRefreshing];
        // 清空原来数据
        [self.patientDetailVM removeAllObjects];
        // 重新加载数据
        [self.patientDetailVM addObjectsFromArray:result.result];
        [self.tableView reloadData];
        // 如果数据，等于10 或者大于，才添加 上拉刷新
        if (self.patientDetailVM.count >= 10) {
            [self prepareMJRefreshFooter];
        }
    }];
}
- (void)loadOnceData {
    [PatientDetailViewModel patient_pingjiaWithPage:self.page finished:^(WSResponseResult<NSArray<PatientDetailViewModel *> *> *result) {
        if (result.error) {
            WSShowHudError(@"%@",result.showMessage);
            [self.tableView.mj_footer endRefreshing];
            return ;
        }
        self.page ++;
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.tableView.mj_footer endRefreshing];
        // 拼接数组
        [self.patientDetailVM addObjectsFromArray:result.result];
        [self.tableView reloadData];
    }];
}
/// 准备刷新
- (void)prepareMJRefreshHeader{
    // 下拉刷新
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header =  [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];

    header.automaticallyChangeAlpha = YES;
    header.lastUpdatedTimeLabel.hidden = YES;

    // 设置header
    self.tableView.mj_header = header;
    // 马上进入刷新状态
    [header beginRefreshing];
    [self loadNewData];
    // 上拉刷新
}
- (void)prepareMJRefreshFooter {
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadOnceData)];
    // 当上拉刷新控件出现50%时（出现一半），就会自动刷新。这个值默认是1.0（也就是上拉刷新100%出现时，才会自动刷新）
    //    footer.triggerAutomaticallyRefreshPercent = 0.3;

    footer.refreshingTitleHidden = YES;
    // 设置footer
    self.tableView.mj_footer = footer;
}
