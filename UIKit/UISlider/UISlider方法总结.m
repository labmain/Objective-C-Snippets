@interface UISlider : UIControl <NSCoding>
// 这个值是介于滑块的最大值和最小值之间的，如果没有设置边界值，默认为0-1；
@property(nonatomic) float value;
// 设置滑块最小边界值（默认为0）
@property(nonatomic) float minimumValue;
// 设置滑块最大边界值（默认为1）
@property(nonatomic) float maximumValue;
// 设置滑块最左端显示的图片：
@property(nonatomic,retain) UIImage *minimumValueImage；
// 设置滑块最右端显示的图片：
@property(nonatomic,retain) UIImage *maximumValueImage;
// 设置滑块值是否连续变化(默认为YES)
@property(nonatomic,getter=isContinuous) BOOL continuous;
// 这个属性设置为YES则在滑动时，其value就会随时变化，设置为NO，则当滑动结束时，value才会改变。
// 设置滑块左边（小于部分）线条的颜色
@property(nonatomic,retain) UIColor *minimumTrackTintColor；
// 设置滑块右边（大于部分）线条的颜色
@property(nonatomic,retain) UIColor *maximumTrackTintColor；
// 设置滑块颜色（影响已划过一端的颜色）
@property(nonatomic,retain) UIColor *thumbTintColor；
// 注意这个属性：如果你没有设置滑块的图片，那个这个属性将只会改变已划过一段线条的颜色，不会改变滑块的颜色，如果你设置了滑块的图片，又设置了这个属性，那么滑块的图片将不显示，滑块的颜色会改变（IOS7）

// 手动设置滑块的值：
- (void)setValue:(float)value animated:(BOOL)animated;

// 设置滑块的图片：
- (void)setThumbImage:(UIImage *)image forState:(UIControlState)state;

// 设置滑块划过部分的线条图案
- (void)setMinimumTrackImage:(UIImage *)image forState:(UIControlState)state;

// 设置滑块未划过部分的线条图案
- (void)setMaximumTrackImage:(UIImage *)image forState:(UIControlState)state;

// 对应的几个get方法
- (UIImage *)thumbImageForState:(UIControlState)state;
- (UIImage *)minimumTrackImageForState:(UIControlState)state;
- (UIImage *)maximumTrackImageForState:(UIControlState)state;

// 对应的设置当前状态的响应属性的方法
@property(nonatomic,readonly) UIImage* currentThumbImage;
@property(nonatomic,readonly) UIImage* currentMinimumTrackImage;
@property(nonatomic,readonly) UIImage* currentMaximumTrackImage;
@end
