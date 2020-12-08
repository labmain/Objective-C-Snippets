```objc
@interface ProductModel : NSObject
@property (nonatomic, strong) NSString *name;//产品名称
@property (nonatomic, assign) CGFloat price;//产品价格
@end
```

## Simple Collection Operators 简单的集合操作符

`@count` 返回一个值为集合中对象总数的NSNumber对象;  
`@avg` 首先把集合中的每个对象都转换为double类型,然后计算其平均值,并返回这个平均值的NSNumber对象;  
`@max` 使用compare:方法来确定最大值,并返回最大值的  NSNumber对象.所以为了保证其正常比较,集合中所有的对象都必须支持和另一个对象的比较,保证其可比性;  
`@min` 原理和@max一样,其返回的是集合中的最小值的NSNumber对象;  
`@sum` 首先把集合中的每个对象都转换为double类型,然后计算其总和,并返回总和的NSNumber对象;

> Notice: 所有的集合操作,除了@count外,其他都需要有右边的keyPath(一般为属性名),@count右边的keyPath可写可不写.

```objc
NSArray *product = @[productA, productB, productC, productD];
NSNumber *count = [product valueForKeyPath:@"@count.price"];
NSNumber *avg = [product valueForKeyPath:@"@avg.price"];
NSNumber *max = [product valueForKeyPath:@"@max.price"];
NSNumber *min = [product valueForKeyPath:@"@min.price"];
NSNumber *sum = [product valueForKeyPath:@"@sum.price"];
NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum); 
// count:4, avg:199, max:299, min:99, sum:79

Notice:若操作对象(数组/集合)内的元素本身就是 NSNumber 对象,那么可以这样写.
NSArray *array = @[@(productA.price), @(productB.price), @(productC.price), @(productD.price)];
NSNumber *count = [array valueForKeyPath:@"@count"];
NSNumber *avg = [array valueForKeyPath:@"@avg.self"];
NSNumber *max = [array valueForKeyPath:@"@max.self"];
NSNumber *min = [array valueForKeyPath:@"@min.self"];
NSNumber *sum = [array valueForKeyPath:@"@sum.self"];
NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum);//coun

// 返回集合中所有的对象如果有相同的对象那么只返回一个。
NSArray*array =@[@"hahahah",@"heiheihei",@"heiheihei",@"123",@"321",@"123",@"hahahah",@"测试"];
NSArray*unique = [array valueForKeyPath:@"@distinctUnionOfObjects.self"];

// 可以使用. 来一层一层向下索引，当多个字典层级时，取子层级中的属性就非常简单了
NSDictionary *dict1 = @{@"dic1":@{@"dic2":@{@"name":@"lisi",@"info":@{@"age":@"12"}}}};
id res = [dict1 valueForKeyPath:@"dict1.dict2.name"];
// 最后可以输出：res = lisi


// 对NSDictionary数组快速找出相应key对的值
NSArray *array = @[@{@"name": @"cookeee",@"code": @1},
@{@"name": @"jim",@"code": @2},
@{@"name": @"jim",@"code": @1},
@{@"name": @"jbos",@"code": @1}];

NSLog(@"%@", [array valueForKeyPath:@"name"]);
(
cookeee,
jim,
jim,
jbos
```

## Object Operators 对象操作符

`@unionOfObjects`: 获取数组中每个对象的属性的值,放到一个数组中并返回,但不会去重;The @unionOfObjects operator provides similar behavior, but without removing duplicate objects.  
`@distinctUnionOfObjects`:获取数组中每个对象的属性的值,放到一个数组中并返回,会对数组去重.所以,通常这个对象操作符可以用来对数组元素的去重,快捷高效;The @distinctUnionOfArrays operator is similar, but removes duplicate objects.

```objc
NSArray *unionOfObjects = [product valueForKeyPath:@"@unionOfObjects.name"];
NSArray *distinctUnionOfObjects = [product valueForKeyPath:@"@distinctUnionOfObjects.name"];
NSLog(@"unionOfObjects : %@", unionOfObjects);//iPod,iMac,iPhone,iPhone
NSLog(@"distinctUnionOfObjects : %@", distinctUnionOfObjects);//iPhone,iPod,iMac
```

## Array and Set Operators 数组/集合操作符

