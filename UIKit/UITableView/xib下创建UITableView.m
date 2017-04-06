//注册 cell
UINib *cellNib = [UINib nibWithNibName:@"EHReviewChoiceReWordBottomCell" bundle:[NSBundle mainBundle]];
       [self.tableView registerNib:cellNib forCellReuseIdentifier:@"EHReviewChoiceReWordBottomCell"];

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    searchResultCell * pastRecordsCell = [searchResultCell cellWithTableView:tableView];
    return pastRecordsCell;
}



// cell 方法
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // 1. 可重用标示符
    static NSString *ID = @"searchResultCell";
    // 2. tableView查询可重用Cell
    searchResultCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    // 3. 如果没有可重用cell
    if (cell == nil) {
        // 从XIB加载自定义视图
        cell = [[[NSBundle mainBundle] loadNibNamed:@"searchResultCell" owner:nil options:nil] lastObject];
    }

    return cell;
}
