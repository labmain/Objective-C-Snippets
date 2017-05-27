// x的值的范围 (0, 1]
- (CGFloat)getSpringInterpolation:(CGFloat)x
{
    CGFloat tension = 0.3; // 张力系数
    return pow(2, -10 * x) * sin((x - tension / 4) * (2 * M_PI) / tension);
}
