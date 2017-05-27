NS_AVAILABLE_IOS(5_0)
这个方法可以在iOS5.0及以后的版本中使用，如果在比5.0更老的版本中调用这个方法，就会引起崩溃。

NS_DEPRECATED_IOS(2_0, 6_0)
这个宏中有两个版本号。前面一个表明了这个方法被引入时的iOS版本，后面一个表明它被废弃时的iOS版本。被废弃并不是指这个方法就不存在了，只是意味着我们应当开始考虑将相关代码迁移到新的API上去了。

NS_AVAILABLE(10_8, 6_0)
这个宏告诉我们这方法分别随Mac OS 10.8和iOS 6.0被引入。

NS_DEPRECATED(10_0, 10_6, 2_0, 4_0)
这个方法随Mac OS 10.0和iOS 2.0被引入，在Mac OS 10.6和iOS 4.0后被废弃。

NS_CLASS_AVAILABLE(10_11, 9_0)
这个类分别随Mac OS 10.11和iOS9.0被引入。

NS_ENUM_AVAILABLE(10_11, 9_0)
这个枚举分别随Mac OS 10.11和iOS9.0被引入。
