@property (nonatomic, strong) MASConstraint *masBottomToolsViewConstraint;


[self.bottomToolsView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.equalTo(self.mContentView);
    self.masBottomToolsViewConstraint = make.bottom.equalTo(self.mContentView).offset(134);
}];

self.masBottomToolsViewConstraint.offset(100);


// Masonry 不能对 multiplier priority直接修改。
[self.viewHeightConstraint uninstall];

[view mas_makeConstraints:^(MASConstraintMaker *make) {
    if (button.isSelected) {
        self.viewHeightConstraint = make.height.mas_offset(0).priorityHigh();
        view.hidden = YES;
    } else {
        self.viewHeightConstraint = make.height.mas_offset(0).priorityLow();
        view.hidden = NO;
    }
}];

// 或者转为 把Masonry的约束转为NSLayout的约束 直接修改
