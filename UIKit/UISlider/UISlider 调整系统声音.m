#import <AVFoundation/AVFoundation.h>
// 调整系统声音

+ (UISlider *)getSystemVolume
{
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    volumeView.frame = CGRectMake(-1000, -100, 100, 100);
    UISlider *slider = nil;
    for (UIView *view in [volumeView subviews]){
        if ([view.class.description isEqualToString:@"MPVolumeSlider"]){
            slider = (UISlider*)view;
            break;
        }
    }
    
    AVAudioSession *sec = [AVAudioSession sharedInstance];
    
    slider.value = sec.outputVolume;
    return slider;
}



// 使用方法：

self.volumeViewSlider = [toolset getSystemVolume];
self.soundVolumeSlider.value = self.volumeViewSlider.value;

[self.soundVolumeSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];

- (void)sliderValueChanged:(UISlider *)mSlider{
    [self.volumeViewSlider setValue:mSlider.value animated:NO];
    [self.volumeViewSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
}