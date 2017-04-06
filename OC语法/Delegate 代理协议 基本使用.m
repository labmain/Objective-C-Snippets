//-------协议方-------
//-------.h----------
@protocol BaseCellDelegate <NSObject>
/// 头像点击代理方法
- (void)meberImageBtnClick:(NSString *)userID;
/// 图片代理方法(通过传入 cell 对应的 indexpath 来定位 cell)
- (void)pictureClickWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface BaseToCaoTableViewCell : UITableViewCell

@property (nonatomic, weak) id<BaseCellDelegate> delegate;

@end

//-------.m-------

/// 通过代理属性,调用代理方法
- (void)meberImageBtnClick{
    [self.delegate meberImageBtnClick:self.toCaoListVM.model.uid];
}


//-------代理方------
@interface ToCaoViewController ()<BaseCellDelegate>

// 注册代理
xx.delegate = self;

//实现代理方法
#pragma mark - BaseCellDelegate
- (void)meberImageBtnClick:(NSString *)userID{

    
}