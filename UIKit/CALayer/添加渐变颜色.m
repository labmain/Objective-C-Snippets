CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
gradientLayer.colors = @[(__bridge id)self.startColor.CGColor,(__bridge id)self.endColor.CGColor];
gradientLayer.startPoint = CGPointMake(0, 1);
gradientLayer.endPoint = CGPointMake(1, 1);
gradientLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
[self.layer addSublayer:gradientLayer];
 //设置颜色分割点
//  设置三种颜色变化点，取值范围 0.0~1.0
self.gradientLayer.locations = @[@(0.25),@(0.5),@(0.75)];

 四种组合方式得到三种结果，

（0，0）到（1，0）和（0，1）到（1，1）都是水平从左向右渐变；

（0，0）到（1，1）是从左上角向右下角渐变；

（0，1）到（1，0）室从左下角向右上角渐变。

(0, 0)到(0, 1)等价(0.5, 0) (0.5, 1)等价(1， 0)和（1, 1）  中间，垂直下

(0, 0.5) (1, 0.5) 中间，水平向右

设置颜色渐变方向 (0,0)->(1,1)则45度方向 (0,0)->(1,0)上->下
在了解CAGradientLayer之前,我们先要了解一下CALayer的坐标,如下图,一个Layer的左上角为(0,0),其右下角坐标为(1,1),中心点是(0.5,0.5),任何图层都是如此,和父图层以及自身的形状无关.

参考
https://www.jianshu.com/p/1c8ef3116b42