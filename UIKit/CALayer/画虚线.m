通过UIImage的绘图方法来绘制
// 画虚线
// 创建一个imageView 高度是你想要的虚线的高度 一般设为2
 _lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, kScreenWidth, 2)]; 
// 调用方法 返回的iamge就是虚线 
_lineImg.image = [self drawLineByImageView:_lineImg]; 
// 添加到控制器的view上 
[self.view addSubview:_lineImg];


// 返回虚线image的方法
- (UIImage *)drawLineByImageView:(UIImageView *)imageView{ 
      UIGraphicsBeginImageContext(imageView.frame.size); //开始画线 划线的frame 
      [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)]; 
      //设置线条终点形状 
      CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound); 
      // 5是每个虚线的长度 1是高度 
      float lengths[] = {5,1}; 
      CGContextRef line = UIGraphicsGetCurrentContext(); 
      // 设置颜色 
      CGContextSetStrokeColorWithColor(line, [UIColor colorWithWhite:0.408 alpha:1.000].CGColor); 
      CGContextSetLineDash(line, 0, lengths, 2); //画虚线
      CGContextMoveToPoint(line, 0.0, 2.0); //开始画线
      CGContextAddLineToPoint(line, kScreenWidth - 10, 2.0);       

      CGContextStrokePath(line); 
      // UIGraphicsGetImageFromCurrentImageContext()返回的就是image 
      return UIGraphicsGetImageFromCurrentImageContext();
  }



通过CAShapeLayer方式绘制虚线
/**
 ** lineView:       需要绘制成虚线的view
 ** lineLength:     虚线的宽度
 ** lineSpacing:    虚线的间距
 ** lineColor:      虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}
