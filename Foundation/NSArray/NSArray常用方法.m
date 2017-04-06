NSArray的常见用法

- (NSUInteger)count;
// 获取集合元素个数

- (id)objectAtIndex:(NSUInteger)index;
// 获得index位置的元素

- (BOOL)containsObject:(id)anObject;
// 是否包含某一个元素

- (id)lastObject;
// 返回最后一个元素

- (id)firstObject;
// 返回第一个元素

- (NSUInteger)indexOfObject:(id)anObject;
// 查找anObject元素在数组中的位置(如果找不到,返回-1)NSNotFound

- (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
// 在range范围内查找anObject元素在数组中的位置
