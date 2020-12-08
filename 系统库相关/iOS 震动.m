#import <AVFoundation/AVFoundation.h>

/// **** 持续震动 *****

/// 1. 注册监听，完成之后回调
AudioServicesAddSystemSoundCompletion(kSystemSoundID_Vibrate, NULL, NULL, soundCompleteCallback, NULL);
/// kSystemSoundID_Vibrate => 震动的 soundID
/// 2. 开始震动
AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);

// 3.停止
-(void)stopAlertSoundWithSoundID:(SystemSoundID)sound {
    /// 停止震动
    AudioServicesDisposeSystemSoundID(kSystemSoundID_Vibrate);
    /// 取消监听
    AudioServicesRemoveSystemSoundCompletion(sound);
}