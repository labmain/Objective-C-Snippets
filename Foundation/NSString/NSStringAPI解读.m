// NSString字符串全部API作用解释
// iOS8最新API和一些生僻API，做了红色标注，便于大家查阅。
//0.定义一个无符号整型 两个字节 范围[0,65535]
typedef unsigned short unichar;
//1.提前进入以下六个类告诉编译器，六个都是类的名称
@class NSData,NSArray,NSDictionary,NSCharacterSet,NSURL,NSError,NSLocale;
//2.异常处理字符串，控制台出错信息报告
FOUNDATION_EXPORTNSString *const NSParseErrorException;
//3.宏定义下字符串的最大值
#define NSMaximumStringLength (INT_MAX-1)
//4.字符串进行比较options
typedefNS_OPTIONS(NSUInteger, NSStringCompareOptions) {
    NSCaseInsensitiveSearch =1,//两个字符串的比较不区分大小写
NSLiteralSearch = 2,//两个字符串的比较区分大小写
    NSBackwardsSearch =4,//从字符串末尾开发查询搜索
    NSAnchoredSearch =8,//搜索有限制范围的字符串
NSNumericSearch = 64,//根据字符串里的数字来计算顺序
    NSDiacriticInsensitiveSearchNS_ENUM_AVAILABLE(10_5,2_0) =128,
NSWidthInsensitiveSearch NS_ENUM_AVAILABLE(10_5,2_0) =256,//可以忽略字符串的宽度（长度）比较结果
    NSForcedOrderingSearch NS_ENUM_AVAILABLE(10_5,2_0) =512,//忽略不区分大小写比较的选项
    NSRegularExpressionSearch NS_ENUM_AVAILABLE(10_7,3_2) =1024 //
};

//5.字符串编码的多种选项
enum {
    NSASCIIStringEncoding =1,/* 0..127 only */
    NSNEXTSTEPStringEncoding =2,
    NSJapaneseEUCStringEncoding =3,
    NSUTF8StringEncoding =4,
    NSISOLatin1StringEncoding =5,
    NSSymbolStringEncoding =6,
    NSNonLossyASCIIStringEncoding =7,
    NSShiftJISStringEncoding =8,         /* kCFStringEncodingDOSJapanese */
    NSISOLatin2StringEncoding =9,
    NSUnicodeStringEncoding =10,
    NSWindowsCP1251StringEncoding = 11,   /* Cyrillic; same as AdobeStandardCyrillic */
    NSWindowsCP1252StringEncoding =12,   /* WinLatin1 */
    NSWindowsCP1253StringEncoding =13,   /* Greek */
    NSWindowsCP1254StringEncoding =14,   /* Turkish */
    NSWindowsCP1250StringEncoding =15,   /* WinLatin2 */
    NSISO2022JPStringEncoding = 21,       /* ISO 2022 Japanese encoding for e-mail */
    NSMacOSRomanStringEncoding =30,

    NSUTF16StringEncoding = NSUnicodeStringEncoding,     /* An alias for NSUnicodeStringEncoding */

    NSUTF16BigEndianStringEncoding = 0x90000100,         /* NSUTF16StringEncoding encoding with explicit endianness specified */
    NSUTF16LittleEndianStringEncoding = 0x94000100,      /* NSUTF16StringEncoding encoding with explicit endianness specified */

    NSUTF32StringEncoding =0x8c000100,
    NSUTF32BigEndianStringEncoding = 0x98000100,         /* NSUTF32StringEncoding encoding with explicit endianness specified */
    NSUTF32LittleEndianStringEncoding = 0x9c000100       /* NSUTF32StringEncoding encoding with explicit endianness specified */
};
//6.字符串编码
typedefNSUInteger NSStringEncoding;
    字符串编码转换条件option，下面指定缓冲区转换会用到
typedefNS_OPTIONS(NSUInteger, NSStringEncodingConversionOptions) {
    NSStringEncodingConversionAllowLossy =1,
    NSStringEncodingConversionExternalRepresentation =2
};
//7.字符转化异常
FOUNDATION_EXPORTNSString *const NSCharacterConversionException;

