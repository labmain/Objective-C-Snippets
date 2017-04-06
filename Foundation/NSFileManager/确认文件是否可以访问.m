- (BOOL)fileExistsAtPath:(NSString *)path;
// 返回一个布尔值，指定路径中的文件或目录是否存在。

- (BOOL)fileExistsAtPath:(NSString *)path isDirectory:(BOOL *)isDirectory;
// 返回一个布尔值，指定路径中的文件或目录是否存在。isDirectory参数表示该路径指向的是一个目录或普通文件。

- (BOOL)isReadableFileAtPath:(NSString *)path;
// 返回一个布尔值，该值指示调用对象是否能够读取指定的文件。

- (BOOL)isWritableFileAtPath:(NSString *)path;
// 返回一个布尔值，该值指示调用对象是否能够写入指定的文件。

- (BOOL)isExecutableFileAtPath:(NSString *)path;
// 返回一个布尔值，该值指示操作系统是否能够执行指定的文件。

- (BOOL)isDeletableFileAtPath:(NSString *)path;
// 返回一个布尔值，该值指示调用对象是否能够删除指定的文件。
