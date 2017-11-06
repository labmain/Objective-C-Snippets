### Block的定义:

* Block的格式:
` ^ + 返回值类型(可以省略) + (参数)(如果没有参数,可以省略) + {表达式}`
* Block变量格式: 返回值类型
`(不可省略, 最少void) + (^变量名称) + (参数) (不可省略, 至少())`
格式和函数指针很相似,只是把`*`改成了`^`.

```objc
int (^blockName)(int, NSString*)=^(int para1, NSString *para2){
   return 1;
};
//int (^blockName)(int, NSString*)的意思是要定义一个名字为"blockName"的block,它据有两个参数,具有一个int类型返回值.

void (^blockName)()=^{
};//如果没有参数,可省略如上面写法, 如果没有返回值, 必须要写void
```
### 使用typedef: (Block声明比较复杂, 建议使用这种方式生命Block)

```objc
typedef int(^blockName1)(int,NSString*);
blockName1 bn=^(int para1, NSString * para2){
   return 1;
};
```

### 无参数情况:
```objc
typedef int(^blockName1)();
blockName1 bn=^{
   return 1;
};
```
### 作为函数参数写法:

#### c函数:
参数

```objc
typedef int(^ABlock)();
void cFunc(void(^blockName)(), ABlock block){//两种写法都可以
}
```

返回值写法

```objc
int (^fun())(int){
   return ^(int cout){ return cout;};
}
ABlock fun(){
   return ^(int cout){ return cout;};
}
```

#### OC函数

参数
```objc
-(void)OCFunc:(void(^)())blockName andOtherBlock:(ABlock)block{  
    //注意第一种写法的特别之处, OC函数要求变量类型和形参名分开, 所以写法和C不同
}
```

### @property 写法

```objc
@property(nonatomic,copy) int (^block)(int a); //使用c的方式, 不能使用OC函数形参的写法.
@property (nonatomic,copy) Block blockName;
```

### 以Block作为方法返回值的写法:
```objc
-(int (^)(int))blockBack{     //和c的写法是不同的, 需要注意
   return ^(int cout){ return cout;};
}
```
