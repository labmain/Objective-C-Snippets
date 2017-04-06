/* 全局刷新 */
- (void)reloadData;
/* 刷新索引条 */
- (void)reloadSectionIndexTitles;

/* 返回第section组有多少行 */
- (NSInteger)numberOfRowsInSection:(NSInteger)section;
/* 返回indexPath对应的那一行的cell */
- (nullable __kindof UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

/* 返回第section组的头部view */
- (nullable UITableViewHeaderFooterView *)headerViewForSection:(NSInteger)section;
/* 返回第section组的尾部view */
- (nullable UITableViewHeaderFooterView *)footerViewForSection:(NSInteger)section;

/**
 *  插入数据,刷新数据
 *  @param indexPaths 插入在哪个位置
 *  @param animation  动画效果，枚举UITableViewRowAnimation
 */
- (void)insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/**
 *  删除数据
 *  @param indexPaths 删除数据的位置
 *  @param animation  动画效果，枚举UITableViewRowAnimation
 */
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;
// 枚举UITableViewRowAnimation包括：
// UITableViewRowAnimationFade,  淡入淡出
// UITableViewRowAnimationRight,  向右滑动
// UITableViewRowAnimationLeft,  向左滑动
// UITableViewRowAnimationTop,  向上滑动
// UITableViewRowAnimationBottom,  向下滑动
// UITableViewRowAnimationNone,  无动画效果,iOS 3.0以后可用
// UITableViewRowAnimationMiddle,  保持cell的中间，iOS 3.2以后可用
// UITableViewRowAnimationAutomatic  自动选择一个合适的动画效果

/**
 *  刷新某一行的数据
 *  @param indexPaths 刷新数据的位置
 *  @param animation  动画效果，枚举UITableViewRowAnimation
 */
- (void)reloadRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

/** 动画开启/关闭编辑模式 */
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

/** 返回一个带有复用标识的cell */
- (nullable __kindof UITableViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

/**
 *  使用xib时注册自定义的cell
 *  @param nib        要注册的nib
 *  @param identifier 复用标识
 */
- (void)registerNib:(nullable UINib *)nib forCellReuseIdentifier:(NSString *)identifier;

/**
 *   代码自定义cell时注册自定义的cell
 *  @param cellClass  注册的自定义cell的类型
 *  @param identifier 复用标识
 */
- (void)registerClass:(nullable Class)cellClass forCellReuseIdentifier:(NSString *)identifier;

/** 初始化一个带有复用标识的cell */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