`@distinctUnionOfArrays` 返回操作对象(数组)中的所有元素,即返回这个数组本身.会去重.  
`@unionOfArrays` 首先获取操作对象(数组)中的所有元素,然后装到一个新的数组中并返回,不会对这个数组去重.  
```objc
NSArray *distinctUnionOfArrays = [@[product, product] valueForKeyPath:@"@distinctUnionOfArrays.price"];
NSArray *unionOfArrays = [@[product, product] valueForKeyPath:@"@unionOfArrays.price"];
NSLog(@"distinctUnionOfArrays : %@", distinctUnionOfArrays);//299,99,199
NSLog(@"unionOfArrays : %@", unionOfArrays);//99,199,299,199,99,199,299,199
```
`@distinctUnionOfSets`返回操作对象（且操作对象内对象必须是数组/集合）中数组/集合的所有对象，返回值为集合.因为集合不能包含重复的值,所以它只有distinct操作
```objc
NSSet *setA = [NSSet setWithObjects:productA, productB, nil];
NSSet *setB = [NSSet setWithObjects:productC, productD, nil];
NSSet *set = [NSSet setWithObjects:setA, setB, nil];

NSSet *allSet = [set valueForKeyPath:@"@distinctUnionOfSets.name"];
NSLog(@"distinctUnionOfSets: %@", allSet);//iPhone,iPod,iMac
```

## 补充:` -(void)valueForKeyPath:`的用

1.可以指定数组中每个元素的执行方法,然后将新元素放到新数组中返回,

for example:

```objc
NSArray *arr = @[@"iPod", @"iPhone", @"iMac", @"iPhone8 Plus"];
NSArray *uppercaseStrArr = [arr valueForKeyPath:@"uppercaseString"];
NSLog(@"%@", uppercaseStrArr);// 输出: IPOD,IPHONE,IMAC,"IPHONE8 PLUS"
从输出我们不难看出,[arr valueForKeyPath:@"uppercaseString"]相当于数组中每个元素都执行了uppercaseString方法,并将返回的对象放到了一个数组中返回.当然了,除了可以执行uppercaseString外,也可以执行集合中对象的其他实例方法:length,md5String and so on...

NSArray *lengthArr = [arr valueForKeyPath:@"length"];
NSLog(@"%@", lengthArr);// 输出: 4,6,4,12
```

2.如上所述,对数组快速求和,求平均值,求最大值,最小值.

```objc
NSArray *priceArr = @[@99, @199, @299, @99];
NSNumber *count = [priceArr valueForKeyPath:@"@count"];
NSNumber *avg = [priceArr valueForKeyPath:@"@avg.self"];
NSNumber *max = [priceArr valueForKeyPath:@"@max.self"];
NSNumber *min = [priceArr valueForKeyPath:@"@min.self"];
NSNumber *sum = [priceArr valueForKeyPath:@"@sum.self"];
NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum);//count:4, avg:174, max:299, min:99, sum:696
当然,也能指定输出类型, for example:

NSNumber *count = [priceArr valueForKeyPath:@"@count"];
NSNumber *avg = [priceArr valueForKeyPath:@"@avg.floatValue"];
NSNumber *max = [priceArr valueForKeyPath:@"@max.floatValue"];
NSNumber *min = [priceArr valueForKeyPath:@"@min.floatValue"];
NSNumber *sum = [priceArr valueForKeyPath:@"@sum.floatValue"];
NSLog(@"count:%@, avg:%@, max:%@, min:%@, sum:%@", count, avg, max, min, sum);//co
```


3.剔除数组中的重复元素

`NSLog(@"%@", [priceArr valueForKeyPath:@"@distinctUnionOfObjects.self"]);//199,299,99`

4.根据 keypath 路径快速找到 key 对应的值, for example:
```objc

NSArray *array = @[@{@"name" : @"iPod",   @"price" : @99 },
                   @{@"name" : @"iPhone", @"price" : @199},
                   @{@"name" : @"iPhone", @"price" : @299},
                   @{@"name" : @"iPhone", @"price" : @299},
                       ];
// 注意:name 前面没有@符号,这里不是集合运算符
NSLog(@"%@", [array valueForKeyPath:@"name"]);//iPod,iPhone,iPhone,iPhone
```
