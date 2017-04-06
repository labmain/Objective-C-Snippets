对一个文件重命名

想要重命名一个文件，我们需要把文件移到一个新的路径下。下面的代码创建了我们所期望的目标文件的路径，然后请求移动文件以及在移动之后显示文件目录。

//通过移动该文件对文件重命名

NSString *filePath2= [documentsDirectory

stringByAppendingPathComponent:@"file2.txt"];

//判断是否移动

if ([fileMgr moveItemAtPath:filePath toPath:filePath2 error:&error] != YES)

NSLog(@"Unable to move file: %@", [error localizedDescription]);

//显示文件目录的内容

NSLog(@"Documentsdirectory: %@",

[fileMgr contentsOfDirectoryAtPath:documentsDirectoryerror:&error])