//8. NSString继承NSObject，并遵守以下三个协议
@interface NSString :NSObject <NSCopying,NSMutableCopying,NSSecureCoding>
//9.只读属性字符串长度length
@property (readonly)NSUInteger length;
//10.选取字符串对应下表的字符
-(unichar)characterAtIndex:(NSUInteger)index;
//11.字符串的init初始化方法
-(instancetype)initNS_DESIGNATED_INITIALIZER;
//12.当一个xib的控件被加载实例化的时候，系统会默认调用这个方法。
- (instancetype)initWithCoder:(NSCoder *)aDecoderNS_DESIGNATED_INITIALIZER;

@end
//13.NSString的扩展方法
@interface NSString (NSStringExtensionMethods)
//14.截取字符串的指定段
- (void)getCharacters:(unichar *)buffer range:(NSRange)aRange;
//15.截取指定位置Index之后字符串
- (NSString *)substringFromIndex:(NSUInteger)from;
//16.从索引0第一个字符串开始，截取指定长度的字符串
- (NSString *)substringToIndex:(NSUInteger)to;
//17.截取字符串的指定段，返回值为NSString
- (NSString *)substringWithRange:(NSRange)range;
//18.比较两个字符串
- (NSComparisonResult)compare:(NSString *)string;
//19.比较两个字符串，并加上条件
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask;
//20.比较两个字符串，并加上某些条件到指定段
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)compareRange;
//21.比较两个字符串，并加上某些条件还有本地化语言环境，在指定段进行比较
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)compareRange locale:(id)locale;
//22.不区分大小写比较字符串
- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string;
//23.本地化比较字符串
- (NSComparisonResult)localizedCompare:(NSString *)string;
//24.不区分大小写以及本地化比较字符串
- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string;
//25.本地化标准字符串比较，返回升序降序相等
- (NSComparisonResult)localizedStandardCompare:(NSString *)stringNS_AVAILABLE(10_6,4_0);
//26.比较两个字符串是否相等
- (BOOL)isEqualToString:(NSString *)aString;
//27.测试字符串是否以aString开头
- (BOOL)hasPrefix:(NSString *)aString;
//28.测试字符串是否以aString结尾
- (BOOL)hasSuffix:(NSString *)aString;
//29.判断字符串A是否包含aString字符串B，返回值Bool
- (BOOL)containsString:(NSString *)aStringNS_AVAILABLE(10_10,8_0);

//30.这是iOS8的新特性API 判断字符串A是否包含字符串B，不区分大小写，返回Bool
例：NSSsring * stringA = @“abcd”;
        NSSsring * stringB = @“d”;
        BOOl  test = [stringA localizedCaseInsensitiveContainsString:stringB];
       输出打印值 YES
- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)aString NS_AVAILABLE(10_10, 8_0);

