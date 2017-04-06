/* tableView的样式 */
@property (nonatomic, readonly) UITableViewStyle style;
// tableView有两种样式
//     UITableViewStylePlain  普通的表格样式
//    UITableViewStyleGrouped  分组模式

/* tableView的数据源 */
@property (nonatomic, weak, nullable) id <UITableViewDataSource> dataSource;
/* tableView的代理 */
@property (nonatomic, weak, nullable) id <UITableViewDelegate> delegate;

#pragma mark - 高度相关
/* tableView每一行的高度，默认为44 */
@property (nonatomic) CGFloat rowHeight;
/* tableView统一的每一组头部的高度 */
@property (nonatomic) CGFloat sectionHeaderHeight;
/* tableView统一的每一组头部的高度 */
@property (nonatomic) CGFloat sectionFooterHeight;
/* 估算的tableView的统一的每一行行高 */
@property (nonatomic) CGFloat estimatedRowHeight;
/* 估算的统一的每一组头部高度，设置估算高度可以优化性能 */
@property (nonatomic) CGFloat estimatedSectionHeaderHeight;
/* 估算的统一的每一组的尾部高度 */
@property (nonatomic) CGFloat estimatedSectionFooterHeight;

/* 总共有多少组 */
@property (nonatomic, readonly) NSInteger numberOfSections;
/* 选中行的indexPath */
@property (nonatomic, readonly, nullable) NSIndexPath *indexPathForSelectedRow;

#pragma mark - 索引条
/* 索引条文字的颜色 */
@property (nonatomic, strong, nullable) UIColor *sectionIndexColor;
/* 索引条的背景色 */
@property (nonatomic, strong, nullable) UIColor *sectionIndexBackgroundColor;

#pragma mark - 分隔线
/* 分隔线的样式 */
@property (nonatomic) UITableViewCellSeparatorStyle separatorStyle;
// 分隔线的样式有：
// UITableViewCellSeparatorStyleNone,  没有分隔线
// UITableViewCellSeparatorStyleSingleLine, 正常分隔线
@property (nonatomic, strong, nullable) UIColor *separatorColor; // 分隔线的颜色

#pragma mark - 头尾部控件
/* tableView的头部控件，只能设置高度，宽度默认填充表格 */
@property (nonatomic, strong, nullable) UIView *tableHeaderView;
/* tableView的尾部控件，只能设置高度，宽度默认填充表格*/
@property (nonatomic, strong, nullable) UIView *tableFooterView;

#pragma mark - 编辑模式
/* 是否是编辑模式，默认是NO */
@property (nonatomic, getter=isEditing) BOOL editing;
/* tableView处在编辑模式的时候是否允许选中行，默认是NO */
@property (nonatomic) BOOL allowsSelectionDuringEditing;
/* tableView处在编辑模式的时候是否允许选中多行数据，默认是NO */
@property (nonatomic) BOOL allowsMultipleSelectionDuringEditing;
