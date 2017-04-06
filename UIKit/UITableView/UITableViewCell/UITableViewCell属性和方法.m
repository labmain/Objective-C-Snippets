// 初始化方法
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
// Cell的初始化方法，可以设置一个风格和标识符，风格的枚举如下：
typedef NS_ENUM(NSInteger, UITableViewCellStyle) {
    UITableViewCellStyleDefault,    // 默认风格，自带标题和一个图片视图，图片在左
    UITableViewCellStyleValue1,     // 只有标题和副标题 副标题在右边
    UITableViewCellStyleValue2,     // 只有标题和副标题，副标题在左边标题的下边
    UITableViewCellStyleSubtitle    // 自带图片视图和主副标题，主副标题都在左边，副标题在下
};
// cell上默认图片显示view，（默认为nil,当需要的时候才会被创建）
UIImageView *imageView;
// cell上默认的UILabel(默认为nil，当需要的时候才会被创建)
UILabel *textLabel;
// cell简介（默认为nil，如果当前的style支持的话需要时将会被创建）
UILabel *detailTextLabel;
// 与cell自带的删除按钮平级的view
UIView *contentView;
// 背景view
UIView *backgroundView;
// 多选时的背景view
UIView *multipleSelectionBackgroundView;
// cell的标识符
NSString *reuseIdentifier;
// 当被重用的cell将要显示时，会调用这个方法，这个方法最大的用武之地是当你自定义的cell上面有图片时，如果产生了重用，图片可能会错乱（当图片来自异步下载时及其明显），这时我们可以重写这个方法把内容抹掉。
- (void)prepareForReuse;
// 选中时的cell样式（默认为UITableViewCellSelectionStyleBlue）
UITableViewCellSelectionStyle   selectionStyle;
// cell被选中时的风格，枚举如下：
typedef NS_ENUM(NSInteger, UITableViewCellSelectionStyle) {
    UITableViewCellSelectionStyleNone,//无
    UITableViewCellSelectionStyleBlue,//蓝色
    UITableViewCellSelectionStyleGray,//灰色
    UITableViewCellSelectionStyleDefault//默认 为蓝色
};

// 是否选中
BOOL selected;
// 是否高亮
BOOL highlighted;

// 设置cell为选中状态
- (void)setSelected:(BOOL)selected animated:(BOOL)animated;
// 设置为高亮状态
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;
// 与上面的两个属性对应

// 设置cell的编辑样式
UITableViewCellEditingStyle editingStyle;
// 获取cell的编辑状态，枚举如下
typedef NS_ENUM(NSInteger, UITableViewCellEditingStyle) {
    UITableViewCellEditingStyleNone,//无编辑
    UITableViewCellEditingStyleDelete,//删除编辑
    UITableViewCellEditingStyleInsert//插入编辑
};
// showsReorderControl = YES时Cell显示移动按钮（默认为NO）
BOOL showsReorderControl;        // default is NO
// 注意：要让cell实现拖动排序的功能，除了上面设置为YES，还需实现代理中的如下方法：
//
// -(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
//     return YES;
// }
//
// -(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath*)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
// }

// 没有出现delete控件和行头控件，可cell的宽度还是变了，有没有办法使cell在edit模式下，宽度不改变
BOOL shouldIndentWhileEditing;
// 设置cell的样式
UITableViewCellAccessoryType accessoryType;
// 设置附件视图的风格(cell最右侧显示的视图) 枚举如下：
typedef NS_ENUM(NSInteger, UITableViewCellAccessoryType) {
    UITableViewCellAccessoryNone,                   // 没有视图
    UITableViewCellAccessoryDisclosureIndicator,    // cell右侧显示一个灰色箭头 距离右边有十几像素；
    UITableViewCellAccessoryDetailDisclosureButton, // 显示详情符号和灰色箭头
    UITableViewCellAccessoryCheckmark,              // cell右侧显示蓝色对号
    UITableViewCellAccessoryDetailButton  // cell右侧显示一个详情符号
};
// 除此上面之外，如果你想使用自定义附件按钮的其他样式，必需使用UITableView的accessoryView属性
UIView *accessoryView;
// 设置当cell进入编辑模式时的辅助按钮样式
UITableViewCellAccessoryType editingAccessoryType;
// 自定义cell进入编辑模式后辅助按钮
UIView *editingAccessoryView;
// 获取cell的缩进级别
NSInteger indentationLevel;
// 获取cell的缩进宽度
CGFloat indentationWidth;
// 设置是否处于编辑模式
BOOL editing;
// 设置编辑模式
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;
// 当前是否显示delete按钮
BOOL showingDeleteConfirmation;  // currently showing "Delete" button
// 这两个方法应该在子类中覆写，当前Cell的状态发生改变的时刻就会触发这些方法，可以在这些方法中进行一些额外的操作。（例如：cell被点击以后就会进入UITableViewCellStateShowingDeleteConfirmationMask 状态）
- (void)willTransitionToState:(UITableViewCellStateMask)state;
- (void)didTransitionToState:(UITableViewCellStateMask)state;
// cell状态已经转换时调用的函数，可以在子类中重写，状态枚举如下：
typedef NS_OPTIONS(NSUInteger, UITableViewCellStateMask) {
    UITableViewCellStateDefaultMask                     = 0,//默认状态
    UITableViewCellStateShowingEditControlMask          = 1 << 0,//编辑状态
    UITableViewCellStateShowingDeleteConfirmationMask   = 1 << 1//确认删除状态
};
