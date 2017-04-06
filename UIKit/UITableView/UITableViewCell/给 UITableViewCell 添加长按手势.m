- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  //....

    UILongPressGestureRecognizer * longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(cellLongPress:)];
    
    [cell addGestureRecognizer:longPressGesture];
    
    return cell;
}

- (void)cellLongPress:(UIGestureRecognizer *)recognizer{
    // 拿到对应的 cell
     CGPoint location = [recognizer locationInView:self.tableView];
    NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:location];
    EMGroup *group = self.groupList[indexPath.row];
    
    

}