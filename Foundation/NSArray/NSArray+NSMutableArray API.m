//1.返回数组指定下标的元素
- (id)objectAtIndex:(NSUInteger)index;
//2.初始化数组
- (instancetype)initNS_DESIGNATED_INITIALIZER;
//3. 初始化数组并且赋初值以及大小
- (instancetype)initWithObjects:(constid [])objects count:(NSUInteger)cntNS_DESIGNATED_INITIALIZER;
//4.
- (instancetype)initWithCoder:(NSCoder *)aDecoderNS_DESIGNATED_INITIALIZER;
@end
@interface NSArray (NSExtendedArray)
//5.追加对象
- (NSArray *)arrayByAddingObject:(id)anObject;
//6.追加其他数组返回新的数组
- (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray;
//7.分割数组为字符串
- (NSString *)componentsJoinedByString:(NSString *)separator;
//8.判断数组是否存在指定元素
- (BOOL)containsObject:(id)anObject;
//9.格式化属性列表
@property (readonly,copy)NSString *description;
//10.本地格式化为一个属性列表
- (NSString *)descriptionWithLocale:(id)locale;
//11.本地格式化为一个属性列表，并且可以设置缩进
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
//12.取出array对象跟demo对象第一个交集元素
- (id)firstObjectCommonWithArray:(NSArray *)otherArray;
//13.返回指定区域的对象
- (void)getObjects:(id__unsafe_unretained [])objects range:(NSRange)range;
//14.获取指定元素的索引
- (NSUInteger)indexOfObject:(id)anObject;
//15.指定区域获取元素的索引
- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
//16.获取指定元素的索引
- (NSUInteger)indexOfObjectIdenticalTo:(id)anObject;
//17.指定区域获取元素的索引
- (NSUInteger):(id)anObject inRange:(NSRange)range;
//18.判断两个数组对象是否相等
- (BOOL)isEqualToArray:(NSArray *)otherArray;
//19.第一个对象属性
@property (nonatomic,readonly)id firstObjectNS_AVAILABLE(10_6,4_0);
//20.最后一个对象元素属性
@property (nonatomic,readonly)id lastObject;
//21.返回一个枚举对象
- (NSEnumerator *)objectEnumerator;
//22.返回一个翻转的枚举对象
- (NSEnumerator *)reverseObjectEnumerator;
//23.升序排序数组元素
@property (readonly,copy)NSData *sortedArrayHint;
//24.调用指定方法排序数组元素
- (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id,id,void *))comparator context:(void *)context;
//25.调用指定方法排序数组元素
- (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id,id,void *))comparator context:(void *)context hint:(NSData *)hint;
//26.指定比较方法排序数组元素
- (NSArray *)sortedArrayUsingSelector:(SEL)comparator;
//27.返回指定区域的数组元素组成新的数组元素
- (NSArray *)subarrayWithRange:(NSRange)range;
//28.保存数组对象到指定文件
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
//29.保存数组对象到指定URL
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;
//30.每个数组元素都调用指定方法
- (void)makeObjectsPerformSelector:(SEL)aSelector;
//31.每个数组元素都调用指定方法
- (void)makeObjectsPerformSelector:(SEL)aSelector withObject:(id)argument;
//33.指定索引集合返回新数组
- (NSArray *)objectsAtIndexes:(NSIndexSet *)indexes;
//34.返回指定元素数组元素
- (id)objectAtIndexedSubscript:(NSUInteger)idxNS_AVAILABLE(10_8,6_0);

