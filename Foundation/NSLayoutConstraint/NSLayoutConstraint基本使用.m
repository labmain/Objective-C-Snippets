[NSLayoutConstraint constraintWithItem:(id)item
                             attribute:(NSLayoutAttribute)attribute
                             relatedBy:(NSLayoutRelation)relation
                                toItem:(id)otherItem
                             attribute:(NSLayoutAttribute)otherAttribute
                            multiplier:(CGFloat)multiplier
                              constant:(CGFloat)constant];


参数说明:
    第一个参数:指定约束左边的视图view1
    第二个参数:指定view1的属性attr1，具体属性见文末。
    第三个参数:指定左右两边的视图的关系relation，具体关系见文末。
    第四个参数:指定约束右边的视图view2
    第五个参数:指定view2的属性attr2，具体属性见文末。
    第六个参数:指定一个与view2属性相乘的乘数multiplier
    第七个参数:指定一个与view2属性相加的浮点数constant

这个函数的对照公式为:
    view1.attr1 <relation> view2.attr2 * multiplier + constant

typedef NS_ENUM(NSInteger, NSLayoutRelation) {
    NSLayoutRelationLessThanOrEqual = -1,          //小于等于
    NSLayoutRelationEqual = 0,                     //等于
    NSLayoutRelationGreaterThanOrEqual = 1,        //大于等于
};
typedef NS_ENUM(NSInteger, NSLayoutAttribute) {
    NSLayoutAttributeLeft = 1,                     //左侧
    NSLayoutAttributeRight,                        //右侧
    NSLayoutAttributeTop,                          //上方
    NSLayoutAttributeBottom,                       //下方
    NSLayoutAttributeLeading,                      //首部
    NSLayoutAttributeTrailing,                     //尾部
    NSLayoutAttributeWidth,                        //宽度
    NSLayoutAttributeHeight,                       //高度
    NSLayoutAttributeCenterX,                      //X轴中心
    NSLayoutAttributeCenterY,                      //Y轴中心
    NSLayoutAttributeBaseline,                     //文本底标线

    NSLayoutAttributeNotAnAttribute = 0            //没有属性
};

NSLayoutAttributeLeft/NSLayoutAttributeRight 和NSLayoutAttributeLeading/NSLayoutAttributeTrailing的区别是left/right永远是指左右，而leading/trailing在某些从右至左习惯的地区会变成，leading是右边，trailing是左边。
