//1.data读取过程的可选配置条件
typedef NS_OPTIONS(NSUInteger, NSDataReadingOptions) {                                    NSDataReadingMappedIfSafe =  1UL << 0,
    NSDataReadingUncached = 1UL << 1,
    NSDataReadingMappedAlways NS_ENUM_AVAILABLE(10_7, 5_0) = 1UL << 3,
    NSDataReadingMapped = NSDataReadingMappedIfSafe,// Deprecated name for NSDataReadingMappedIfSafe
    NSMappedRead = NSDataReadingMapped,// Deprecated name for NSDataReadingMapped
    NSUncachedRead = NSDataReadingUncached// Deprecated name for NSDataReadingUncached};

//2.data写入过程的可选配置条件
typedef NS_OPTIONS(NSUInteger, NSDataWritingOptions) {                                               NSDataWritingAtomic = 1UL << 0,
    NSDataWritingWithoutOverwriting NS_ENUM_AVAILABLE(10_8, 6_0) = 1UL << 1,
    NSDataWritingFileProtectionNone NS_ENUM_AVAILABLE_IOS(4_0)                                  = 0x10000000,
    NSDataWritingFileProtectionComplete NS_ENUM_AVAILABLE_IOS(4_0)                              = 0x20000000,
    NSDataWritingFileProtectionCompleteUnlessOpen NS_ENUM_AVAILABLE_IOS(5_0) = 0x30000000, NSDataWritingFileProtectionCompleteUntilFirstUserAuthentication NS_ENUM_AVAILABLE_IOS(5_0)  = 0x40000000,
    NSDataWritingFileProtectionMask NS_ENUM_AVAILABLE_IOS(4_0)                                  = 0xf0000000,
    NSAtomicWrite = NSDataWritingAtomic  };

//3.data在搜索过程中的可选配置条件
typedef NS_OPTIONS(NSUInteger, NSDataSearchOptions) {
    NSDataSearchBackwards = 1UL << 0,
    NSDataSearchAnchored = 1UL << 1} NS_ENUM_AVAILABLE(10_6, 4_0);

//4.base64编码中的一些设置选择
typedef NS_OPTIONS(NSUInteger, NSDataBase64EncodingOptions) {
    NSDataBase64Encoding64CharacterLineLength = 1UL << 0,
    NSDataBase64Encoding76CharacterLineLength = 1UL << 1,
    NSDataBase64EncodingEndLineWithCarriageReturn = 1UL << 4,
    NSDataBase64EncodingEndLineWithLineFeed = 1UL << 5,}
    NS_ENUM_AVAILABLE(10_9, 7_0);

//5.base64在解码过程中的option可选条件,下面选项表示在将诶吗过程中忽略不能识别的字节
typedef NS_OPTIONS(NSUInteger, NSDataBase64DecodingOptions) {
    NSDataBase64DecodingIgnoreUnknownCharacters = 1UL << 0
}
NS_ENUM_AVAILABLE(10_9, 7_0);

/**************** Immutable Data不可变的Data****************/

@interface NSData : NSObject

//6.获取data长度的属性
@property (readonly) NSUInteger length;

//7.返回data对象的首指针
@property (readonly) const void *bytes NS_RETURNS_INNER_POINTER;
@end

@interface NSData (NSExtendedData)

//8.返回一个ASCII编码格式的字符串，采用的格式是data属性列表的格式。
@property (readonly, copy) NSString *description;

//9.取出data中指定长度的字节存入buffer这个提前声明的数组中
- (void)getBytes:(void *)buffer length:(NSUInteger)length;

//9.取出data中指定位置range的字节存入buffer这个提前声明的数组中
- (void)getBytes:(void *)buffer range:(NSRange)range;

//10.判断两个data是否相等
- (BOOL)isEqualToData:(NSData *)other;

//11.截图data指定位置的子data
- (NSData *)subdataWithRange:(NSRange)range;

//12.将data写入指定的文件
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;

//13.将data写入指定的url
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;

//14.将data写入指定文件，并且有写入过程的设置条件，带错误信息
- (BOOL)writeToFile:(NSString *)path options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;

//15.将data写入指定的url，并且有写入过程的设置条件，带错误信息
- (BOOL)writeToURL:(NSURL *)url options:(NSDataWritingOptions)writeOptionsMask error:(NSError **)errorPtr;

//16.搜索在data1内部存在data2的位置，并且有搜索配置条件，并且可加入搜索的范围
- (NSRange)rangeOfData:(NSData *)dataToFind options:(NSDataSearchOptions)mask range:(NSRange)searchRange NS_AVAILABLE(10_6, 4_0);

//17.列举遍历字典的方法
- (void)enumerateByteRangesUsingBlock:(void (^)(const void *bytes, NSRange byteRange, BOOL *stop))block NS_AVAILABLE(10_9, 7_0);

@end

/*** 创建data的所有相关方法作为一个类别几种到一块 ***/
@interface NSData (NSDataCreation)

//18.data的快速创建办法
+ (instancetype)data;

//19.赋值以bytes开头，长度为length的数据，进行初始化使其成为数据对象的内容
+ (instancetype)dataWithBytes:(const void *)bytes length:(NSUInteger)length;

//20.这个方法生成的data中保存的是指向数据的指针，并没有对数据进行复制操作。
+ (instancetype)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;

//21.这个方法生成的data中保存的是指向数据的指针，并没有对数据进行复制操作。当flag为yes的时候，生成的data对象是bytes的所有者，当data对象被释放的时候也会同时释放bytes，所以bytes必须是通过malloc在堆上分配的内存。当flag为no的时候，bytes不会被自动释放，释放bytes时要注意时机，不要再data对象还被使用的时候释放bytes。
+ (instancetype)dataWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)b;

