// C语法的写法：
// 定义整型值,但是不定义类型
enum {
  UITableViewCellStyleDefault,
  UITableViewCellStyleValue1,
  UITableViewCellStyleValue2,
  UITableViewCellStyleSubtitle
};

// 定义适合特性参数的 UITableViewCellStyle 类型。
/*
这种方法给出了 UITableViewCellStyle 确定的大小，但并没有告诉编译器这个类型和之前的 enum 有什么关系
*/
typedef enum {
  UITableViewCellStyleDefault,
  UITableViewCellStyleValue1,
  UITableViewCellStyleValue2,
  UITableViewCellStyleSubtitle
} UITableViewCellStyle;

/********** 建议OC下使用下面两种枚举定义放手  **********/

//NS_ENUM，定义状态等普通枚举
/*
NS_ENUM 的第一个参数是用于存储的新类型的类型。在64位环境下，UITableViewCellStyle 和 NSInteger 一样有8bytes长。你要保证你给出的所有值能被该类型容纳，否则就会产生错误。第二个参数是新类型的名字。大括号里面和以前一样，是你要定义的各种值
*/
typedef NS_ENUM(NSUInteger, TTGState) {
    TTGStateOK = 0,
    TTGStateError,
    TTGStateUnknow
};

//NS_OPTIONS，定义选项 ，位运算枚举
typedef NS_OPTIONS(NSUInteger, TTGDirection) {
    TTGDirectionNone = 0,
    TTGDirectionTop = 1 << 0,
    TTGDirectionLeft = 1 << 1,
    TTGDirectionRight = 1 << 2,
    TTGDirectionBottom = 1 << 3
};
