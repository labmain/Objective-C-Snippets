@property (nonatomic, strong) UIView *dividingLineView;

[self.contentView addSubview:self.dividingLineView];


[self.dividingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_offset(@1);
        make.left.right.bottom.equalTo(self.contentView);
}];
    
- (UIView *)dividingLineView{
    if (_dividingLineView == nil){
        _dividingLineView  = [[UIView alloc] init];
        _dividingLineView.backgroundColor = [UIColor colorWithRed:213/255.0f green:213/255.0f blue:213/255.0f alpha:1.0];
    }
    return _dividingLineView;
}

// 分割线
UIView *dividingLineView = [[UIView alloc] init];
[self.<#父视图#> addSubview:dividingLineView];
dividingLineView.backgroundColor = BHAppDividingLineView_Color;
[dividingLineView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.mas_offset(BHAppDividingLineView_Hight);
    make.left.right.bottom.equalTo(self.<#父视图#>);
}];

// frame
UIView *dividingLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 44 - 1, Main_Screen_Width, 1)];
dividingLineView.dk_backgroundColorPicker = DKColorPickerWithKey(LISTEN_VIEW_LINE);
[self addSubview:dividingLineView];
