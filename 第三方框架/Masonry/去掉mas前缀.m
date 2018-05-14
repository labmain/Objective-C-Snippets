#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBAL


在 import “Masonry.h”之前声明这两个宏即可


注意：
为了增加代码的可读性这里有两个简化代码的宏：
#define MAS_SHORTHAND和
#define MAS_SHORTHAND_GLOBALS
MAS_SHORTHAND：只要在导入Masonry主头文件之前定义这个宏, 那么以后在使用Masonry框架中的属性和方法的时候, 就可以省略mas_前缀
MAS_SHORTHAND_GLOBALS：只要在导入Masonry主头文件之前定义这个宏,那么就可以让equalTo函数接收基本数据类型, 内部会对基本数据类型进行包装
//注意：这两个宏如果想有效使用，必须要在添加Masonry头文件之前导入进去。在没有增加宏`MAS_SHORTHAND_GLOBALS时，下面这句是会报错的。