//31.搜索一个字符串是否包含某个字符 rangeOfString前面的参数是要被搜索的字符串，后面的是要搜索的字符
- (NSRange)rangeOfString:(NSString *)aString;
//32.搜索一个字符串是否包含某个字符，并添加筛选条件option
- (NSRange)rangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask;
//33搜索一个字符串是否包含某个字符，添加筛选条件以及搜索的范围range
- (NSRange)rangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask range:(NSRange)searchRange;
//34.搜索一个字符串是否包含某个字符，添加筛选条件以及搜索的范围range,最后还有本地化的设置
- (NSRange)rangeOfString:(NSString *)aString options:(NSStringCompareOptions)mask range:(NSRange)searchRange locale:(NSLocale *)localeNS_AVAILABLE(10_5,2_0);
//35.指定字符集进行搜索
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet;
//36.指定字符集进行搜索，并且加上某些限制条件
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet options:(NSStringCompareOptions)mask;
//37.指定字符集进行搜索，并且加上某些限制条件，且在指定的位置段进行
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)aSet options:(NSStringCompareOptions)mask range:(NSRange)searchRange;
//38.用字符串的字符编码指定索引查找位置
- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index;
//39.用字符串的字符编码指定区域段查找位置
- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)rangeNS_AVAILABLE(10_5,2_0);
//40.将aString字符串添加到前面字符串A的后面
- (NSString *)stringByAppendingString:(NSString *)aString;
//41.将多个字符串添加到前面字符串A的后面
- (NSString *)stringByAppendingFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
//42.只读属性 double类型
@property (readonly)double doubleValue;
//43.只读属性 float类型
@property (readonly)float floatValue;
//44.只读属性int类型
@property (readonly)int intValue;
//45.只读属性NSInteger类型
@property (readonly)NSInteger integerValueNS_AVAILABLE(10_5,2_0);
// 46.只读属性long long 类型
@property (readonly)longlong longLongValueNS_AVAILABLE(10_5,2_0);
//47.只读属性BOOL类型
@property (readonly)BOOL boolValueNS_AVAILABLE(10_5,2_0); //
//48.将字符串根据传进来的字符串参数separator进行分割，并转化成数组
- (NSArray *)componentsSeparatedByString:(NSString *)separator;
// 49. 将字符串根据传进来的字符编码separator进行分割，并拆分成数组返回
- (NSArray *)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separatorNS_AVAILABLE(10_5,2_0);
//50.
- (NSString *)commonPrefixWithString:(NSString *)aString options:(NSStringCompareOptions)mask;
//51. 将字符串的所有字符转化成大写
@property (readonly,copy)NSString *uppercaseString;
//52.将字符串的所有字符转化为小写
@property (readonly,copy)NSString *lowercaseString;
// 53. 所有单词的首字母转化成大写
@property (readonly,copy)NSString *capitalizedString;
//54.所有字符转化成大写 本地化
- (NSString *)uppercaseStringWithLocale:(NSLocale *)localeNS_AVAILABLE(10_8,6_0);
//55.所有字符串转化成小写 本地化
- (NSString *)lowercaseStringWithLocale:(NSLocale *)localeNS_AVAILABLE(10_8,6_0);
//54.所有单词首字母转化成大写 本地化
- (NSString *)capitalizedStringWithLocale:(NSLocale *)localeNS_AVAILABLE(10_8,6_0);
//55.删除字符串中包含字符集部分的字符 返回字符串
            扩展一下，如果想要删除字符串前后的空格或者回车，这样做：
           [stringA stringByTrimmingCharactersInSet:   [NSCharacterSetWhitespaceAndNewLineCharacterSet]];
- (NSString *)stringByTrimmingCharactersInSet:(NSCharacterSet *)set;
//56.将字符串padString指定索引段添加到前面字符串后面
- (NSString *)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex;
//57.指定段分行去字符串
- (void)getLineStart:(NSUInteger *)startPtr end:(NSUInteger *)lineEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range;
//58.返回字符串指定段位置和长度
- (NSRange)lineRangeForRange:(NSRange)range;
//59.给字符串指定段分段取字符串
- (void)getParagraphStart:(NSUInteger *)startPtr end:(NSUInteger *)parEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range;
//60指定段分段的位置和长度
- (NSRange)paragraphRangeForRange:(NSRange)range;
//61.
typedefNS_OPTIONS(NSUInteger, NSStringEnumerationOptions) {
    // Pass in one of the "By" options:
    NSStringEnumerationByLines =0,                      // Equivalent to lineRangeForRange:
    NSStringEnumerationByParagraphs =1,                 // Equivalent to paragraphRangeForRange:
    NSStringEnumerationByComposedCharacterSequences =2, // Equivalent to rangeOfComposedCharacterSequencesForRange:
    NSStringEnumerationByWords =3,
    NSStringEnumerationBySentences =4,
    // ...and combine any of the desired additional options:
    NSStringEnumerationReverse =1UL <<8,
    NSStringEnumerationSubstringNotRequired =1UL <<9,
    NSStringEnumerationLocalized =1UL <<10             // User's default locale
};
//62.检查是否在指定范围内是否有匹配的字符串
- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void (^)(NSString *substring,NSRange substringRange,NSRange enclosingRange, BOOL *stop))blockNS_AVAILABLE(10_6,4_0);
//63.列举枚举字符串所有行
- (void)enumerateLinesUsingBlock:(void (^)(NSString *line,BOOL *stop))block NS_AVAILABLE(10_6,4_0);
//64.字符串
@property (readonly,copy)NSString *description;
//65.返回字符串哈希地址
@property (readonly)NSUInteger hash;
/*** Encoding methods ***/
//66.字符串最快编码值
@property (readonly)NSStringEncoding fastestEncoding;   //
//67.字符串最小编码值
@property (readonly)NSStringEncoding smallestEncoding;  //
//68.返回指定编码的NSData对象
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy;   // External representation
//69.返回指定编码的NSData对象
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding;                                   // External representation
//70.判断是否可以无损化转码
- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding;
//71.char编码转化
- (__strongconstchar *)cStringUsingEncoding:(NSStringEncoding)encodingNS_RETURNS_INNER_POINTER;
//72.C字符串转化是够成功
- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding;// NO return if conversion not
//73.指定缓存区转换
- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover;
//74.字符串编码时需要用的字节长度
- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc;

