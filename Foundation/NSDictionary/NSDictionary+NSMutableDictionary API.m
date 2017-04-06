@interface NSDictionary
@property (readonly) NSUInteger count;
//1.利用指定的key寻找对应的value
- (id)objectForKey:(id)aKey;
//2. keyEnumerator得到一个字典的所有键值
- (NSEnumerator *)keyEnumerator;
//3.初始化字典
- (instancetype)initNS_DESIGNATED_INITIALIZER;
//4.条件编译根据不同情况来初始化字典
#if TARGET_OS_WIN32
- (instancetype)initWithObjects:(constid [])objects forKeys:(constid [])keys count:(NSUInteger)cnt;
#else
- (instancetype)initWithObjects:(constid [])objects forKeys:(constid <NSCopying> [])keys count:(NSUInteger)cntNS_DESIGNATED_INITIALIZER;
#endif
- (instancetype)initWithCoder:(NSCoder *)aDecoderNS_DESIGNATED_INITIALIZER;
@end
@interface NSDictionary (NSExtendedDictionary)
//5.数组所有key属性
@property (readonly,copy) NSArray *allKeys;
//6.根据所填入的object返回对应所有的key键值
- (NSArray *)allKeysForObject:(id)anObject;

//7.属性 字典所有value
@property (readonly,copy) NSArray *allValues;
//8.属性 字符串描述
@property (readonly,copy) NSString *description;
//9.属性 字符串描述文件格式
@property (readonly,copy) NSString *descriptionInStringsFileFormat;
//10.根据设置的locale进行连接数组
- (NSString *)descriptionWithLocale:(id)locale;
//11.根据设置的locale进行连接数组
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
//12.判断字典是否相等
- (BOOL)isEqualToDictionary:(NSDictionary *)otherDictionary;
//13.得到一个字典的所有values
- (NSEnumerator *)objectEnumerator;
//14.字典将某个特定的数组作为key值传进去得到对应的value，如果某个key找不到对应的key，就用notFoundMarker提前设定的值代替
- (NSArray *)objectsForKeys:(NSArray *)keys notFoundMarker:(id)marker;
    //NSDictionary *dic=[NSDictionarydictionaryWithObjectsAndKeys:@"K1",@"V1",@"K2",@"V2",@"K3",@"V3",nil];
    //NSArray *arr1=[NSArrayarrayWithObjects:@"V1",@"V2",@"VG",nil];
    //NSArray *ARR= [dicobjectsForKeys:arr1 notFoundMarker:@"BB"];
    //NSLog(@"测试测试%@",ARR);
    //打印：
    //2015-06-08 11:30:54.139 NSDictionary[1624:64989]测试测试(
   //K1,
   //BB,
   //BB
    //)
//15.将字典写进特定的路径path
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;// the atomically flag is ignored if url of a type that cannot be written atomically.

//16.字典按照value的大小顺序来对keys键值进行排序（通过value排序，返回key集合）
- (NSArray *)keysSortedByValueUsingSelector:(SEL)comparator;
//NSDictionary *dic1=[NSDictionarydictionaryWithObjectsAndKeys:@"4",@"A",@"6",@"C",@"5",@"B",nil];
    //NSArray *arr2= [dic1keysSortedByValueUsingSelector:@selector(compare:)];
    //NSLog(@"奇葩奇葩%@",arr2);
//2015-06-08 14:41:59.152 NSDictionary[2749:117502]奇葩奇葩(
   //A,
   //B,
   //C
//)
//17.
- (void)getObjects:(id__unsafe_unretained [])objects andKeys:(id__unsafe_unretained [])keys;
//18.
- (id)objectForKeyedSubscript:(id)keyNS_AVAILABLE(10_8,6_0);

