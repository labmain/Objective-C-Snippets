NSArray *numbers = @[@2.1, @8.1, @5.0, @.3];  
numbers = [numbers sortedArrayUsingSelector:@selector(compare:)];  

// 1.数组排序
float min = [numbers[0] floatValue];  
float max = [[numbers lastObject] floatValue];  

// 2.KVC，使用"doubleValue"
NSNumber *max=[numbers valueForKeyPath:@"@max.doubleValue"];  
NSNumber *min=[numbers valueForKeyPath:@"@min.doubleValue"];  

// 3.KVC，使用"self"
NSNumber *max=[numbers valueForKeyPath:@"@max.self"];  
NSNumber *min=[numbers valueForKeyPath:@"@min.self"];

// 4.for循环
float xmax = -MAXFLOAT;  
float xmin = MAXFLOAT;  
for (NSNumber *num in numbers) {  
    float x = num.floatValue;  
    if (x < xmin) xmin = x;  
    if (x > xmax) xmax = x;  
}

// 5.代码块
__block float xmax = -MAXFLOAT;  
__block float xmin = MAXFLOAT;  
[numbers enumerateObjectsUsingBlock:^(NSNumber *num, NSUInteger idx, BOOLBOOL *stop) {  
    float x = num.floatValue;  
    if (x < xmin) xmin = x;  
    if (x > xmax) xmax = x;  
}]; 