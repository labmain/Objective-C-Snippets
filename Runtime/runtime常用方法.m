// 获得一个类名
NSString *NSStringFromClass(Class aClass);
// 根据属性名获取一个类的属性
objc_property_t   class_getProperty(Class cls, const char *name)
// 根据属性获取属性名字
const char *property_getName(objc_property_t property)
// char* 为UTF-8类型，转为NSString的方式为
+ (NSString*)stringWithUTF8String:(const char *)nullTerminatedCString;

// 示例

// 根据一个属性名字和一个对象，获取其对应的值
NSString* propertyName = key;
NSOject *entity;
id propertyValue = [(NSObject*)entity valueForKey:propertyName];

// 根据一个属性名字，判断一个属性的数据类型
NSString* tmpPropertyName  = obj;
objc_property_t tmpPropery = class_getProperty(entityClass, [tmpPropertyName UTF8String]);
const char * type = property_getAttributes(tmpPropery);
NSString * typeString = [NSString stringWithUTF8String:type];
NSArray * attributes = [typeString componentsSeparatedByString:@","];
NSString * typeAttribute = [attributes objectAtIndex:0];
NSString * propertyType = [typeAttribute substringFromIndex:1];
const char * rawPropertyType = [propertyType UTF8String];
//https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
if (strcmp(rawPropertyType, @encode(CGFloat)) == 0 ||strcmp(rawPropertyType, @encode(float)) == 0 ||strcmp(rawPropertyType, @encode(double)) == 0 )/*0001*/ {
   //it's a float
} else if (strcmp(rawPropertyType, @encode(int)) == 0) {
   //it's an int
} else if (strcmp(rawPropertyType, @encode(long)) == 0) {
  //it's a long
} else if (strcmp(rawPropertyType, @encode(long long)) == 0) {
 //it's   long long
} else if (strcmp(rawPropertyType, @encode(id)) == 0) {
//it's some sort of object: id
}  else if (strcmp(rawPropertyType, @encode(BOOL)) == 0 || strcmp(rawPropertyType, @encode(_Bool)) == 0) {
   //it's some sort of object: id
} else {
// According to Apples Documentation you can determine the corresponding encoding values

}/*0001*/

if ([typeAttribute hasPrefix:@"T@"] && [typeAttribute length] > 1)/*0001*/ {
 NSString * typeClassName = [typeAttribute substringWithRange:NSMakeRange(3, [typeAttribute length]-4)];  //turns @"NSDate" into NSDate
 Class typeClass = NSClassFromString(typeClassName);
 if (typeClass != nil) {
     if (typeClass == [NSDate class]) {
           //nsdate
    }else if (typeClass == [NSString class] ||typeClass == [NSMutableString class] ) {
    }
}

}/*0001*/
