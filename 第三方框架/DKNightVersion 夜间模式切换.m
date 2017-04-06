// 使用 UIColor 返回
self.mHeaderTitleLable.dk_textColorPicker = DKColorPickerWithColors([UIColor clearColor],[UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]);

//  设置 UIButton 的 Image
[self.mJumpButton dk_setImage:^UIImage *(DKThemeVersion *themeVersion) {
    if ([themeVersion isEqualToString:DKThemeVersionNight]) {
        return [UIImage imageNamed:@"iconJumpProblem_Night_N"];
    }
    return [UIImage imageNamed:@"iconJumpProblem_N"];
} forState:UIControlStateNormal];
// 设置 UIButton 的 titileColor
[intervalTimeBtn dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
    if ([themeVersion isEqualToString:DKThemeVersionNight]) {
        return HexRGB(0x424C55);
    }
    return HexRGB(0xbbbbbb);
} forState:UIControlStateNormal];

 // UIView 背景颜色
 self.view.dk_backgroundColorPicker = DKColorPickerWithKey(LISTEN_BG);

 // 分割线 颜色
 self.bottomLineView.dk_backgroundColorPicker = DKColorPickerWithKey(LISTEN_VIEW_LINE);

 // UIImage
image.dk_imagePicker = DKImagePickerWithNames(@"icon_jj_back", @"icon_jj_back_night");

// 圆角边线
UIView *imageView = [[UIView alloc] initWithFrame:CGRectMake(16, 2, Main_Screen_Width - 32, 0)];
imageView.dk_backgroundColorPicker = DKColorPickerWithColors(HexRGB(0xF9F9F9), HexRGB(0x232A30));
imageView.layer.cornerRadius = 5;
imageView.layer.masksToBounds = YES;
imageView.layer.borderWidth = 1;
imageView.layer.dk_borderColorPicker = DKColorPickerWithColors(HexRGB(0xEAEAEA), HexRGB(0x232A31));
