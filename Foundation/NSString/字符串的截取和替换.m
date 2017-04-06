1. 字符串的截取

- (NSString *)substringFromIndex:(NSUInteger)from;
从指定位置from开始(包括指定位置的字符)到尾部

- (NSString *)substringToIndex:(NSUInteger)to;
从字符串的开头一直截取到指定的位置to,但不包括该位置的字符

- (NSString *)substringWithRange:(NSRange)range;
按照所给出的NSRange从字符串中截取子串

2、字符串的替换

- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;

用法：用replacement替换target 
