[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];

- (void)volumeChanged:(NSNotification *)notification
{
    self.soundVolumeSlider.value = [notification.userInfo[@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];
}