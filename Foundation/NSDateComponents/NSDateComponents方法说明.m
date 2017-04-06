--常用方法：-set/get era/ year/ month/ date/ day/ hour/ minute/ second/ week/ weekday/ weekdayOrdinal/ quarter/ calendar/ timeZone/ weekOfMonth/ weekOfYear...
备注：An NSDateComponents object is meaningless in itself; you need to know what calendar it is interpreted against, and you need to know whether the values are absolute values of the units, or quantities of the units.
======================================
============NSDateFormatter============
--参考：https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSDateFormatter_Class/Reference/Reference.html
--简介：用于在nsdate和字符串显示之间转换；
--基本用法：Converting Objects ＋ Managing Attributes  ＋Managing  Styles;

NSDate* aDate = ...;
NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
fmt.dateStyle = kCFDateFormatterShortStyle;
fmt.timeStyle = kCFDateFormatterShortStyle;
fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
NSString* dateString = [fmt stringFromDate:aDate];
其中NSDateFormatterStyle样式为(dateStyle和timeStyle的值)：默认的locale

typedef CF_ENUM(CFIndex, CFDateFormatterStyle) {    // date and time format styles
    kCFDateFormatterNoStyle = 0,       // 无输出
    kCFDateFormatterShortStyle = 1,    // 10/29/12, 2:27 PM
    kCFDateFormatterMediumStyle = 2,   // Oct 29, 2012, 2:36:59 PM
    kCFDateFormatterLongStyle = 3,     // October 29, 2012, 2:38:46 PM GMT+08:00
    kCFDateFormatterFullStyle = 4      // Monday, October 29, 2012, 2:39:56 PM China Standard Time
};
--Managing Formats(自定义日期时间格式)：fmt.dateFormat = @"yyyy-MM-dd  HH:mm:ss";
G: 公元时代，例如AD公元
yy: 年的后2位
yyyy: 完整年
MM: 月，显示为1-12
MMM: 月，显示为英文月份简写,如 Jan
MMMM: 月，显示为英文月份全称，如 Janualy
dd: 日，2位数表示，如02
d: 日，1-2位显示，如 2
e: 1~7 (一周的第几天, 带0)
EEE: 简写星期几，如Sun
EEEE: 全写星期几，如Sunday
aa: 上下午，AM/PM
H: 时，24小时制，0-23
K：时，12小时制，0-11
m: 分，1-2位
mm: 分，2位
s: 秒，1-2位
ss: 秒，2位
S: 毫秒
Q/QQ: 1~4 (0 padded Quarter) 第几季度
QQQ: Q1/Q2/Q3/Q4 季度简写
QQQQ: 1st quarter/2nd quarter/3rd quarter/4th quarter 季度全拼
--Managing (AM/PM、Weekday、Month...) Symbols
