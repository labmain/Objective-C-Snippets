@property(readonly, getter=isPlaying) BOOL playing //是否正在播放，只读
@property(readonly) NSUInteger numberOfChannels  //音频声道数，只读
@property(readonly) NSTimeInterval duration    //音频时长
@property(readonly) NSURL *url    //音频文件路径，只读
@property(readonly) NSData *data    //音频数据，只读
@property float pan     //立体声平衡，如果为-1.0则完全左声道，如果0.0则左右声道平衡，如果为1.0则完全为右声道
@property float volume    音量大小，范围0-1.0
@property BOOL enableRate    是否允许改变播放速率
@property float rate    播放速率，范围0.5-2.0，如果为1.0则正常播放，如果要修改播放速率则必须设置enableRate为YES
@property NSTimeInterval currentTime    当前播放时长
@property(readonly) NSTimeInterval deviceCurrentTime    输出设备播放音频的时间，注意如果播放中被暂停此时间也会继续累加
@property NSInteger numberOfLoops    循环播放次数，如果为0则不循环，如果小于0则无限循环，大于0则表示循环次数
@property(readonly) NSDictionary *settings    音频播放设置信息，只读
@property(getter=isMeteringEnabled) BOOL meteringEnabled    是否启用音频测量，默认为NO，一旦启用音频测量可以通过updateMeters方法更新测量值

对象方法
- (instancetype)initWithContentsOfURL:(NSURL *)url error:(NSError **)outError    使用文件URL初始化播放器，注意这个URL不能是HTTP URL，AVAudioPlayer不支持加载网络媒体流，只能播放本地文件
- (instancetype)initWithData:(NSData *)data error:(NSError **)outError    使用NSData初始化播放器，注意使用此方法时必须文件格式和文件后缀一致，否则出错，所以相比此方法更推荐使用上述方法或- (instancetype)initWithData:(NSData *)data fileTypeHint:(NSString *)utiString error:(NSError **)outError方法进行初始化
- (BOOL)prepareToPlay;    加载音频文件到缓冲区，注意即使在播放之前音频文件没有加载到缓冲区程序也会隐式调用此方法。
- (BOOL)play;    播放音频文件
- (BOOL)playAtTime:(NSTimeInterval)time    在指定的时间开始播放音频
- (void)pause;    暂停播放
- (void)stop;    停止播放
- (void)updateMeters    更新音频测量值，注意如果要更新音频测量值必须设置meteringEnabled为YES，通过音频测量值可以即时获得音频分贝等信息
- (float)peakPowerForChannel:(NSUInteger)channelNumber;    获得指定声道的分贝峰值，注意如果要获得分贝峰值必须在此之前调用updateMeters方法
- (float)averagePowerForChannel:(NSUInteger)channelNumber    获得指定声道的分贝平均值，注意如果要获得分贝平均值必须在此之前调用updateMeters方法
@property(nonatomic, copy) NSArray *channelAssignments    获得或设置播放声道
代理方法    说明
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag    音频播放完成
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error    音频解码发生错误
