关键的代码如下：（label1是左边的label，label2是右边的）
// label1: 位于左上角
[_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(_contentView1.mas_top).with.offset(5);
    make.left.equalTo(_contentView1.mas_left).with.offset(2);

    // 40高度
    make.height.equalTo(@40);
}];

// label2: 位于右上角
[_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
    //左边贴着label1，间隔2
    make.left.equalTo(_label1.mas_right).with.offset(2);

    //上边贴着父view，间隔5
    make.top.equalTo(_contentView1.mas_top).with.offset(5);

    //右边的间隔保持大于等于2，注意是lessThanOrEqual
    //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
    //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
    make.right.lessThanOrEqualTo(_contentView1.mas_right).with.offset(-2);

    //只设置高度40
    make.height.equalTo(@40);
}];

//设置label1的content hugging 为1000
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];

    //设置label1的content compression 为1000
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityRequired
                                             forAxis:UILayoutConstraintAxisHorizontal];

    //设置右边的label2的content hugging 为1000
    [_label2 setContentHuggingPriority:UILayoutPriorityRequired
                               forAxis:UILayoutConstraintAxisHorizontal];

    //设置右边的label2的content compression 为250
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow
                                             forAxis:UILayoutConstraintAxisHorizontal];
