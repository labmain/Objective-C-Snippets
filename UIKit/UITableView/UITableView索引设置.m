主要是实现下面四个方法：

//返回section中的row

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

//返回每个索引的内容

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section

//返回索引数组

-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView

//响应点击索引时的委托方法

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index；



当然在UITableView中还有关于索引的相关属性设置如下：

 _myTableView.sectionIndexColor = [UIColorblueColor];／／设置默认时索引值颜色

 _myTableView.sectionIndexTrackingBackgroundColor = [UIColorgrayColor];／／设置选中时，索引背景颜色

 _myTableView.sectionIndexBackgroundColor = [UIColorclearColor];／／ 设置默认时，索引的背景颜色
