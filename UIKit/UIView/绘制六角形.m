- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [self drawSexangleWithImageViewWidth:self.frame.size.width withLineWidth:8 withStrokeColor:HexRGB(0x5f1da3)];
    
}

- (void)drawSexangleWithImageViewWidth:(CGFloat)width withLineWidth:(CGFloat)lineWidth withStrokeColor:(UIColor *)color {
    
    //在绘制layer之前先把之前添加的layer移除掉，如果不这么做，你就会发现设置多次 image 之后，本view的layer上就会有多个子layer，
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperlayer];
    }];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [self getCGPath:width];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = lineWidth;
    
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = [self getCGPath:width];
    self.layer.mask = shapLayer;
    /** 将shapeLayer添加到shapLayer上方*/
    [self.layer insertSublayer:shapeLayer above:shapLayer];
    
}

/** 计算菱形的UIBezierPath*/
- (CGPathRef)getCGPath:(CGFloat)width {
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (width / 2), (width / 4))];
    [path addLineToPoint:CGPointMake((width / 2), 0)];
    [path addLineToPoint:CGPointMake(width - ((sin(M_1_PI / 180 * 60)) * (width / 2)), (width / 4))];
    [path addLineToPoint:CGPointMake(width - ((sin(M_1_PI / 180 * 60)) * (width / 2)), (width / 2) + (width / 4))];
    [path addLineToPoint:CGPointMake((width / 2), width)];
    [path addLineToPoint:CGPointMake((sin(M_1_PI / 180 * 60)) * (width / 2), (width / 2) + (width / 4))];
    [path closePath];
    return path.CGPath;
    
}
