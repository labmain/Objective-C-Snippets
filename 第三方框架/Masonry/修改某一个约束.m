@property (nonatomic, strong) MASConstraint *masBottomToolsViewConstraint; 
 
 
[self.bottomToolsView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.equalTo(self.mContentView);
    self.masBottomToolsViewConstraint = make.bottom.equalTo(self.mContentView).offset(134);
}];
    
self.masBottomToolsViewConstraint.offset(100);