//22.加载file文件，并且有可选择读取文件的选项配置条件，带有错误信息
+ (instancetype)dataWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;

//23.加载url，并且有可选择读取文件的选项配置条件，带有错误信息
+ (instancetype)dataWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;

//24.从参数path指定的文件读入二进制数据，用该数据初始化NSData对象。
+ (instancetype)dataWithContentsOfFile:(NSString *)path;

//25.从参数path指定的url读入，用该数据初始化NSData对象。
+ (instancetype)dataWithContentsOfURL:(NSURL *)url;

//26.赋值以bytes开头，长度为length的数据，进行初始化使其成为数据对象的内容
- (instancetype)initWithBytes:(const void *)bytes length:(NSUInteger)length;

//27.这个方法生成的data中保存的是指向数据的指针，并没有对数据进行复制操作。
- (instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length;

//28.这个方法生成的data中保存的是指向数据的指针，并没有对数据进行复制操作。当flag为yes的时候，生成的data对象是bytes的所有者，当data对象被释放的时候也会同时释放bytes，所以bytes必须是通过malloc在堆上分配的内存。当flag为no的时候，bytes不会被自动释放，释放bytes时要注意时机，不要再data对象还被使用的时候释放bytes。
- (instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)b;

//29.
- (instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)length deallocator:(void (^)(void *bytes, NSUInteger length))deallocator NS_AVAILABLE(10_9, 7_0);

//30.从参数path指定的文件读入二进制数据，用该数据初始化NSData对象。如果读取文件失败，则释放调用者并返回nil，同时把错误信息写入指针errorPtr。mask是一个选项信息，用于指定是否使用虚拟内存等。
- (instancetype)initWithContentsOfFile:(NSString *)path options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;

//31.从参数url指定的路径中读入，用该数据初始化NSData对象。如果读取文件失败，则释放调用者并返回nil，同时把错误信息写入指针errorPtr。mask是一个选项信息，用于指定是否使用虚拟内存等。
- (instancetype)initWithContentsOfURL:(NSURL *)url options:(NSDataReadingOptions)readOptionsMask error:(NSError **)errorPtr;

//32.加载flie文件路径
- (instancetype)initWithContentsOfFile:(NSString *)path;

//33.加载url
- (instancetype)initWithContentsOfURL:(NSURL *)url;

//34.用指定的NSData对象aData来创建一个新的NSData对象，参数可以是NSMutableData对象。
- (instancetype)initWithData:(NSData *)data;

//35.用指定的NSData对象aData来创建一个新的NSData对象，参数可以是NSMutableData对象。
+ (instancetype)dataWithData:(NSData *)data;

@end

/*** base64方案编码分类  iOS7之后苹果给出以下四个API供实现base64方案 头两个是处理字符串的，后两个是处理UTF-8编码数据的，这两个承兑的方法功能是一样的，但是有时候用其中一个比另一个效率要高。如果你像要bae64编码字符串然后写进文件，你应该使用UTF-8编码数据的这对方法。如果你打算base64编码字符串之后用作json，你应该使用另外一对方法 编码解码一一对应***/

@interface NSData (NSDataBase64Encoding)

//36.解码。将已经base64编码之后的字符串数据再转化为NSData数据，
- (instancetype)initWithBase64EncodedString:(NSString *)base64String options:(NSDataBase64DecodingOptions)options NS_AVAILABLE(10_9, 7_0);

//37.编码。将一个data数据利用base64方案转化成base64之后的NSString字符串
- (NSString *)base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)options NS_AVAILABLE(10_9, 7_0);

