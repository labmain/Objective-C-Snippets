在指定的目录下创建文件，如果该文件名（文件名包括了后缀在内，比如test1和test1.html是两个文件）存在，则将这个文件删除，然后再创建；如果文件名不存在，则直接创建
- (BOOL)createFileAtPath:(NSString *)path contents:(NSData *)data attributes:(NSDictionary<NSString *,id> *)attr;
// 此时这个文件的attributes信息全部更改，创建时间变成当前时间，修改时间变成当前时间
//
// path：文件的路径
// contents：文件的二进制内容（NSData）
// attributes：文件的属性（后面详细说明）
// 如果path前面的路径(即/path之前的路径)存在，只是文件不存在，则会生成一个文件，然后将NSData写入，如果path所在的路径的中间的路径不存在，则不会写入文件
