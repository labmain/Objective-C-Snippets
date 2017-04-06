// 创建文字按钮
UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"创建圈子" style:UIBarButtonItemStyleDone target:self action:@selector(creatGroupList)];

self.navigationItem.rightBarButtonItem = rightButton;

// 创建图片按钮
UIButton *settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
[settingBtn setImage:[UIImage imageNamed:@"me_icon_set"] forState:UIControlStateNormal];
[settingBtn addTarget:self action:@selector(settingBtnClick) forControlEvents:UIControlEventTouchUpInside];

self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];


// 富文本
UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];

[rightBar setTitleTextAttributes:@{NSForegroundColorAttributeName: BHAppCoreColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateNormal];
[rightBar setTitleTextAttributes:@{NSForegroundColorAttributeName: BHAppTextLightColor,NSFontAttributeName:[UIFont systemFontOfSize:15]} forState:UIControlStateDisabled];

self.navigationItem.rightBarButtonItem = rightBar;
