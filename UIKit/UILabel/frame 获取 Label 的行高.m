// 获取label高度
- (CGSize)returenLabelSizeWithText:(NSString *)text withFontSize:(CGFloat)fontSize
{
    CGFloat widthSpace = 35; // 左右间距和

    UILabel *mTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width - widthSpace, fontSize)];
    mTextLabel.text = text;
    mTextLabel.font = [UIFont systemFontOfSize:fontSize];
    mTextLabel.numberOfLines = 0;

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6;

    NSMutableAttributedString *attributes = [[NSMutableAttributedString alloc] initWithString:mTextLabel.text ];

    [attributes addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange(0, mTextLabel.text.length)];

    [attributes addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mTextLabel.text.length)];

    mTextLabel.attributedText = attributes;

    [mTextLabel sizeToFit];
    [mTextLabel setNeedsLayout];
    [mTextLabel layoutIfNeeded];

    return mTextLabel.frame.size;
}
