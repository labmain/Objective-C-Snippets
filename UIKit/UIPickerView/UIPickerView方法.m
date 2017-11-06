UIPickerView的创建

必须实现委托delegate和数据源dataSource

UIPickerView的高度只能为三种值：

height设置区间在0～179时，UIPickerView的height为162
height设置区间在180～215时，UIPickerView的height为180
height设置区间在216～∞时，UIPickerView的height为216

UIKIT_CLASS_AVAILABLE(2_0) @interface UIPickerView : UIView <NSCoding>

//默认为nil，弱引用
@property(nonatomic,assign) id<UIPickerViewDataSource> dataSource;

//默认为nil，弱引用
@property(nonatomic,assign) id<UIPickerViewDelegate> delegate;

//显示选择指示器，默认为NO
@property(nonatomic) BOOL showsSelectionIndicator;

//组件个数
@property(nonatomic,readonly) NSInteger numberOfComponents;

//指定组件的行数
－(NSInteger)numberOfRowsInComponent:(NSInteger)component;

//指定组件的大小((float)width,(float)height)
- (CGSize)rowSizeForComponent:(NSInteger)component;

//返回视图(必须实现UIPickerViewDelegate中的— (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;);否则返回nil
- (UIView *)viewForRow:(NSInteger)row forComponent:(NSInteger)component;

//重新加载整个视图
－(void)reloadAllComponents;

//重新加载指定视图
－(void)reloadComponent:(NSInteger)component;

//指定的最初行，默认为第一行
- (void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;

//返回选择的行数，如果没有选择则为-1
- (NSInteger)selectedRowInComponent:(NSInteger)component;

@end

@protocol UIPickerViewDataSource<NSObject>
@required
//返回组件的个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;

//返回每个组件的行数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
@end

@protocol UIPickerViewDelegate<NSObject>
@optional
//为指定组件设置列宽
－(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;

//为指定组件的行高
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;

//指定组件的某一行添加数据
－(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;

//为指定组件的某一行添加视图
－(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;

//滚动指定组件的某一行时触发的事件
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end
