#pragma mark - 添加圆角
viewT.layer.cornerRadius = 10;//设置那个圆角大小
viewT.layer.masksToBounds = YES;//设置YES是保证添加的图片覆盖视图的效果


#pragma mark - 分别给四个角添加圆角
// UIRectCorner 枚举控制四个角
UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomLeft cornerRadii:CGSizeMake(5, 5)];
CAShapeLayer * layer = [[CAShapeLayer alloc]init];
layer.frame = view.bounds;
layer.path = path.CGPath;
view.layer.mask = layer;


#pragma mark - 添加阴影 (添加阴影需要有一个背景色)

//加上这句可以解决卡顿问题
self.view.layer.shadowPath =[UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
// 很重要的属性，可以用此属性来防止子元素大小溢出父元素，如若防止溢出，请设为 true
self.view.layer.masksToBounds = NO;
//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟view配合使用
self.view.layer.shadowOffset = CGSizeMake(1, 6);
//阴影半径，默认3
self.view.layer.shadowRadius = 5.0;
//阴影透明度，默认0
self.view.layer.shadowOpacity = 0.5;
//shadowColor阴影颜色
self.view.layer.shadowColor = HexRGB(0x000000).CGColor;

// 注意，被添加的 视图 不能是透明的，否则，阴影会显示到子控件上

#pragma mark - 添加圆角并且和阴影

UIView *v=[[UIView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
v.backgroundColor=[UIColor yellowColor];
//v.layer.masksToBounds=YES;这行去掉
v.layer.cornerRadius=10;
v.layer.shadowColor=[UIColor redColor].CGColor;
v.layer.shadowOffset=CGSizeMake(10, 10);
v.layer.shadowOpacity=0.5;
v.layer.shadowRadius=5;
[self.view addSubview:v];


#pragma mark - UIButton 添加圆角和阴影
CALayer *layer = [CALayer layer];
layer.frame = self.goToStudyBtn.frame; // 按钮的frame
layer.backgroundColor = HexRGBAlpha(0x000000, 0.1).CGColor;
layer.shadowOffset = CGSizeMake(0, 4);
layer.shadowOpacity = 1;
layer.cornerRadius = 26;
[self.layer addSublayer:layer]; // 添加到父视图
[self bringSubviewToFront:self.goToStudyBtn]; // 按钮要在layer的上面
self.goToStudyBtn.layer.masksToBounds = YES;
self.goToStudyBtn.layer.cornerRadius = 26;