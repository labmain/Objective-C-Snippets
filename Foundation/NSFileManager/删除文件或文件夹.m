
- (BOOL)removeItemAtPath:(NSString *)path error:(NSError * _Nullable *)error;

// 删除一个文件
NSFileManager *fileManager = [NSFileManager defaultManager];
NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
NSString *filePath = [documentsPath stringByAppendingPathComponent:@"image.png"];
NSError *error = nil;

if (![fileManager removeItemAtPath:filePath error:&error]) {
    NSLog(@"[Error] %@ (%@)", error, filePath);
}