//19.利用block对字典进行遍历
- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(id key,id obj, BOOL *stop))blockNS_AVAILABLE(10_6,4_0);
//例子:
    NSDictionary *dic = [NSDictionarydictionaryWithObjects:@[@"1",@"2",@"3"]forKeys:@[@"one",@"two",@"three"]];
   NSString *stopKey = @"two";
   __block BOOL stopEarly =NO;
    [dicenumerateKeysAndObjectsUsingBlock:^(id key,id obj, BOOL *stop) {
       NSLog(@"%@,%@",key,obj);
        //访问对象类型变量
       if ([key isEqualToString:stopKey]) {
            *stop =YES;
            //访问__block表识的局部类型变量
            stopEarly =YES;
           //直接访问属性
            NSLog(@"self.name = tom");
            ;
        }
    }];
//输出:
2015-06-08 15:19:09.608 NSDictionary[3035:136164] one,1
2015-06-08 15:19:09.609 NSDictionary[3035:136164] two,2
2015-06-08 15:19:09.609 NSDictionary[3035:136164] self.name = tom

//20.同上一样利用block对字典进行遍历，不过加了排序的顺序选项options正反序
- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id key, id obj,BOOL *stop))block NS_AVAILABLE(10_6, 4_0);

//21.和第16一样都是利用value对keys进行排序，只不过这个加上了一个可设定的NSComparato参数条件来比较
- (NSArray *)keysSortedByValueUsingComparator:(NSComparator)cmptrNS_AVAILABLE(10_6,4_0);
//例子
   NSArray *sortedKeys = [dic keysSortedByValueUsingComparator:^NSComparisonResult(id obj1,id obj2) {
       if ([obj1 integerValue] > [obj2integerValue]) {
            return (NSComparisonResult)NSOrderedAscending;
        }
       if ([obj1 integerValue] < [obj2integerValue]) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];
    NSLog(@"利用keysSortedByValueUsingComparator进行排序%@",sortedKeys);
//输出:
2015-06-08 16:07:12.361 NSDictionary[3420:160942]利用keysSortedByValueUsingComparator进行排序(
    one,
    three,
    two
)
//22.通过values对字典的keys进行排序，可以有排序的选择，还可添加设定的NSComparato参数条件来比较
- (NSArray *)keysSortedByValueWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptrNS_AVAILABLE(10_6,4_0);
//23.这是一个很好的对字典进行过滤的方法,返回keys的集合，这些keys符合参数block的约束，在block内部在特定的条件下返回yes，返回的这个集合会保留当前遍历到那个字典对象的信息
- (NSSet *)keysOfEntriesPassingTest:(BOOL (^)(id key,id obj, BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//例子:
NSDictionary * numsDic =@{@(2):@"second",@(4):@"first",@(1):@"thrid"};
   NSSet * filteredKeys = [numsDic keysOfEntriesPassingTest:^BOOL(id key,id obj, BOOL *stop) {
       BOOL result = NO;
       NSNumber * numKey = key;
       if (numKey.integerValue >2) {
            result =YES;
        }
       return YES;
    }];
    NSLog(@"filteredKeys.description----%@",filteredKeys.description);
//打印:
2015-06-08 17:34:37.741 NSDictionary[4085:193311] filteredKeys.description----{(
    4
)}

//23.用法同上，增加了一个列举的选项选择
- (NSSet *)keysOfEntriesWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (^)(id key, id obj,BOOL *stop))predicate NS_AVAILABLE(10_6, 4_0);
@end

@interface NSDictionary (NSDictionaryCreation)
//24.快速创建一个空字典
+ (instancetype)dictionary;
//25.快速创建字典并且赋初值
+ (instancetype)dictionaryWithObject:(id)object forKey:(id <NSCopying>)key;
//26.条件编译 不同情况创建字典的几种方法
#if TARGET_OS_WIN32
+ (instancetype)dictionaryWithObjects:(constid [])objects forKeys:(constid [])keys count:(NSUInteger)cnt;
#else
+ (instancetype)dictionaryWithObjects:(constid [])objects forKeys:(constid <NSCopying> [])keys count:(NSUInteger)cnt;
#endif
+ (instancetype)dictionaryWithObjectsAndKeys:(id)firstObject, ...NS_REQUIRES_NIL_TERMINATION;
//27.创建新字典 赋值一个字典
+ (instancetype)dictionaryWithDictionary:(NSDictionary *)dict;
//28.创建字典，通过数组赋值values和keys
+ (instancetype)dictionaryWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;
//29.使用指定的以nil为结尾的对象与键对列表初始化列表
- (instancetype)initWithObjectsAndKeys:(id)firstObject, ...NS_REQUIRES_NIL_TERMINATION;
//30.使用另一个字典初始化字典
- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary;
//31.使用另一个字典初始化字典，还可以为每个对象创建新的副本
- (instancetype)initWithDictionary:(NSDictionary *)otherDictionary copyItems:(BOOL)flag;
//32.使用指定的对象与键初始化字典
- (instancetype)initWithObjects:(NSArray *)objects forKeys:(NSArray *)keys;
//33.使用本地文件的内容初始化字典
+ (NSDictionary *)dictionaryWithContentsOfFile:(NSString *)path;
//34.使用URL的内容初始化字典
+ (NSDictionary *)dictionaryWithContentsOfURL:(NSURL *)url;
//35.使用本地文件的内容初始化字典
- (NSDictionary *)initWithContentsOfFile:(NSString *)path;
//36.使用URL的内容初始化字典
- (NSDictionary *)initWithContentsOfURL:(NSURL *)url;
@end

/**************** Mutable Dictionary****************/
@interface NSMutableDictionary :NSDictionary
//37.根据对应的key删除对应的value以及自身的key，
- (void)removeObjectForKey:(id)aKey;
//38.在可变字典中，改变对应的key的value
- (void)setObject:(id)anObject forKey:(id <NSCopying>)aKey;
//39.创建字典初始化
- (instancetype)initNS_DESIGNATED_INITIALIZER;
//40.初始化字典并且指定大小
- (instancetype)initWithCapacity:(NSUInteger)numItemsNS_DESIGNATED_INITIALIZER;
//41.序列化对象
- (instancetype)initWithCoder:(NSCoder *)aDecoderNS_DESIGNATED_INITIALIZER;
@end

@interface NSMutableDictionary (NSExtendedMutableDictionary)
//42.一个字典整体拼接另一个字典的方法
- (void)addEntriesFromDictionary:(NSDictionary *)otherDictionary;
//43.删除字典所有的数据
- (void)removeAllObjects;
//44.根据指定的数据keys删除对应的values
- (void)removeObjectsForKeys:(NSArray *)keyArray;
//45.给可变字典添加一组新字典
- (void)setDictionary:(NSDictionary *)otherDictionary;
//46.以数组下标的形式来访问相应键的值
- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)keyNS_AVAILABLE(10_8,6_0);
@end

@interface NSMutableDictionary (NSMutableDictionaryCreation)
//47.快速创建可变字典并且初始化大小
+ (instancetype)dictionaryWithCapacity:(NSUInteger)numItems;
//48.快速创建可变字典通过指定的文件路径
+ (NSMutableDictionary *)dictionaryWithContentsOfFile:(NSString *)path;
//49.快速创建可变字典通过URL
+ (NSMutableDictionary *)dictionaryWithContentsOfURL:(NSURL *)url;
//50.使用本地文件的内容创建可变字典
- (NSMutableDictionary *)initWithContentsOfFile:(NSString *)path;
//51.使用URL的内容创建可变字典
- (NSMutableDictionary *)initWithContentsOfURL:(NSURL *)url;
@end

@interface NSDictionary (NSSharedKeySetDictionary)
//52.用来创建预订好的key集合，返回的值作为NSMutableDictionary的dictionaryWithSharesKeySet参数传入，可以重用key，从而节约copy操作，节省内存。
+ (id)sharedKeySetForKeys:(NSArray *)keysNS_AVAILABLE(10_8,6_0);
@end

@interface NSMutableDictionary (NSSharedKeySetDictionary)
//53.创建字典，共享键集会复用对象
+ (NSMutableDictionary *)dictionaryWithSharedKeySet:(id)keysetNS_AVAILABLE(10_8,6_0);
@end
