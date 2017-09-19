#import<AudioToolbox/AudioToolbox.h>

1）将音频格式的路径转换成一个CFURLRef
  NSString  * path = [[NSBundlemainBundle] pathForResource:@"warn"ofType:@"wav"];
  NSURL *url = [[NSURLalloc] initFileURLWithPath:path];
 CFURLRef urlRef = (CFURLRef) url;
2）“授权”，允许应用程序指定一个音频文件播放系统声音
AudioServicesCreateSystemSoundID(urlRef, &mySoundID);
3）属性设置
 初始化一些音频属性值：
 SystemSoundID mySoundID = 0;
 AudioServicesPropertyID flag = 1;
说明：
flag的取值0和1.对后面的设置是有影响的。
kAudioServicesPropertyIsUISound和kAudioServicesPropertyCompletePlaybackIfAppDies与flag的取值有关。大概就是取0时表示如果正在播放其它音乐，不会终止正在播放的其它音乐，两个声音一起播放。
为1示如果正在播放音乐，则先终止一下音乐，再播放铃音，之后再恢复音乐的播放


设置的第一种方法：
AudioServicesSetProperty(kAudioServicesPropertyIsUISound, sizeof(SystemSoundID), &mySoundID, sizeof(AudioServicesPropertyID), &flag);
设置的二种方法：
AudioSessionSetProperty(kAudioSessionProperty_OverrideCategoryDefaultToSpeaker,sizeof(AudioServicesPropertyID), &flag);
最后播放
