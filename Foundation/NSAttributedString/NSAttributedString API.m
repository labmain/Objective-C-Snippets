@interface NSAttributedString : NSObject <NSCopying, NSMutableCopying, NSCoding>

//把NSAttributedString转为字符串
- (NSString *)string;
//取到设置的属性字典
- (NSDictionary *)attributesAtIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
//例子:
/*
 [attrString addAttribute:NSForegroundColorAttributeName
                       value:[UIColor redColor]
                       range:NSMakeRange(0, 2)];

 NSRange range = NSMakeRange(0, 2);
  NSDictionary*dic = [attrString attributesAtIndex:0 effectiveRange:&range];
//取到设置的属性字典
dic:
{
    NSColor = "UIDeviceRGBColorSpace 1 0 0 1";
}
*/
@end

@interface NSAttributedString (NSExtendedAttributedString)

//长度
- (NSUInteger)length;
//取到设置的属性的值
- (id)attribute:(NSString *)attrName atIndex:(NSUInteger)location effectiveRange:(NSRangePointer)range;
//根据range截取
- (NSAttributedString *)attributedSubstringFromRange:(NSRange)range;

- (NSDictionary *)attributesAtIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;

- (id)attribute:(NSString *)attrName atIndex:(NSUInteger)location longestEffectiveRange:(NSRangePointer)range inRange:(NSRange)rangeLimit;
//判断两个string是否相同
- (BOOL)isEqualToAttributedString:(NSAttributedString *)other;

//初始化
- (id)initWithString:(NSString *)str;
- (id)initWithString:(NSString *)str attributes:(NSDictionary *)attrs;
- (id)initWithAttributedString:(NSAttributedString *)attrStr;

typedef NS_OPTIONS(NSUInteger, NSAttributedStringEnumerationOptions) {
  NSAttributedStringEnumerationReverse = (1UL << 1),
  NSAttributedStringEnumerationLongestEffectiveRangeNotRequired = (1UL << 20)
};

#if NS_BLOCKS_AVAILABLE
//遍历string
- (void)enumerateAttributesInRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (^)(NSDictionary *attrs, NSRange range, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);
- (void)enumerateAttribute:(NSString *)attrName inRange:(NSRange)enumerationRange options:(NSAttributedStringEnumerationOptions)opts usingBlock:(void (^)(id value, NSRange range, BOOL *stop))block NS_AVAILABLE(10_6, 4_0);
#endif

@end

NS_CLASS_AVAILABLE(10_0, 3_2)
@interface NSMutableAttributedString : NSAttributedString
//用str替换range内的AttributedString
- (void)replaceCharactersInRange:(NSRange)range withString:(NSString *)str;
- (void)setAttributes:(NSDictionary *)attrs range:(NSRange)range;

@end

@interface NSMutableAttributedString (NSExtendedMutableAttributedString)

- (NSMutableString *)mutableString;//初始化
//添加属性
- (void)addAttribute:(NSString *)name value:(id)value range:(NSRange)range;
- (void)addAttributes:(NSDictionary *)attrs range:(NSRange)range;
- (void)removeAttribute:(NSString *)name range:(NSRange)range;//删除属性
//替换
- (void)replaceCharactersInRange:(NSRange)range withAttributedString:(NSAttributedString *)attrString;
- (void)insertAttributedString:(NSAttributedString *)attrString atIndex:(NSUInteger)loc;//插入
- (void)appendAttributedString:(NSAttributedString *)attrString;//拼接string
- (void)deleteCharactersInRange:(NSRange)range;//删除
- (void)setAttributedString:(NSAttributedString *)attrString;//设置

- (void)beginEditing;//开始编辑
- (void)endEditing;//结束编辑

@end
