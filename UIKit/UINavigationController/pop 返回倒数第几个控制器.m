//定义一个数组来接收所有导航控制器里的视图控制器
NSArray *controllers = self.navigationController.viewControllers;
//根据索引号直接pop到指定视图
[self.navigationController popToViewController:[controllers objectAtIndex:controllers.count - 3] animated:YES];

// 直接返回到根viewcontroller
[self.navigationController popToRootViewControllerAnimated:YES];  
