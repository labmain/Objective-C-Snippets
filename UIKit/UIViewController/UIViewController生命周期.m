//类的初始化方法
+ (void)initialize;
//对象初始化方法
- (instancetype)init;
//从归档初始化
- (instancetype)initWithCoder:(NSCoder *)coder;
//加载视图
-(void)loadView;
//将要加载视图
- (void)viewDidLoad;
//将要布局子视图
-(void)viewWillLayoutSubviews;
//已经布局子视图
-(void)viewDidLayoutSubviews;
//内存警告
- (void)didReceiveMemoryWarning;
//已经展示
-(void)viewDidAppear:(BOOL)animated;
//将要展示
-(void)viewWillAppear:(BOOL)animated;
//将要消失
-(void)viewWillDisappear:(BOOL)animated;
//已经消失
-(void)viewDidDisappear:(BOOL)animated;
//被释放
-(void)dealloc;


/*
1：initialize函数并不会每次创建对象都调用，只有在这个类第一次创建对象时才会调用，做一些类的准备工作，再次创建这个类的对象，initalize方法将不会被调用，对于这个类的子类，如果实现了initialize方法，在这个子类第一次创建对象时会调用自己的initalize方法，之后不会调用，如果没有实现，那么它的父类将替它再次调用一下自己的initialize方法，以后创建也都不会再调用。因此，如果我们有一些和这个相关的全局变量，可以在这里进行初始化。

2：init方法和initCoder方法相似，只是被调用的环境不一样，如果用代码进行初始化，会调用init，从nib文件或者归档进行初始化，会调用initCoder。

3：loadView方法是开始加载视图的起始方法，除非手动调用，否则在ViewController的生命周期中没特殊情况只会被调用一次。

4：viewDidLoad方法是我们最常用的方法的，类中成员对象和变量的初始化我们都会放在这个方法中，在类创建后，无论视图的展现或消失，这个方法也是只会在将要布局时调用一次。

5：viewWillAppear：视图将要展现时会调用。

6：viewWillLayoutSubviews：在viewWillAppear后调用，将要对子视图进行布局。

7：viewDidLayoutSubviews：已经布局完成子视图。

8：viewDidAppare：视图完成显示时调用。

9：viewWillDisappear：视图将要消失时调用。

10：viewDidDisappear：视图已经消失时调用。

11：dealloc：controller被释放时调用。
*/