//35.数组中的每个元素都执行代码快中方法遍历
- (void)enumerateObjectsUsingBlock:(void (^)(id obj,NSUInteger idx, BOOL *stop))blockNS_AVAILABLE(10_6,4_0);
//36.指定块使数组每个元素都执行代码块中的代码
- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj, NSUInteger idx,BOOL *stop))blockNS_AVAILABLE(10_6,4_0);
//37.遍历数组每个元素执行代码块中的方法
- (void)enumerateObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts usingBlock:(void (^)(id obj,NSUInteger idx,BOOL *stop))blockNS_AVAILABLE(10_6,4_0);
// 上面的描述可能不是很清晰，此api是根据NSIndexSet指定索引条件并且还有一个枚举条件，由这两个条件来共同拿到数组中的相应元素对象，从而执行执行给定块.执行我们想要的操作。
//38.根据条件来获取一个NSUIndex对象，主要是根据条件进行数据遍历使用
- (NSUInteger)indexOfObjectPassingTest:(BOOL (^)(id obj,NSUInteger idx, BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//例如
      NSArray *array = [NSArrayarrayWithObjects:@"wendy",@"andy",@"tom",@"test",nil];
    NSInteger index = [arrayindexOfObjectPassingTest:^BOOL (id tr,NSUInteger index,BOOL *te){
       NSString *s = (NSString *)tr;
       if([@"wendy"isEqualToString:s])
        {
           returnYES;
        }
       returnNO;
    }];
   NSLog(@"index==%ld=.",(long)index);
//打印:
// 2015-06-09 15:44:01.982 NSArray[5064:145993] index==0=.
// 这个解释可能也不是很详细这个再详细解释一下，这个api的作用是得到数组中某个指定对象的下标，过程是遍历外层的这个array对象，并且每次都执行block，我们可以在block中做一些判断操作，如果当前的遍历对象是我们想要的就返回yes，这样函数就结束当前遍历，并且返回当前对象在数组中的下标。
//39.同上面的方法相同，区别在于，这里添加了一个参数，用来表示遍历是从前向后遍历还是从后向前遍历
- (NSUInteger)indexOfObjectWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (^)(id obj, NSUInteger idx,BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//40.这个添加了参数NSIntexSet参数，用来获取子数组，然后使用子数组进行遍历，处理数据
- (NSUInteger)indexOfObjectAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(BOOL (^)(id obj,NSUInteger idx,BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//41.根据block的处理获取一个NSIndexSet对象
- (NSIndexSet *)indexesOfObjectsPassingTest:(BOOL (^)(id obj,NSUInteger idx, BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//例如:
   NSIndexSet *index = [arrayindexesOfObjectsPassingTest: ^BOOL (id tr,NSUInteger index,BOOL *te){

       NSString *s = (NSString *)tr;
       if([sisEqualToString:@"andy"]){
           returnYES;
        }
       returnNO;
    }];
   NSLog(@"%@",index);
//打印:
// 2015-06-09 15:50:40.946 NSArray[5128:150086] <NSIndexSet: 0x7fb542515710>[number of indexes: 1 (in 1 ranges), indexes: (1)]
//42.这个方法添加了参数，用来表示是从前向后遍历还是从后向前遍历
- (NSIndexSet *)indexesOfObjectsWithOptions:(NSEnumerationOptions)opts passingTest:(BOOL (^)(id obj, NSUInteger idx,BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//例如:
 NSIndexSet * index = [arrayindexesOfObjectsWithOptions:NSEnumerationReversepassingTest: ^ BOOL (id tr,NSUInteger index,BOOL *te){

       NSString *s = (NSString *)tr;
       if([sisEqualToString:@"andy"]){
           returnYES;
        }
       returnNO;
    }];
   NSLog(@"%@",index);
//打印:
// 2015-06-09 16:18:53.974 NSArray[5283:158602] <NSIndexSet: 0x7fa540ca6bb0>[number of indexes: 1 (in 1 ranges), indexes: (1)]
//43.添加参数NSIndexSet用来获取子数组，使用子数组进行遍历
- (NSIndexSet *)indexesOfObjectsAtIndexes:(NSIndexSet *)s options:(NSEnumerationOptions)opts passingTest:(BOOL (^)(id obj,NSUInteger idx,BOOL *stop))predicateNS_AVAILABLE(10_6,4_0);
//44.对数组进行排序操作，参数cmptr是一个block函数块，返回的数据类型是一个NSComparisonResult对象
- (NSArray *)sortedArrayUsingComparator:(NSComparator)cmptrNS_AVAILABLE(10_6,4_0);
//45.进行排序操作，NSSortOptions排序的参数用来表示是同时排序，还是稳定排序
- (NSArray *)sortedArrayWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptrNS_AVAILABLE(10_6,4_0);
//例如
    NSArray *test = [arraysortedArrayWithOptions:NSSortStableusingComparator:^NSComparisonResult (NSString *s,NSString *s2){
       if(s.length < s2.length){
            returnNSOrderedAscending;
        }
       if(s.length > s2.length){
            returnNSOrderedDescending;
        }
        returnNSOrderedSame;
    }];
   NSLog(@"%@",test);
//例如
// 2015-06-09 16:24:34.498 NSArray[5332:161773] (
//     tom,
//     andy,
//     test,
//     wendy
// )
//
// typedefNS_OPTIONS(NSUInteger, NSBinarySearchingOptions) {
// NSBinarySearchingFirstEqual = (1UL <<8),
// NSBinarySearchingLastEqual = (1UL <<9),
// NSBinarySearchingInsertionIndex = (1UL <<10),
// };
//46.指定区域返回通过代码块方法的索引
- (NSUInteger)indexOfObject:(id)obj inSortedRange:(NSRange)r options:(NSBinarySearchingOptions)opts usingComparator:(NSComparator)cmp NS_AVAILABLE(10_6, 4_0); // binary search
@end

@interface NSArray (NSArrayCreation)
//47.快速创建一个空数组
+ (instancetype)array;
//48.指定一个元素创建数组对象
+ (instancetype)arrayWithObject:(id)anObject;
//49.指定个数从一个数组对象创建新的数组对象
+ (instancetype)arrayWithObjects:(constid [])objects count:(NSUInteger)cnt;
//50.指定多个元素创建数组对象
+ (instancetype)arrayWithObjects:(id)firstObj, ...NS_REQUIRES_NIL_TERMINATION;
//51.生成新的另外一个数组
+ (instancetype)arrayWithArray:(NSArray *)array;
//52.指定个数从一个数组对象创建新的数组对象
- (instancetype)initWithObjects:(id)firstObj, ...NS_REQUIRES_NIL_TERMINATION;
//53.从已有数组初始化
- (instancetype)initWithArray:(NSArray *)array;
//54.从已有数组初始化（标示作用，潜复制，还是深复制）
- (instancetype)initWithArray:(NSArray *)array copyItems:(BOOL)flag;
//55.从文件加载数组元素
+ (NSArray *)arrayWithContentsOfFile:(NSString *)path;
//56.从URL网络地址加载数组元素
+ (NSArray *)arrayWithContentsOfURL:(NSURL *)url;
//57.从文件加载数据
- (NSArray *)initWithContentsOfFile:(NSString *)path;
//58.从文件加载数据
- (NSArray *)initWithContentsOfURL:(NSURL *)url;
@end
/**************** Mutable Array****************/
@interface NSMutableArray :NSArray
//59.添加对象
- (void)addObject:(id)anObject;
//60.指定索引位置插入对象
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
//61.移除最后一个对象
- (void)removeLastObject;
//62.移除指定索引位置对象
- (void)removeObjectAtIndex:(NSUInteger)index;
//63.替换指定索引位置对象
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;
//64.初始化数组
- (instancetype)initNS_DESIGNATED_INITIALIZER;
//65.初始化数组并且指定大小
- (instancetype)initWithCapacity:(NSUInteger)numItemsNS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoderNS_DESIGNATED_INITIALIZER;
@end

@interface NSMutableArray (NSExtendedMutableArray)
//66.追加新数组A到指定数组B后面
- (void)addObjectsFromArray:(NSArray *)otherArray;
//67.交换指定索引之间的对象
- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;
//68.移除所有的数组数据
- (void)removeAllObjects;
//69.移除知道那个区域指定对象
- (void)removeObject:(id)anObject inRange:(NSRange)range;
//70.移除指定对象
- (void)removeObject:(id)anObject;
//71.移除指定区域指定对象
- (void)removeObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
//72.移除指定对象
- (void)removeObjectIdenticalTo:(id)anObject;
//73.移除指定索引之间的对象
- (void)removeObjectsFromIndices:(NSUInteger *)indices numIndices:(NSUInteger)cntNS_DEPRECATED(10_0,10_6,2_0,4_0);
//74.移除数组A包含的指定数组B的元素
- (void)removeObjectsInArray:(NSArray *)otherArray;
//75.移除指定区域所有对象
- (void)removeObjectsInRange:(NSRange)range;
//76.指定数组B的指定区域的元素替换为数组A指定区域元素
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray range:(NSRange)otherRange;
//77.指定数组B替换数组A指定区域的元素
- (void)replaceObjectsInRange:(NSRange)range withObjectsFromArray:(NSArray *)otherArray;
//78.追加数组A到数组B
- (void)setArray:(NSArray *)otherArray;
// 这个api的作用是将新的参数数组内容替换掉旧数组的内容

//79.指定方法升序比较
- (void)sortUsingFunction:(NSInteger (*)(id,id,void *))compare context:(void *)context;
//80.指定方法升序比较
- (void)sortUsingSelector:(SEL)comparator;
//81.指定索引集合插入数组元素
- (void)insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;
//82.移除指定索引集合元素
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;
//83.替换指定索引集合的数组元素
- (void)replaceObjectsAtIndexes:(NSIndexSet *)indexes withObjects:(NSArray *)objects;
//84.指定索引替换新的数组元素
- (void)setObject:(id)obj atIndexedSubscript:(NSUInteger)idxNS_AVAILABLE(10_8,6_0);
//85.指定块方法排序数组元素
- (void)sortUsingComparator:(NSComparator)cmptrNS_AVAILABLE(10_6,4_0);
//86.指定块比较数组
- (void)sortWithOptions:(NSSortOptions)opts usingComparator:(NSComparator)cmptrNS_AVAILABLE(10_6,4_0);
@end

@interface NSMutableArray (NSMutableArrayCreation)
//87.初始化数组并指定对象容量
+ (instancetype)arrayWithCapacity:(NSUInteger)numItems;
//88.指定路径文件加载数据
+ (NSMutableArray *)arrayWithContentsOfFile:(NSString *)path;
//89.指定URL加载数据
+ (NSMutableArray *)arrayWithContentsOfURL:(NSURL *)url;
//90.指定路径文件加载数据
- (NSMutableArray *)initWithContentsOfFile:(NSString *)path;
//91.指定URL加载数据
- (NSMutableArray *)initWithContentsOfURL:(NSURL *)url;
@end
