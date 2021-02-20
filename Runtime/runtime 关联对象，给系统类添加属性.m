/// 对象关联策略
typedef OBJC_ENUM(uintptr_t, objc_AssociationPolicy) {
    OBJC_ASSOCIATION_ASSIGN = 0,           /**< 关联一个弱引用 */
    OBJC_ASSOCIATION_RETAIN_NONATOMIC = 1, /**< 指定关联一个强引用. 非原子性. */
    OBJC_ASSOCIATION_COPY_NONATOMIC = 3,   /**< 指定关联一个拷贝引用. 非原子性. */
    OBJC_ASSOCIATION_RETAIN = 01401,       /**< 指定关联一个强引用.原子性. */
    OBJC_ASSOCIATION_COPY = 01403          /**< 指定关联一个拷贝引用.原子性. */
};

/** 
 * 用给定的 key 和关联策略 policy 为指定的 object 设置关联关系
 */
void objc_setAssociatedObject(id object, const void * key, id value, objc_AssociationPolicy policy);

/** 
 * 通过给定的 object 和 key 拿到关联的对象
 */
id objc_getAssociatedObject(id object, const void * key);

/** 
 * 移除给定 object 所有关联的关系
 */
void objc_removeAssociatedObjects(id object)；


// 例子：

static const void * _Nonnull titleKey = @"titleKey";

- (void)setTitle:(NSString *)title
{
    objc_setAssociatedObject(self, titleKey, key, OBJC_ASSOCIATION_RETAIN);
}

- (NSString *)title
{
    return objc_getAssociatedObject(self, titleKey);
}