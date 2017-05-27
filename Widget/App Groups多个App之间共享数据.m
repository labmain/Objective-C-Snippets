#pragma mark userdefaultes 存取
- (void)saveData:(UITextField *)TF
{
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.DSLBlobWidget"];
    [defaults setObject:TF.text forKey:@"DSL"];
    [defaults synchronize];
}
// 从app那里加载数据以便达到数据共享的目的
- (NSString *)getDatafromMainAPP
{
    NSUserDefaults *defaults = [[NSUserDefaultsalloc] initWithSuiteName:@"group.DSLBlobWidget"];
    return [defaultsobjectForKey:@"DSL"];
}

#pragma mark - 文件存取
//copy image to Library
- (void)copyImageToLibrary
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"DSL.png" ofType:nil];
    NSFileManager *manger = [NSFileManager defaultManager];
    NSString *documentPath = [NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/DSL.png"];
    NSLog(@"%@", documentPath);
    NSError *error = nil;
    if (path != nil) {
        if (![manger fileExistsAtPath:documentPath]) {
            [manger copyItemAtPath:path toPath:documentPath error:&error];
            if (error) {
                NSLog(@"==copy error==%@", [error localizedDescription]);
            }
        }
    } else {
        NSLog(@"sourcePath is nil");
    }
    [self copyImage];
}

#pragma mark 从app那里加载数据以便达到数据共享的目的（NSFileManger 存图片）
- (void)copyImage
{
    NSError *error = nil;
    NSURL *contentURL = [[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.DSLBlobWidget"];
    NSString *newPath = [contentURL URLByAppendingPathComponent:@"/Library/Caches/DSL.png"].path;
    [[NSFileManager defaultManager] copyItemAtPath:[NSHomeDirectory() stringByAppendingPathComponent:@"/Library/Caches/DSL.png"] toPath:newPath error:&error];
    if (error) {
        NSLog(@"copy error==%@", [error localizedDescription]);
    }
}
