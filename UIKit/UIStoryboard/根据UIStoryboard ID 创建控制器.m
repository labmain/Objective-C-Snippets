// 填写 storyboard 的名字
UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"MyselfViewController" bundle:[NSBundle mainBundle]];
// 填写 对应控制器的 Identifier
MyselfInfoViewController *mySelfInfoVC = [storyboard instantiateViewControllerWithIdentifier:@"MyselfInfoViewController"];
mySelfInfoVC.hidesBottomBarWhenPushed=YES;
[[self navigationController] pushViewController:mySelfInfoVC animated:YES];