@interface NSLayoutConstraint
@property UILayoutPriority priority
优先级属性。如果一个约束的优先级小于UILayoutPriorityRequired，那么这个约束是可选的。先满足高优先级的约束再可满足低优先级的约束。优先级必须是大于0且小于或等于NSLayoutPriorityRequired。

@property(readonly, assign) id firstItem
参与约束的第一个对象。

@property (readonly) NSLayoutAttribute firstAttribute
第一个对象的属性。

@property (readonly) NSLayoutRelation relation
约束中，2个属性的关系。

@property (nullable, readonly, assign) id secondItem
参数约束的第二个对象。

@property (readonly) NSLayoutAttribute secondAttribute;
第二个对象的属性

@end
