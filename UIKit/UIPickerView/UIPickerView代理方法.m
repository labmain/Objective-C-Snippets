delegate

//  第component列的宽度是多少
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component;
//  第component列的行高是多少
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component;
//  第component列第row行显示什么文字
 (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
//  第component列第row行显示怎样的view(内容)
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
//  选中了pickerView的第component列第row行
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;


datasource
//  一共有多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
//  第component列一共有多少行
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