//75.字符串编码时需要用到最大字节长度
- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc;
//76.unicode范式D标准化
@property (readonly,copy)NSString *decomposedStringWithCanonicalMapping;
//77.unicode范式c标准化
@property (readonly,copy)NSString *precomposedStringWithCanonicalMapping;
//78.unicode范式KD标准化
@property (readonly,copy)NSString *decomposedStringWithCompatibilityMapping;
//79.unicode范式KC标准化
@property (readonly,copy)NSString *precomposedStringWithCompatibilityMapping;
//80.本地化字符串折叠
- (NSString *)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale NS_AVAILABLE(10_5,2_0);
//81.字符串的指定区域段被有条件的替换掉
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRangeNS_AVAILABLE(10_5,2_0);
//82.字符串的特定字符串被替换掉
- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement NS_AVAILABLE(10_5,2_0);
//83.将字符串的指定区域段字符串被替换掉
- (NSString *)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement NS_AVAILABLE(10_5,2_0);
//84.将字符串转化为char类型
@property (readonly)__strongconstchar *UTF8StringNS_RETURNS_INNER_POINTER;
//85.默认C字符串编码
+ (NSStringEncoding)defaultCStringEncoding;
//86.可用的字符串编码
+ (constNSStringEncoding *)availableStringEncodings;
//87.编码的名称vheng
+ (NSString *)localizedNameOfStringEncoding:(NSStringEncoding)encoding;
//88.指定缓冲区，编码和字节长度初始化NSString对象
- (instancetype)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;
//89.指定unichar字符，字节长度初始化NSString对象
- (instancetype)initWithCharacters:(constunichar *)characters length:(NSUInteger)length;
//90.转化为NSString对象
- (instancetype)initWithUTF8String:(constchar *)nullTerminatedCString;
//91.指定字符串初始化为NSString对象
- (instancetype)initWithString:(NSString *)aString;
//92.格式化多个字符串初始化NSString对象
- (instancetype)initWithFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
//93. 格式化字符串初始化NSString对象
- (instancetype)initWithFormat:(NSString *)format arguments:(va_list)argListNS_FORMAT_FUNCTION(1,0);
//94.本地化格式化多个字符串初始化NSString对象
- (instancetype)initWithFormat:(NSString *)format locale:(id)locale, ...NS_FORMAT_FUNCTION(1,3);
//95.本地化格式化字符串初始化NSString对象
- (instancetype)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argListNS_FORMAT_FUNCTION(1,0);
//96.指定编码转化NSData数据
- (instancetype)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
//97.指定编码和字节数初始化NSString对象
- (instancetype)initWithBytes:(constvoid *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding;
//98.指定缓冲区，编码和字节数初始化NSString对象
- (instancetype)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer;
//99.初始化空字符串
+ (instancetype)string;
//100.初始化NSString字符串
+ (instancetype)stringWithString:(NSString *)string;
//101.返回指定长度unichar的C字符串
+ (instancetype)stringWithCharacters:(constunichar *)characters length:(NSUInteger)length;
//102.转化C字符串为UTF8串
+ (instancetype)stringWithUTF8String:(constchar *)nullTerminatedCString;
//103.初始化NSString对象昂，这种创建方式会自动释放内存，很常用的一种方式
+ (instancetype)stringWithFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
//104.初始化NSString自动释放内存，本地化
+ (instancetype)localizedStringWithFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
//105.初始化C字符串并且指定编码，在这里需要手动释放内存（init）
- (instancetype)initWithCString:(constchar *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
//106.初始化C字符串并且指定编码，在这里需要自动释放内存
+ (instancetype)stringWithCString:(constchar *)cString encoding:(NSStringEncoding)enc;
//107.读取URL地址数据转化为字符串并且指定编码，在这里init创建需要手动释放内存，已经知道编码
- (instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
//108.读取FILE地址数据转化为字符串并且指定编码，同样需要手动释放内存，已经知道编码
- (instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;
//109.读取URL地址数据转化为字符串并且指定编码，，这里会自动释放内存，已经知道编码
+ (instancetype)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
//110.读取FILE地址数据转化为字符串并且指定编码，这里也会自定释放内存，已经知道编码
+ (instancetype)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;
//111.读取URL地址数据转化为字符串并且指定编码，在这里init创建需要手动释放内存，不知道编码
- (instancetype)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
//112. 读取FILE地址数据转化为字符串并且指定编码，同样需要手动释放内存，不知道编码
- (instancetype)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
//113.取URL地址数据转化为字符串并且指定编码，，这里会自动释放内存，不知道编码
+ (instancetype)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
//114.读取FILE地址数据转化为字符串并且指定编码，这里也会自定释放内存，不知道编码
+ (instancetype)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError **)error;
//115.将数据写入URL并且指定编码
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
//116.将数据写入文件并且指定编码
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
@end

@interface NSMutableString :NSString
//117.使用aString替换前面字符串的指定区域字符
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)aString;
@end
//118.可变字符串的扩展方法
@interface NSMutableString (NSMutableStringExtensionMethods)
//119.插入字符串aString，在指定的loc位置
- (void)insertString:(NSString *)aString atIndex:(NSUInteger)loc;
//120.删除指定区域段的字符串
- (void)deleteCharactersInRange:(NSRange)range;
//121.追加字符串aString
- (void)appendString:(NSString *)aString;
//122.追加多个字符串
- (void)appendFormat:(NSString *)format, ...NS_FORMAT_FUNCTION(1,2);
//123.设置新的aString
- (void)setString:(NSString *)aString;
//124.初始化一个容量为capacity大小的字符串，并且需要手动释放内存
- (NSMutableString *)initWithCapacity:(NSUInteger)capacity;
//125.初始化一个容量为capacity大小的字符串，但是不用手动释放内存，这些提前指定的容量，知识用于内存优化，实际大小可以大于设置的容量capacity
+ (NSMutableString *)stringWithCapacity:(NSUInteger)capacity;
//126.指定限制条件，指定区段中的replacement替换成target
- (NSUInteger)replaceOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:
(NSStringCompareOptions)options range:(NSRange)searchRange;

@end
//128.关于字符串编码检测的扩展
@interface NSString (NSStringEncodingDetection)
//129.对一份data数据进行转换为字符串，有可选option字典，另外还有是否允许有损失，最终转换之后返回一个编码种类。下面是7种不同option字典选项
+ (NSStringEncoding)stringEncodingForData:(NSData *)data
                          encodingOptions:(NSDictionary *)opts
                          convertedString:(NSString **)string
                      usedLossyConversion:(BOOL *)usedLossyConversion NS_AVAILABLE(10_10, 8_0);
@end

FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionSuggestedEncodingsKeyNS_AVAILABLE(10_10,8_0);

// NSArray of NSNumbers which contain NSStringEncoding values; if this key is not present in the dictionary, all encodings are considered
FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionDisallowedEncodingsKeyNS_AVAILABLE(10_10,8_0);

// NSNumber boolean value; if this key is not present in the dictionary, the default value is NO
FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionUseOnlySuggestedEncodingsKeyNS_AVAILABLE(10_10,8_0);

// NSNumber boolean value; if this key is not present in the dictionary, the default value is YES
FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionAllowLossyKeyNS_AVAILABLE(10_10,8_0);

// NSNumber boolean value; if this key is not present in the dictionary, the default value is NO
FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionFromWindowsKeyNS_AVAILABLE(10_10,8_0);


FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionLossySubstitutionKeyNS_AVAILABLE(10_10,8_0);


FOUNDATION_EXPORTNSString *const NSStringEncodingDetectionLikelyLanguageKeyNS_AVAILABLE(10_10,8_0);

@interface NSString (NSExtendedStringPropertyListParsing)
//130.将字符串转化为属性列表
例如：NSString * stringA = [NSString stringWithFormat:@“Name =xulin ;
age = 23;”];
NSLog(@“%@”,[stringA  propertyList]);
控制台输出为{
Name = xulin ;
age = 23;
}
- (id)propertyList;
//131.字符串转化为字典
NSDictionary * dictionary  = [stringA propertyListFromStringFileFormat];
NSLog(@“%@”,dictionary);
控制台输出为{
Name = xulin ;
age = 23;
}
- (NSDictionary *)propertyListFromStringsFileFormat

@end


//132.下面是一些弃用代码。也就是上面所翻译过的代码。
@interface NSString (NSStringDeprecated)
- (constchar *)cStringNS_RETURNS_INNER_POINTERNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (constchar *)lossyCStringNS_RETURNS_INNER_POINTER NS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (NSUInteger)cStringLengthNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (void)getCString:(char *)bytesNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLengthNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength range:(NSRange)aRange remainingRange:(NSRangePointer)leftoverRange NS_DEPRECATED(10_0, 10_4, 2_0, 2_0);

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFileNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomicallyNS_DEPRECATED(10_0,10_4,2_0, 2_0);

- (id)initWithContentsOfFile:(NSString *)pathNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (id)initWithContentsOfURL:(NSURL *)urlNS_DEPRECATED(10_0,10_4,2_0, 2_0);
+ (id)stringWithContentsOfFile:(NSString *)pathNS_DEPRECATED(10_0,10_4,2_0, 2_0);
+ (id)stringWithContentsOfURL:(NSURL *)urlNS_DEPRECATED(10_0,10_4,2_0, 2_0);

- (id)initWithCStringNoCopy:(char *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)freeBufferNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (id)initWithCString:(constchar *)bytes length:(NSUInteger)lengthNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (id)initWithCString:(constchar *)bytesNS_DEPRECATED(10_0,10_4,2_0, 2_0);
+ (id)stringWithCString:(constchar *)bytes length:(NSUInteger)lengthNS_DEPRECATED(10_0,10_4,2_0, 2_0);
+ (id)stringWithCString:(constchar *)bytesNS_DEPRECATED(10_0,10_4,2_0, 2_0);
- (void)getCharacters:(unichar *)buffer;
@end

enum {
    NSProprietaryStringEncoding =65536   /* Installation-specific encoding */
};

#if !defined(_OBJC_UNICHAR_H_)
#define _OBJC_UNICHAR_H_
#endif
#define NS_UNICHAR_IS_EIGHT_BIT 0

@interface NSSimpleCString :NSString {
@package
   char *bytes;
   int numBytes;
#if __LP64__
   int _unused;
#endif
}
@end

@interface NSConstantString :NSSimpleCString
@end

#if __LP64__
#else
externvoid *_NSConstantStringClassReference;
#endif
