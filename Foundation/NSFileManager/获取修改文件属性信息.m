0.获取文件或者文件夹的属性

// path：文件的路径
// error：错误报告
NSDictionary *attr = [self.fileManager attributesOfItemAtPath:test1Path error:nil];

attributes打印结果：
{
    NSFileCreationDate = "2016-04-21 10:10:28 +0000";
    NSFileExtensionHidden = 0;
    NSFileGroupOwnerAccountID = 20;
    NSFileGroupOwnerAccountName = staff;
    NSFileModificationDate = "2016-04-21 10:10:28 +0000";
    NSFileOwnerAccountID = 501;
    NSFilePosixPermissions = 420;
    NSFileReferenceCount = 1;
    NSFileSize = 26514;
    NSFileSystemFileNumber = 6055428;
    NSFileSystemNumber = 16777220;
    NSFileType = NSFileTypeRegular;
}

1.修改attribute属性：

changeAttr：修改的属性的字典
path：修改的文件的路径
error：错误报告
注意：attributes里有些属性是不能够修改的，若此时的changeAttr有不能够修改的属性，那changeAttr里能够修改的属性不能够修改成功但是此时API返回的BOOL为YES(见demo3)

[self.fileManager setAttributes:changeAttr ofItemAtPath:test1Path error:&error];

/***************************************************************/
attributes属性：
/*
NSFileSize（不可更改）
文件或者文件夹的大小，注意单位是byte

NSFileAppendOnly
这个键的值需要设置为一个表示布尔值的NSNumber对象，表示创建的目录是否是只读的。

NSFileCreationDate（可更改时间）
这个键的值需要设置为一个NSDate对象，表示目录的创建时间。

NSFileOwnerAccountName
这个键的值需要设置为一个NSString对象，表示这个目录的所有者的名字。

NSFileGroupOwnerAccountName
这个键的值需要设置为一个NSString对象，表示这个目录的用户组的名字。

NSFileGroupOwnerAccountID
这个键的值需要设置为一个表示unsigned int的NSNumber对象，表示目录的组ID。

NSFileModificationDate（可更改时间）
这个键的值需要设置一个NSDate对象，表示目录的修改时间。

NSFileOwnerAccountID
这个键的值需要设置为一个表示unsigned int的NSNumber对象，表示目录的所有者ID。

NSFilePosixPermissions
这个键的值需要设置为一个表示short int的NSNumber对象，表示目录的访问权限。

NSFileReferenceCount
这个键的值需要设置为一个表示unsigned long的NSNumber对象，表示目录的引用计数，即这个目录的硬链接数。
*/
