// filePath：文件的路径
// 返回目录下文件或文件夹的名字
- (NSArray<NSString *> *)subpathsAtPath:(NSString *)path;


打印结果：
(lldb) po subArray
<__NSArrayM 0x7fd9e85ab530>(
folder,// 文件夹
test0, // 文件
test1,
test2,
test3,
test4
)

// 返回文件夹每一项的NSURL
- (NSArray<NSURL *> *)contentsOfDirectoryAtURL:(NSURL *)url includingPropertiesForKeys:(NSArray<NSURLResourceKey> *)keys options:(NSDirectoryEnumerationOptions)mask error:(NSError * _Nullable *)error;

NSFileManager *fileManager = [NSFileManager defaultManager];
NSURL *bundleURL = [[NSBundle mainBundle] bundleURL];
NSArray *contents = [fileManager contentsOfDirectoryAtURL:bundleURL
                               includingPropertiesForKeys:@[]
                                                  options:NSDirectoryEnumerationSkipsHiddenFiles
                                                    error:nil];

NSPredicate *predicate = [NSPredicate predicateWithFormat:@"pathExtension == 'png'"];
for (NSURL *fileURL in [contents filteredArrayUsingPredicate:predicate]) {
    // 在目录中枚举 .png 文件
}