//38.解码。将已经base64编码之后的NSData数据再转化为NSData数据
- (instancetype)initWithBase64EncodedData:(NSData *)base64Data options:(NSDataBase64DecodingOptions)options NS_AVAILABLE(10_9, 7_0);

//39.编码.将一个data数据利用base64方案转化成base64之后的NSData数据
- (NSData *)base64EncodedDataWithOptions:(NSDataBase64EncodingOptions)options NS_AVAILABLE(10_9, 7_0);

// 示例程序：使用第一对编码解码API。

NSString * stringExample = [NSString stringWithFormat:@"I Love You"];

NSData * data1 = [stringExample dataUsingEncoding:NSUTF8StringEncoding];

NSString * base64String   = [data1 base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];

NSLog(@"Base64-encoded string is %@",base64String);

//log（Base64-encoded string is SSBMb3ZlIFlvdQ==）；

NSData * dataFromString = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];

NSLog(@"string is %@",[NSString stringWithUTF8String:[dataFromString bytes]]);

//log(string is I Love You);

@end

/**************** Mutable Data

可变data

****************/

@interface NSMutableData : NSData

//40.可变data的可变字节
@property (readonly) void *mutableBytes NS_RETURNS_INNER_POINTER;

//41.可变data的长度
@property NSUInteger length;

@end

@interface NSMutableData (NSExtendedMutableData)

//42.给可变data追加字节
- (void)appendBytes:(const void *)bytes length:(NSUInteger)length;

//43.给data追加其他的data
- (void)appendData:(NSData *)other;

//44.为已经存在的data追加新的长度
- (void)increaseLengthBy:(NSUInteger)extraLength;

// 示例程序：

NSMutableData * data = [NSMutableData data];

[data increaseLengthBy:5];

NSLog(@"dataLength———%lu",(unsigned long)data.length);

//45.给data替换对应位置的字节
- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)bytes;

//46.重置可变data对应位置的字节
- (void)resetBytesInRange:(NSRange)range;

//47.为可变data设置data数据
- (void)setData:(NSData *)data;

//48.给data替换对应位置的字节, 并且存在替换长度
- (void)replaceBytesInRange:(NSRange)range withBytes:(const void *)replacementBytes length:(NSUInteger)replacementLength;

@end0

@interface NSMutableData (NSMutableDataCreation)

//49.动态创建可变data 并且初始化指定大小
+ (instancetype)dataWithCapacity:(NSUInteger)aNumItems;

//50.动态创建可变data 并且初始化指定长度
+ (instancetype)dataWithLength:(NSUInteger)length;

//51.静态创建可变data 并且初始化指定大小
- (instancetype)initWithCapacity:(NSUInteger)capacity;

//52.静态创建可变data 并且初始化指定长度
- (instancetype)initWithLength:(NSUInteger)length;

@end
