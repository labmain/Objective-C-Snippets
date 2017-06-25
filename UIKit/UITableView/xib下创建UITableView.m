//注册 cell
UINib *cellNib = [UINib nibWithNibName:@"EHReviewChoiceReWordBottomCell" bundle:[NSBundle mainBundle]];
       [self.tableView registerNib:cellNib forCellReuseIdentifier:@"EHReviewChoiceReWordBottomCell"];
// 在Storyboard会自动注册Cell
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

    return cell;
}
