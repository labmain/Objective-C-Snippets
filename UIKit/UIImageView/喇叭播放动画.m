// 添加播放时候的动画图片
[_audioBtn addSubview:self.animationview];
[_audioBtn setImage:[UIImage imageNamed:@"audio_icon_3"] forState:UIControlStateNormal];
_audioBtn.userInteractionEnabled = YES;

//动画的imageview
- (UIImageView *)animationview{
    if (!_animationview) {
        _animationview = [[UIImageView alloc] initWithFrame:CGRectMake(11.25, 5, 15, 15)];
        NSArray *myImages = [NSArray arrayWithObjects: [UIImage imageNamed:@"audio_icon_3"],[UIImage imageNamed:@"audio_icon_1"],[UIImage imageNamed:@"audio_icon_2"],[UIImage imageNamed:@"audio_icon_3"],nil];

        _animationview.animationImages = myImages;
        _animationview.animationDuration = 1;
        _animationview.animationRepeatCount = 0; //动画重复次数，0表示无限循环
    }
    return _animationview;
}

// 点击按钮的事件

//点击播放按钮时，动画开始
[self.animationview startAnimating];
[self.audioBtn setImage:nil forState:UIControlStateNormal];
//在语音结束后，停止动画
[self.animationview stopAnimating];
[self.audioBtn setImage:[UIImage imageNamed:@"audio_icon_3"] forState:UIControlStateNormal];
