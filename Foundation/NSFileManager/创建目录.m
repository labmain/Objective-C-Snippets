// Document 目录下创建一个 images 文件夹
NSFileManager *fileManager = [NSFileManager defaultManager];
NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
NSString *imagesPath = [documentsPath stringByAppendingPathComponent:@"images"];
if (![fileManager fileExistsAtPath:imagesPath]) {
    [fileManager createDirectoryAtPath:imagesPath withIntermediateDirectories:NO attributes:nil error:nil];
}］
