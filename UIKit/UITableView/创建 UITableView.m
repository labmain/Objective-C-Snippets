- (void)viewDidLoad{
    [super viewDidLoad];
    [self prepareTableView];
}
- (void)prepareTableView{
    // 取消分割线
    self.tableView.separatorStyle = UITableViewCellEditingStyleNone;
    // 不能被选中
//    self.tableView.allowsSelection = NO;
    // 背景颜色
    self.tableView.backgroundColor = BHAppBackgroundColor;
    // 注册 cellID
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    //        self.tableView.rowHeight = 200;
    // 预估行高
    self.tableView.estimatedRowHeight = 200;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 根据 cellID 创建对应的 cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"测试UITableViewCell";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    // 选中后立即取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}