
#ifdef DEBUG

// 下面可以打印彩色,但是需要安装 XcodeColors 插件 https://github.com/robbiehanson/XcodeColors
#define NSLog(format, ...)   {\
LXFPrintf("\033[" "fg148,0,1;" "♦️",format "\033["";", ##__VA_ARGS__); \
}

// 如果点击跳转,需要安装 KZLinkedConsole（https://github.com/Rdxer/custom-Log-） - 插件
// 🎈不可替换,插件里用于正则匹配
#define LXFPrintf(tag,format, ...)  printf("%s:%d %s%s + %d🎈📢 \033[fg148,0,211;%s\033[;\n",[NSString stringWithUTF8String:__FILE__].lastPathComponent.UTF8String,__LINE__,\
tag, __PRETTY_FUNCTION__, __LINE__,\
[[NSString stringWithFormat:format,\
##__VA_ARGS__]UTF8String])

#endif