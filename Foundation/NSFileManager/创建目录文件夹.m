// 在指定的目录下创建文件夹，如果该文件夹存在，则不创建

// filePath：文件夹的路径
// IntermediateDirectories：是否创建中间文件夹，YES会创建中间文件夹，NO不会创建中间文件件
// attributes：文件夹的属性
NSString *path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:kOggLocalPath];
[[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
