CAShapeLayer *border = [CAShapeLayer layer];

border.strokeColor = kColorDividingLine.CGColor;

// 圆角
border.cornerRadius = 4;//设置圆角大小
border.masksToBounds = YES;

border.fillColor = nil;

border.path = [UIBezierPath bezierPathWithRect:lineView.bounds].CGPath;

border.frame = lineView.bounds;

border.lineWidth = 1;

border.lineCap = @"square";

border.lineDashPattern = @[@4, @4]; // 虚线的 长 和 间隔

[lineView.layer addSublayer:border];
