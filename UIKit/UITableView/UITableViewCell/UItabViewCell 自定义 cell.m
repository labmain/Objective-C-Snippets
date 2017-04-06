
@interface <#class name#> ()
// 添加控件属性
@end

@implementation <#class name#>
// 给 cell 赋值
- (void)setSysMessageListVM:(SysMessageListViewModel *)sysMessageListVM{
    _sysMessageListVM = sysMessageListVM;
}

#pragma mark - 布局
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}


- (void)setupUI{
    // 添加控件、布局控件
}

#pragma mark - 懒加载

@end
