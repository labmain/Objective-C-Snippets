// 如果点击跳转,需要安装 KZLinkedConsole（https://github.com/Rdxer/custom-Log-） - 插件
#ifdef DEBUG

#define NSLog(format, ...)   {\
LXFPrintf("😐",format, ##__VA_ARGS__); \
}
// error
#define printE(format, ...)   {\
LXFPrintf("❌",format, ##__VA_ARGS__); \
}

// 下面可以打印彩色,但是需要安装 XcodeColors 插件
// #define NSLog(format, ...)   {\
// LXFPrintf("\033[" "fg0,0,255;" "😐",format "\033["";", ##__VA_ARGS__); \
// }

// debug
#define printD(format, ...)   {\
LXFPrintf("😬",format, ##__VA_ARGS__); \
}
// wran
#define printW(format, ...)   {\
LXFPrintf("⚠️",format, ##__VA_ARGS__); \
}
#define LXFPrintf(tag,format, ...)  printf("%s:%d %s%s + %d🎈 %s\n",[NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String,__LINE__,\
tag, __PRETTY_FUNCTION__, __LINE__,\
[[NSString stringWithFormat:format,\
##__VA_ARGS__]UTF8String])

#define assertx(condition, desc, ...) {\
if((condition) == NO){\
LXFPrintf("💔",@"断言失败 -> %@", desc);\
NSAssert(NO, desc, ##__VA_ARGS__);\
}\
}

#define assertx2(desc, ...)  assertx(NO,desc,##__VA_ARGS__)
#else

#define NSLog(format, ...)
// error
#define printE(format, ...)   {\
LXFPrintf("❌",format, ##__VA_ARGS__); \
}

// debug
#define printD(format, ...)

// wran
#define printW(format, ...)

#define LXFPrintf(tag,format, ...)  printf("%s:%d %s%s + %d🎈 %s\n",[NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String,__LINE__,\
tag, __PRETTY_FUNCTION__, __LINE__,\
[[NSString stringWithFormat:format,\
##__VA_ARGS__]UTF8String])

#define assertx(condition, desc, ...)

#define assertx2(desc, ...)

#endif