// 初始 y 
CGFloat maxY = 16;
// 计算 label 应该显示的宽度
UILabel *mTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, maxY, Main_Screen_Width - 16 - 61, 20)];
mTextLabel.text = [sentences valueForKey:@"originalBody"];
mTextLabel.font = [UIFont systemFontOfSize:17];
mTextLabel.numberOfLines = 3;
mTextLabel.textColor = HexRGB(0x717171);
NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
paragraphStyle.lineSpacing = 6;// 行距

NSMutableAttributedString *attributes = [[NSMutableAttributedString alloc] initWithString:mTextLabel.text ];
// lable 的属性
[attributes addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, mTextLabel.text.length)];
// label 的属性
[attributes addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, mTextLabel.text.length)];

mTextLabel.attributedText = attributes;
// 撑开
[mTextLabel sizeToFit];
[mTextLabel setNeedsLayout];
[mTextLabel layoutIfNeeded];
// 拿到 实际显示的高度
maxY += mTextLabel.frame.size.height;
