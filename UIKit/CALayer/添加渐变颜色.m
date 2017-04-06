CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];

gradientLayer.colors = @[(__bridge id)self.startColor.CGColor,(__bridge id)self.endColor.CGColor];

gradientLayer.startPoint = CGPointMake(0, 1);

gradientLayer.endPoint = CGPointMake(1, 1);

gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));

[self.layer addSublayer:gradientLayer];


 四种组合方式得到三种结果，

（0，0）到（1，0）和（0，1）到（1，1）都是水平从左向右渐变；

（0，0）到（1，1）是从左上角向右下角渐变；

（0，1）到（1，0）室从左下角向右上角渐变。
