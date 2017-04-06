UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"申请添加好友" message:@"留言板" preferredStyle:UIAlertControllerStyleAlert];
UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    return ;
}];
UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    self.name = alertController.textFields[0].text;
    self.changeNameTextField.text = alertController.textFields[0].text;
}];
[alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
}];
[alertController addAction:cancelAction];
[alertController addAction:okAction];
[self presentViewController:alertController animated:YES completion:nil];