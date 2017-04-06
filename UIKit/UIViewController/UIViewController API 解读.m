/*
UIViewController is a generic controller base class that manages a view. It has methods that are called
when a view appears or disappears.

Subclasses can override -loadView to create their custom view hierarchy, or specify a nib name to be loaded
automatically. This class is also a good place for delegate & datasource methods, and other controller
stuff.
*/
@class UIView;
//1. UIViewController是管理一个view的最基本的基类，当一个view要显示或者消失的时候，UIViewController有相应方法会被调用。子类可以重写loadView方法去创建他们自定义的view，或者指定一个nib被自动加载实现。这个类也是对于代理，数据源协议方法和一些其他控制器的方法展示实现一个很好的空间地方。

@class UINavigationItem, UIBarButtonItem, UITabBarItem;
//2. UINavigationItem是放置在导航栏中的,包含.rightBarButtonItem，.leftBarButtonItem，titleView，而这三个按钮又可以归为UIBarButtonItem类，并通过它创建。UITabBarItem是分栏控制器底部切换item按钮。

@class UISearchDisplayController
//3. UISearchDisplayController是专门为UITableView搜索封装的一个类。

@class UIPopoverController;
//4.UIPopverController是IPad特有的类，不能在iphone上使用，它负责控制Popover视图。Popover是一种临时视图，它以“漂浮”的形式出现在视图里面。

@class UIStoryboard, UIStoryboardSegue;
//5. UIStoryboard是iOS5以后新增的内容，是以故事版的形式来展示界面之间的逻辑业务关系，前端开发目前有三种方式（纯代码，代码+xib，UIStoryboard），UIStoryboard为其中一种。而UIStoryboardSegue—————————————————————
@class UIScrollView
//6. UIScrollView在UIKit中是UIScrollView类，是容器类型的视图。它有三个子类—UITextView，UITableview和UICollectionView，它们在内容超出屏幕时提供水平或垂直滚动条。
@protocol UIViewControllerTransitionCoordinator;
//7.这就涉及到自定义viewController容器转场，iOS7引入的新特性自定义viewController转场。———–

typedef NS_ENUM(NSInteger, UIModalTransitionStyle) {
UIModalTransitionStyleCoverVertical = 0,
UIModalTransitionStyleFlipHorizontal,
UIModalTransitionStyleCrossDissolve,
UIModalTransitionStylePartialCurl NS_ENUM_AVAILABLE_IOS(3_2),
};
//8.UIModalTransitionStyle是弹出模态ViewController时的四种动画风格，UIModalTransitionStyleCoverVertical是从底部滑入，UIModalTransitionStyleFlipHorizontal是水平翻转，UIModalTransitionStyleCrossDissolve是交叉溶解，UIModalTransitionStylePartialCurl是翻页效果。

typedef NS_ENUM(NSInteger, UIModalPresentationStyle) {
UIModalPresentationFullScreen = 0,
UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2),
UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2),
UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0),
UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1,
};
//9，UIModalPresentationStyle是弹出模态ViewController时弹出风格，UIModalPresentationFullScreen是弹出VC时，VC充满全屏，UIModalPresentationPageSheet是如果设备横屏，VC的显示方式则从横屏下方开始，UIModalPresentationFormSheet是VC显示都是从底部，宽度和屏幕宽度一样。UIModalPresentationCurrentContext是VC的弹出方式和VC父VC的弹出方式相同。…..UIModalPresentationNone测试时会崩溃，出错’The specified modal presentation style doesn’t have a corresponding presentation controller.’——————————-

@protocol UIContentContainer
//10.iOS8之后，加入了新的一组协议，UIViewController对这组协议提供了默认的实现，我们自定义ViewConttroller的时候可以重写这些方法来调整视图布局。

@property (nonatomic, readonly) CGSize preferredContentSize NS_AVAILABLE_IOS(8_0);
//11.我们可以使用preferredContentSize来设置我们期望的childViewController的界面的大小。

– (void)preferredContentSizeDidChangeForChildContentContainer:(id )container NS_AVAILABLE_IOS(8_0);
//12.这个方法告诉当前容器viewController，我们可以在这个方法里根据新的size对界面进行调整。
/*
Intended as a bridge for a view controller that does not use auto layout presenting a child that does use auto layout.

If the child’s view is using auto layout and the -systemLayoutSizeFittingSize: of the view
changes, -systemLayoutFittingSizeDidChangeForChildContentContainer: will be sent to the view controller’s parent.
*/

– (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id )container NS_AVAILABLE_IOS(8_0);
//13.重写方法来调整视图布局，当在这些情况下该方法会被调用，当前viewController没有使用auto layout布局，childrenViewController的view使用了autoLayout布局childrenViewController View-systemLayoutSizeFittingSize：方法返回的值的改变（view由于内容的改变，size也出现了变化）
/*
When the content container forwards viewWillTransitionToSize:withTransitionCoordinator: to its children, it will call this method to determine what size to send them.

If the returned size is the same as the child container’s current size, viewWillTransitionToSize:withTransitionCoordinator: will not be called.
*/

– (CGSize)sizeForChildContentContainer:(id )container withParentContainerSize:(CGSize)parentSize NS_AVAILABLE_IOS(8_0);
//14.同上，依旧因为iOS8上size class概念的提出，UIViewConteroller支持了UIConntentContainer这样一组新的协议，重写这些方法可以调整视图布局，一个容器viewController可以使用这个方法设置childViewController的size，当容器viewControllerViewWillTransitionTosize：withTransitionCoordinator：被调用时（我们重写这个方法时要调用super），sizeForChildContentContainer方法将被调用。然后我们可以把需要设置desire发送给childViewController。当我们设置的这个size和当前childViewController的size一样，那么childViewController的viewWillTransitionToSize方法将不会被调用。sizeForChildContentContainer默认的实现是返回parentSize
/*
This method is called when the view controller’s view’s size is changed by its parent (i.e. for the root view controller when its window rotates or is resized).
If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
*/
– (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id )coordinator NS_AVAILABLE_IOS(8_0);
//15.viewController的view的size被他的parent Controller改变时，会触发这个方法（比如rootViewController在它的window旋转的时候）我们重写这个方法时，确保要调用super来保证size改变的这条消息能够正常传递给它的views活着childViewControllers。
/*
This method is called when the view controller’s trait collection is changed by its parent.

If you override this method, you should either call super to propagate the change to children or manually forward the change to children.
*/

– (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id )coordinator NS_AVAILABLE_IOS(8_0);
//17.当viewController的traitCollection的值将要改变时会调用这个方法，这个方法是在UITraitEnvironment协议方法traitCollectionDidChange：之前被调用。我们在重写这个方法时候也要确保要调用super来保证消息的传递。比如，我们可以像这样在traintCollection值改变时，对试图做相应的动画进行调整。
@end

// Sometimes view controllers that are using showViewController:sender and showDetailViewController:sender: will need to know when the split view controller environment above it has changed. This notification will be posted when that happens (for example, when a split view controller is collapsing or expanding). The NSNotification’s object will be the view controller that caused the change.
UIKIT_EXTERN NSString *const UIViewControllerShowDetailTargetDidChangeNotification NS_AVAILABLE_IOS(8_0);
//18.

NS_CLASS_AVAILABLE_IOS(2_0) @interface UIViewController : UIResponder <NSCoding, UIAppearanceContainer, UITraitEnvironment, UIContentContainer> {
//19.UIViewController继承自UIResponder类，并实现NSCoding（实现归档操作），UIAppearanceContainer（允许开发者对UI控件通过定制都可以呈现各种外观），UITraitEnvironment（SizeClasses适配理念，通过内部的traitCollection属性，可以拿到对应的UITraitCollection对象，从而得知当前的SizeClass，进一步确定界面的布局），UIContentContainer协议（调整视图布局）

@package
//20.实例变量范围类型@package，对于framework内部相当于@protect，对于framework外部相当于@private。
UIView *_view;
//21.view成员变量
UITabBarItem *_tabBarItem;
//22.分栏控制器的item按钮成员变量
UINavigationItem *_navigationItem;
//23.导航栏item成员变量
NSArray *_toolbarItems;
//24.数组用来保存工具条按钮item的成员变量
NSString *_title;
//25.标题title成员变量
NSString *_nibName;
//26.nib名称成员变量
NSBundle *_nibBundle;
//27.bundle成员变量
UIViewController *_parentViewController; // Nonretained
//28.取父viewConreoller成员变量
UIViewController *_childModalViewController;
//29.取子模态ViewController成员变量
UIViewController *_parentModalViewController; // Nonretained
//30.取父模态ViewController成员变量
UIViewController *_previousRootViewController; // Nonretained
//31.取上一个根previous的成员变量
UIView *_modalTransitionView;
//32.模态过渡view的成员变量
UIResponder *_modalPreservedFirstResponder;
//33.第一个保存Responder成员变量
id _dimmingView;
//34.变暗的view———–
id _dropShadowView;
//35.删除阴影view成员变量————–
id _currentAction;
//36.当前动作方法
UIStoryboard *_storyboard;
//37.storyboard成员变量
NSArray *_storyboardSegueTemplates;
//38.存放storyboardSegue的数组
NSDictionary *_externalObjectsTableForViewLoading;
//39.——————–
NSArray *_topLevelObjectsToKeepAliveFromStoryboard;
//40.——————–
UIView *_savedHeaderSuperview;
//41.表头的父view
UIView *_savedFooterSuperview;
//42.表尾的父view
UIBarButtonItem *_editButtonItem;
//43.可编辑的BarButtonItem
UISearchDisplayController *_searchDisplayController;
//44.用于搜索的viewController
UIModalTransitionStyle _modalTransitionStyle;
//45.模态视图过渡动画样式
UIModalPresentationStyle _modalPresentationStyle;
//46.模态视图呈现样式
UIInterfaceOrientation _lastKnownInterfaceOrientation;
//47.当前程序界面的旋转方向
UIPopoverController* _popoverController;
//48.IPad专用的一种临时视图，以漂浮的形式出现在屏幕表面。
UIView *_containerViewInSheet;
//49.—————
CGSize _contentSizeForViewInPopover;
//50.在IPad临时视图中展示容纳的view大小
CGSize _formSheetSize;
//51.———
UIScrollView *_recordedContentScrollView;
//52.———–
void (^_afterAppearance)(void);
//53.—————
NSInteger _explicitAppearanceTransitionLevel;
//54.————
NSArray *_keyCommands;
//55.————
NSMapTable *_overrideTraitCollections;
//56.——–了解过还是不太理解

/*
The designated initializer. If you subclass UIViewController, you must call the super implementation of this
method, even if you aren’t using a NIB. (As a convenience, the default init method will do this for you,
and specify nil for both of this methods arguments.) In the specified NIB, the File’s Owner proxy should
have its class set to your view controller subclass, with the view outlet connected to the main view. If you
invoke this method with a nil nib name, then this class’ -loadView method will attempt to load a NIB whose
name is the same as your view controller’s class. If no such NIB in fact exists then you must either call
-setView: before -view is invoked, or override the -loadView method to set up your views programatically.
*/
– (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
//100.这个方法是加载对应nibName的viewController

@property(nonatomic,retain) UIView *view; // The getter first invokes [self loadView] if the view hasn’t been set yet. Subclasses must call super if they override the setter or getter.
//101.view属性，如果当你第一次调用[self loadView]方法而view还没有被设置，子类必须要调用super父类方法重写覆盖setter和getter

– (void)loadView; // This is where subclasses should create their custom view hierarchy if they aren’t using a nib. Should never be called directly.
//102.在loadView方法内部可以创建自定义的view，有一前提是没有使用xib。还有这个方法绝对不能直接主动去调用。

– (void)viewWillUnload NS_DEPRECATED_IOS(5_0,6_0);
//103.view将要销毁的时候会调用这个方法（不过现在已弃用）

– (void)viewDidUnload NS_DEPRECATED_IOS(3_0,6_0); // Called after the view controller’s view is released and set to nil. For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
//104.view已经被销毁的时候会调用这个方法(现在也已弃用)

– (void)viewDidLoad; // Called after the view has been loaded. For view controllers created in code, this is after -loadView. For view controllers unarchived from a nib, this is after the view is set.
//105.这个方法在view加载完毕的时候调用，在此方法内部对view做一些渲染的事情，做一些初始化的操作，并且执行顺序是在loadView方法调用之后调用，

– (BOOL)isViewLoaded NS_AVAILABLE_IOS(3_0);
//106.判断view是否被加载完毕

@property(nonatomic, readonly, copy) NSString *nibName; // The name of the nib to be loaded to instantiate the view.
//107.nibName作为属性，加载对应的nib。

@property(nonatomic, readonly, retain) NSBundle *nibBundle; // The bundle from which to load the nib.
//108.bundle是一个资源目录，包含nib文件，nibBunlde作为属性

@property(nonatomic, readonly, retain) UIStoryboard *storyboard NS_AVAILABLE_IOS(5_0);
//109.storyboard属性,iOS5出现

– (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender NS_AVAILABLE_IOS(5_0);
//110.使用stortboard时利用segue进行页面跳转的方法

– (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender NS_AVAILABLE_IOS(6_0); // Invoked immediately prior to initiating a segue. Return NO to prevent the segue from firing. The default implementation returns YES. This method is not invoked when -performSegueWithIdentifier:sender: is used.
//111.这份方法是决定是否执行segeue的关键。可在内部做一些时间判断，返回yes，将执行performSegueWithIdentifier:方法，返回no不执行performSegueWithIdentifier:，默认返回yes，可以执行

– (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender NS_AVAILABLE_IOS(5_0);
//112.当用storyboard并且触发segue时，系统会自动调用这个方法，可以重写这个方法，在内部做一些类与类传递数据的操作

// View controllers will receive this message during segue unwinding. The default implementation returns the result of -respondsToSelector: – controllers can override this to perform any ancillary checks, if necessary.
– (BOOL)canPerformUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender NS_AVAILABLE_IOS(6_0);
//113.我们一般在子控制器中通过实现canperformUnwindSegueAction：fromViewController:withSender：来决定要不要执行相应的Unwind Segue。

// Custom containers should override this method and search their children for an action handler (using -canPerformUnwindSegueAction:fromViewController:sender:). If a handler is found, the controller should return it. Otherwise, the result of invoking super’s implementation should be returned.
– (UIViewController *)viewControllerForUnwindSegueAction:(SEL)action fromViewController:(UIViewController *)fromViewController withSender:(id)sender NS_AVAILABLE_IOS(6_0);
//114.这个方法用来决定哪个viewController来处理Unwind Segue action

// Custom container view controllers should override this method and return segue instances that will perform the navigation portion of segue unwinding.
– (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier NS_AVAILABLE_IOS(6_0);
//115.这个方法用来返回自定义的Unwind Segue实例

– (void)viewWillAppear:(BOOL)animated; // Called when the view is about to made visible. Default does nothing
//116.这个方法是当view将要显示的时候被调用

– (void)viewDidAppear:(BOOL)animated; // Called when the view has been fully transitioned onto the screen. Default does nothing
//117.这个方法是当view已经显示的时候被调用

– (void)viewWillDisappear:(BOOL)animated; // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
//118.这个方法是当view将要消失的时候调用

– (void)viewDidDisappear:(BOOL)animated; // Called after the view was dismissed, covered or otherwise hidden. Default does nothing
//119.这个方法是当view已经消失的时候调用

// Called just before the view controller’s view’s layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
– (void)viewWillLayoutSubviews NS_AVAILABLE_IOS(5_0);
//120.在重新布局子view前的时候会调用

// Called just after the view controller’s view’s layoutSubviews method is invoked. Subclasses can implement as necessary. The default is a nop.
– (void)viewDidLayoutSubviews NS_AVAILABLE_IOS(5_0);
//120.在重新布局子view后的时候会调用

@property(nonatomic,copy) NSString *title; // Localized title for use by a parent controller.
//121.标题title属性

– (void)didReceiveMemoryWarning; // Called when the parent application receives a memory warning. On iOS 6.0 it will no longer clear the view by default.
//122.当应用程序收到内存警告的时候会调用这个方法 ,做相应的解决内存警告的操作

/*
If this view controller is a child of a containing view controller (e.g. a navigation controller or tab bar
controller,) this is the containing view controller. Note that as of 5.0 this no longer will return the
presenting view controller.
*/
@property(nonatomic,readonly) UIViewController *parentViewController;
//123.取父viewController的属性

// This property has been replaced by presentedViewController.
@property(nonatomic,readonly) UIViewController *modalViewController NS_DEPRECATED_IOS(2_0, 6_0);
//124.得到模态视图控制器

// The view controller that was presented by this view controller or its nearest ancestor.
@property(nonatomic,readonly) UIViewController *presentedViewController NS_AVAILABLE_IOS(5_0);
//125.————————

// The view controller that presented this view controller (or its farthest ancestor.)
@property(nonatomic,readonly) UIViewController *presentingViewController NS_AVAILABLE_IOS(5_0);
//126.正在展示的控制器

/*
Determines which parent view controller’s view should be presented over for presentations of type
UIModalPresentationCurrentContext. If no ancestor view controller has this flag set, then the presenter
will be the root view controller.
*/
@property(nonatomic,assign) BOOL definesPresentationContext NS_AVAILABLE_IOS(5_0);
//127. 决定哪个父viewController的view应当呈现在当前，如果没有父viewController，呈现的将是根视图控制器。

// A controller that defines the presentation context can also specify the modal transition style if this property is true.
@property(nonatomic,assign) BOOL providesPresentationContextTransitionStyle NS_AVAILABLE_IOS(5_0);
//128.如果这个属性是true的话，可以定义模态过渡转场的样式

/*
These four methods can be used in a view controller’s appearance callbacks to determine if it is being
presented, dismissed, or added or removed as a child view controller. For example, a view controller can
check if it is disappearing because it was dismissed or popped by asking itself in its viewWillDisappear:
method by checking the expression ([self isBeingDismissed] || [self isMovingFromParentViewController]).
*/

– (BOOL)isBeingPresented NS_AVAILABLE_IOS(5_0);
//129.判断viewController是否正在展示

– (BOOL)isBeingDismissed NS_AVAILABLE_IOS(5_0);
//130.判断viewController是否正在消失

– (BOOL)isMovingToParentViewController NS_AVAILABLE_IOS(5_0);
//131.判断是否正在向父viewController移动

– (BOOL)isMovingFromParentViewController NS_AVAILABLE_IOS(5_0);
//132.判断是否正由父viewController移动而来

/*
The next two methods are replacements for presentModalViewController:animated and
dismissModalViewControllerAnimated: The completion handler, if provided, will be invoked after the presented
controllers viewDidAppear: callback is invoked.
*/
– (void)presentViewController:(UIViewController *)viewControllerToPresent animated: (BOOL)flag completion:(void (^)(void))completion NS_AVAILABLE_IOS(5_0);
//133.这个方法可以实现从当前viewController模态跳转到另一个viewController，completion可在viewDidAppear后回调

// The completion handler, if provided, will be invoked after the dismissed controller’s viewDidDisappear: callback is invoked.
– (void)dismissViewControllerAnimated: (BOOL)flag completion: (void (^)(void))completion NS_AVAILABLE_IOS(5_0);
//134.这个方法可以实现退出当前viewController由模态方式展现出来的，completion可在viewDidDisappear后回调

// Display another view controller as a modal child. Uses a vertical sheet transition if animated.This method has been replaced by presentViewController:animated:completion:
– (void)presentModalViewController:(UIViewController *)modalViewController animated:(BOOL)animated NS_DEPRECATED_IOS(2_0, 6_0);
//135.呈现模态视图

// Dismiss the current modal child. Uses a vertical sheet transition if animated. This method has been replaced by dismissViewControllerAnimated:completion:
– (void)dismissModalViewControllerAnimated:(BOOL)animated NS_DEPRECATED_IOS(2_0, 6_0);
//136.退出模态视图

/*
Defines the transition style that will be used for this view controller when it is presented modally. Set
this property on the view controller to be presented, not the presenter. Defaults to
UIModalTransitionStyleCoverVertical.
*/
@property(nonatomic,assign) UIModalTransitionStyle modalTransitionStyle NS_AVAILABLE_IOS(3_0);
//137.当一个viewController以模态方式呈现的时候，通过modalTransitionStyle可设置过渡动画样式

@property(nonatomic,assign) UIModalPresentationStyle modalPresentationStyle NS_AVAILABLE_IOS(3_2);
//137.当一个viewController以模态方式呈现的时候，通过modalPresentationStyle可设置呈现的样式

// This controls whether this view controller takes over control of the status bar’s appearance when presented non-full screen on another view controller. Defaults to NO.
@property(nonatomic,assign) BOOL modalPresentationCapturesStatusBarAppearance NS_AVAILABLE_IOS(7_0);
//138.这个属性是控制是否显示状态栏

// Presentation modes may keep the keyboard visible when not required. Default implementation affects UIModalPresentationFormSheet visibility.
– (BOOL)disablesAutomaticKeyboardDismissal NS_AVAILABLE_IOS(4_3);
//139.这个API是于关闭键盘相关的，通常情况下单纯的使用resignFirstResponder即可关闭键盘，但是在UIModalPresentationFormSheet下的视图是无法用resignFirstResponder这个API，是因为在进入到此模式后，系统将disablesAutomaticKeyboardDismissal的方法返回值设置成了YES，所以解决方法很简单，重新实现disablesAutomaticKeyboardDismissal，如果是直接使用viewController则可以在实现文件中重新实现这个API，将返回改为NO后，即可正常使用resignFirstResponder方法隐藏键盘，但很多时候我们是把viewController放在UINavigationController中的，这种情况下直接在viewController这里面实现disablesAutomaticKeyboardDismissal依然失效，而应发iUINavigationController中实现这个API。

@property(nonatomic,assign) BOOL wantsFullScreenLayout NS_DEPRECATED_IOS(3_0, 7_0); // Deprecated in 7_0, Replaced by the following:
//140.wantsFullScreenLayout=true，状态栏的高度就不会被算在视图里，也就是说有没有状态栏y坐标始终都是从0算起（不过此属性在iOS7已被弃用，下面属性替代此功能）

@property(nonatomic,assign) UIRectEdge edgesForExtendedLayout NS_AVAILABLE_IOS(7_0); // Defaults to UIRectEdgeAll
//141.iOS7的新属性，默认值为UIRectEdgeAll，在navigationController中view的默认布局从navigationBar开始，self.edgesForExtendedLayout=UIRectEdgeNone,则布局控件减去navigationBar—————-

@property(nonatomic,assign) BOOL extendedLayoutIncludesOpaqueBars NS_AVAILABLE_IOS(7_0); // Defaults to NO, but bars are translucent（透明的，半透明的）by default on 7_0.
//142.在iOS7中UIViewController的wantsFullScreenLayout已经被舍弃，不在提供控件自动展示到导航栏下面这个属性，所有的UIViewController创建后默认就是full Screen的，因此如果带导航栏的应用界面中的部分控件会被导航栏覆盖掉，要解决这个情况可以使用iOS7中UIVIewController新增的属性extendedLayoutIncludesOpaqueBars和edgesForExtendedLayout来解决。其中这个属性指定了当bar使用了不透明图片时，视图是否眼神至bar所在区域，默认值是NO，而edgesForExtendedLayout则是表示食欲是够覆盖到四周的区域，默认是UIRectEdgeAll，即上下左右四个方向都会覆盖，那么为让顶部不进行眼神到导航栏覆盖的区域，我们可以把顶部区域眼神去掉，实现代码如下，self.extendedLayoutIncludesOpaqueBars = NO;
self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
当你在做的时候发现viewDidLoad的时候view的高度还是全屏，viewWillAppear已经去掉navigationbar了，所以frame的设置放在了viewWillAppear中比较准确。

@property(nonatomic,assign) BOOL automaticallyAdjustsScrollViewInsets NS_AVAILABLE_IOS(7_0); // Defaults to YES
//143.当在一个viewController中有多个tableView之类的时候，要把这个属性设置为NO，这样多个tableview的位置就会是按照自己设定的来，而不会出现位置意外不对的情况

/* The preferredContentSize is used for any container laying out a child view controller.
*/
@property (nonatomic) CGSize preferredContentSize NS_AVAILABLE_IOS(7_0);
//144.preferredContentSize来设置我们期望的childViewController的界面的大小

// These methods control the attributes of the status bar when this view controller is shown. They can be overridden in view controller subclasses to return the desired status bar attributes.
– (UIStatusBarStyle)preferredStatusBarStyle NS_AVAILABLE_IOS(7_0); // Defaults to UIStatusBarStyleDefault
//145.设置shown的ViewController的状态栏样式

– (BOOL)prefersStatusBarHidden NS_AVAILABLE_IOS(7_0); // Defaults to NO
//146.设置状态栏是否隐藏显示

// Override to return the type of animation that should be used for status bar changes for this view controller. This currently only affects changes to prefersStatusBarHidden.
– (UIStatusBarAnimation)preferredStatusBarUpdateAnimation NS_AVAILABLE_IOS(7_0); // Defaults to UIStatusBarAnimationFade
//147.重写此方法设置状态栏更新时候的动画

// This should be called whenever the return values for the view controller’s status bar attributes have changed. If it is called from within an animation block, the changes will be animated along with the rest of the animation block.
– (void)setNeedsStatusBarAppearanceUpdate NS_AVAILABLE_IOS(7_0);
//148.如果需要对状态栏进行刷新，调用此方法即可

/* This method returns either itself or the nearest ancestor that responds to the action. View controllers can return NO from canPerformAction:withSender: to opt out of being a target for a given action. */
– (UIViewController *)targetViewControllerForAction:(SEL)action sender:(id)sender NS_AVAILABLE_IOS(8_0);
//149.

/* This method will show a view controller appropriately for the current size-class environment. It’s implementation calls
`[self targetViewControllerForAction:sender:]` first and redirects accordingly if the return value is not `self`, otherwise it will present the vc. */
– (void)showViewController:(UIViewController *)vc sender:(id)sender NS_AVAILABLE_IOS(8_0);
//150.—————–

/* This method will show a view controller within the semantic “detail” UI associated with the current size-class environment. It’s implementation calls `[self targetViewControllerForAction:sender:]` first and redirects accordingly if the return value is not `self`, otherwise it will present the vc. */
– (void)showDetailViewController:(UIViewController *)vc sender:(id)sender NS_AVAILABLE_IOS(8_0);
//151.————————–

@end

// To make it more convenient for applications to adopt rotation, a view controller may implement the below methods. Your UIWindow’s frame should use [UIScreen mainScreen].bounds as its frame.
@interface UIViewController (UIViewControllerRotation)
//152.为UIViewController添加分类方法 为了更好的适应应用的屏幕旋转

// call this method when your return value from shouldAutorotateToInterfaceOrientation: changes
// if the current interface orientation does not match the current device orientation, a rotation may occur provided all relevant view controllers now return YES from shouldAutorotateToInterfaceOrientation:
+ (void)attemptRotationToDeviceOrientation NS_AVAILABLE_IOS(5_0);
//153.这个方法这样使用：当应用的device orientation转换方向，又希望interface orientation也跟着转换方向时，不仅仅是将supportedInterfaceOrientations的返回值设置为目标方向，仍需要调用attemptRotationToDeviceOrientation这个方法，这样才能让interface orientation和device orientation的方向立即保持一致。

// Applications should use supportedInterfaceOrientations and/or shouldAutorotate..
– (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0);
//154.iOS6之前我们可以通过这个方法来单独控制某个UIVewController的旋转方向

// New Autorotation support.
– (BOOL)shouldAutorotate NS_AVAILABLE_IOS(6_0);
//155.决定是否之处多方向旋转屏，返回NO不支持，只会支持默认的UIInterfaceOrientaionMaskPortrait方向

– (NSUInteger)supportedInterfaceOrientations NS_AVAILABLE_IOS(6_0);
//156.此方法的返回值决定interface orienation的旋转方向

// Returns interface orientation masks.
– (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation NS_AVAILABLE_IOS(6_0);
//157.这个方法的作用是设置viewController在present时首选的默认方向，返回一个interfaceOrientation

// The rotating header and footer views will slide out during the rotation and back in once it has completed.
– (UIView *)rotatingHeaderView NS_DEPRECATED_IOS(2_0,8_0, “Header views are animated along with the rest of the view hierarchy”); // Must be in the view hierarchy. Default returns nil.
//158.查询当前的导航视图

– (UIView *)rotatingFooterView NS_DEPRECATED_IOS(2_0,8_0, “Footer views are animated along with the rest of the view hierarchy”); // Must be in the view hierarchy. Default returns nil.
//159.查询当前的标签视图

@property(nonatomic,readonly) UIInterfaceOrientation interfaceOrientation NS_DEPRECATED_IOS(2_0,8_0);
//160.interfaceOrientation是应用界面的旋转方向

// Notifies when rotation begins, reaches halfway point and ends.
– (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(2_0,8_0, “Implement viewWillTransitionToSize:withTransitionCoordinator: instead”);
//161.应用界面将要旋转的时候前会调用，一般用来禁用某些控件或者停止某些正在运行的动作，比如播放视频等等

– (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation NS_DEPRECATED_IOS(2_0,8_0);
//162.这个发生在旋转屏幕之后，一般用来启用某些之前被禁用的控件或者是之前已经正在运行的动作，如播放视频等等

– (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(3_0,8_0, “Implement viewWillTransitionToSize:withTransitionCoordinator: instead”);
//163.这个方法发生在旋转的过程中，一般用来定制翻转后各个控件的位置大小等

– (void)willAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(2_0, 5_0);
//164.这个方法和163那个方法作用一样，就是作用范围时间不一样，作为翻转的前半段

– (void)didAnimateFirstHalfOfRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 5_0); // The rotating header and footer views are offscreen.
//165.这个方法是在前半段旋转之后发生，做一些相应操作

– (void)willAnimateSecondHalfOfRotationFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation duration:(NSTimeInterval)duration NS_DEPRECATED_IOS(2_0, 5_0); // A this point, our view orientation is set to the new orientation.
//166.这个方法是也是发生在旋转过程中，和163一样作样，发生作用范围在后半段

@end

// Many view controllers have a view that may be in an editing state or not- for example, a UITableView. These view
// controllers can track the editing state, and generate an Edit|Done button to be used in a navigation bar.
@interface UIViewController (UIViewControllerEditing)
//167.为UIViewController添加分类方法 实现可编辑的功能

@property(nonatomic,getter=isEditing) BOOL editing;
//168.bool值 判断是否可编辑

– (void)setEditing:(BOOL)editing animated:(BOOL)animated; // Updates the appearance of the Edit|Done button item as necessary. Clients who override it must call super first.
//169.更新Edit|Done按钮item的外观

– (UIBarButtonItem *)editButtonItem; // Return an Edit|Done button that can be used as a navigation item’s custom view. Default action toggles the editing state with animation.
//170.实现一个自定义的view，作为导航栏的Edit|Done按钮。

@end

@interface UIViewController (UISearchDisplayControllerSupport)
//171.实现UISearchDisplayControllerSupport相关的分类方法

@property(nonatomic, readonly, retain) UISearchDisplayController *searchDisplayController NS_DEPRECATED_IOS(3_0,8_0);
//172.UIViewController自带searchDisplayController属性

@end

/*
This exception is raised when a child view controller’s view is added into the view hierarchy and the first
superview of the child view controller’s view that has a view controller is NOT the child view controller’s
parent.
*/
UIKIT_EXTERN NSString *const UIViewControllerHierarchyInconsistencyException NS_AVAILABLE_IOS(5_0);
//173.异常。因控制器的层次与视图的层次不一致会引发该异常，当视图控制器的视图添加到视图层中，系统会遍历视图层来找到第一个拥有视图控制器的父视图。找到的该父视图控制器也必须是刚添加的视图的所对应视图控制器的父控制器。否则会抛出异常。当视图控制器通过addChildViewController方法被添加进来后，也会进行之前的一致性检测。不存在俯视图控制器的视图控制器，也可以将其视图添加到视图层中。但通常极少数情况下才会用到这种方式。

/*
The methods in the UIContainerViewControllerProtectedMethods and the UIContainerViewControllerCallbacks
categories typically should only be called by subclasses which are implementing new container view
controllers. They may be overridden but must call super.
*/
@interface UIViewController (UIContainerViewControllerProtectedMethods)
//174.添加新类别ContainerViewController，那什么是ContainerViewController，意思就是一个viewController显示的某部分内容属于另一个viewController，那么这个viewController就是一个container，比如UIKit的UINavigationController，UITabBarController

// An array of children view controllers. This array does not include any presented view controllers.
@property(nonatomic,readonly) NSArray *childViewControllers NS_AVAILABLE_IOS(5_0);
//175.数组用来存放子控制器

/*
If the child controller has a different parent controller, it will first be removed from its current parent
by calling removeFromParentViewController. If this method is overridden then the super implementation must
be called.
*/
– (void)addChildViewController:(UIViewController *)childController NS_AVAILABLE_IOS(5_0);
//176.添加子视图控制器

/*
Removes the the receiver from its parent’s children controllers array. If this method is overridden then
the super implementation must be called.
*/
– (void) removeFromParentViewController NS_AVAILABLE_IOS(5_0);
//177.从父控制器中移除子控制器

/*
This method can be used to transition between sibling child view controllers. The receiver of this method is
their common parent view controller. (Use [UIViewController addChildViewController:] to create the
parent/child relationship.) This method will add the toViewController’s view to the superview of the
fromViewController’s view and the fromViewController’s view will be removed from its superview after the
transition completes. It is important to allow this method to add and remove the views. The arguments to
this method are the same as those defined by UIView’s block animation API. This method will fail with an
NSInvalidArgumentException if the parent view controllers are not the same as the receiver, or if the
receiver explicitly forwards its appearance and rotation callbacks to its children. Finally, the receiver
should not be a subclass of an iOS container view controller. Note also that it is possible to use the
UIView APIs directly. If they are used it is important to ensure that the toViewController’s view is added
to the visible view hierarchy while the fromViewController’s view is removed.
*/
– (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion NS_AVAILABLE_IOS(5_0);
//178.不同的view放在不同的viewController中，用到才去创建，那么这个方法是实现两个自控制器的切换，参数fromViewController是当前显示在父控制器中的子视图控制器，toViewController是将要显示的子视图控制器，duration完成过渡时间，options指定的过渡效果，animations动画，completion过渡完成后，回调的block块操作

// If a custom container controller manually forwards its appearance callbacks, then rather than calling
// viewWillAppear:, viewDidAppear: viewWillDisappear:, or viewDidDisappear: on the children these methods
// should be used instead. This will ensure that descendent child controllers appearance methods will be
// invoked. It also enables more complex custom transitions to be implemented since the appearance callbacks are
// now tied to the final matching invocation of endAppearanceTransition.
– (void)beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
//179.beginAppearanceTransition触发相应的viewVWillAppear？？？？？？？？？？？？

– (void)endAppearanceTransition __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_5_0);
//180.endAppearanceTransition触发相应的viewWillDisappear

// Override to return a child view controller or nil. If non-nil, that view controller’s status bar appearance attributes will be used. If nil, self is used. Whenever the return values from these methods change, -setNeedsUpdatedStatusBarAttributes should be called.
– (UIViewController *)childViewControllerForStatusBarStyle NS_AVAILABLE_IOS(7_0);
//181.设置子控制器的状态栏样式

– (UIViewController *)childViewControllerForStatusBarHidden NS_AVAILABLE_IOS(7_0);
//182.实现此方法来指定要控制的状态栏隐藏和取消隐藏状态

// Call to modify the trait collection for child view controllers.
– (void)setOverrideTraitCollection:(UITraitCollection *)collection forChildViewController:(UIViewController *)childViewController NS_AVAILABLE_IOS(8_0);
//183.通过此方法可以为子控制器重新设置traintCollection的值，一般情况下traitCollection值从父controller传到子controller是不做修改的，而我们自己实现一个容器controller的时候，我们可以使用这个方法进行调整

– (UITraitCollection *)overrideTraitCollectionForChildViewController:(UIViewController *)childViewController NS_AVAILABLE_IOS(8_0);
//184.这个方法可以帮助我们获得子控制器的trainCollection值。
@end

@interface UIViewController (UIContainerViewControllerCallbacks)
//185.关于ContainerViewController一些回调方法

/*
This method is consulted to determine if a view controller manually forwards its containment callbacks to
any children view controllers. Subclasses of UIViewController that implement containment logic may override
this method. The default implementation returns YES. If it is overridden and returns NO, then the subclass is
responsible for forwarding the following methods as appropriate – viewWillAppear: viewDidAppear: viewWillDisappear:
viewDidDisappear: willRotateToInterfaceOrientation:duration:
willAnimateRotationToInterfaceOrientation:duration: didRotateFromInterfaceOrientation:
*/

– (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers NS_DEPRECATED_IOS(5_0,6_0);
//186.在iOS5中覆盖此方法可以关闭appearance callbacks的自动传递特性

– (BOOL)shouldAutomaticallyForwardRotationMethods NS_DEPRECATED_IOS(6_0,8_0, “Manually forward viewWillTransitionToSize:withTransitionCoordinator: if necessary”);
//187.在iOS6之后，覆盖此方法可以禁止掉旋转回调自动传递的特性（因为有时候作为容器的childViewController可能不需要这些方法传递给所有的childViewControllers，只需要传递给正在显示的childVieControllrer）

– (BOOL)shouldAutomaticallyForwardAppearanceMethods NS_AVAILABLE_IOS(6_0);
//188.在iOS6之后需要覆盖整个方法来关闭appearance callbacks的自动传递特性

/*
These two methods are public for container subclasses to call when transitioning between child
controllers. If they are overridden, the overrides should ensure to call the super. The parent argument in
both of these methods is nil when a child is being removed from its parent; otherwise it is equal to the new
parent view controller.

addChildViewController: will call [child willMoveToParentViewController:self] before adding the
child. However, it will not call didMoveToParentViewController:. It is expected that a container view
controller subclass will make this call after a transition to the new child has completed or, in the
case of no transition, immediately after the call to addChildViewController:. Similarly
removeFromParentViewController: does not call [self willMoveToParentViewController:nil] before removing the
child. This is also the responsibilty of the container subclass. Container subclasses will typically define
a method that transitions to a new child by first calling addChildViewController:, then executing a
transition which will add the new child’s view into the view hierarchy of its parent, and finally will call
didMoveToParentViewController:. Similarly, subclasses will typically define a method that removes a child in
the reverse manner by first calling [child willMoveToParentViewController:nil].
*/
– (void)willMoveToParentViewController:(UIViewController *)parent NS_AVAILABLE_IOS(5_0);
//189.当addChildViewController:接口建立了逻辑上的父子关系，接口的逻辑中会自动调用willMoveToParentViewController这个方法，在即将移动显示ParentViewController的时候调用

– (void)didMoveToParentViewController:(UIViewController *)parent NS_AVAILABLE_IOS(5_0);
//190.这个方法和上面这个方法类似，在移动显示ParentViewController之后自动调用

@end

@interface UIViewController (UIStateRestoration)
//191.UIStateRestoration提供持久数据的接口

@property (nonatomic, copy) NSString *restorationIdentifier NS_AVAILABLE_IOS(6_0);
//192.这个属性是用来标示是否支持保存，恢复视图状态信息

@property (nonatomic, readwrite, assign) Class restorationClass NS_AVAILABLE_IOS(6_0);
//193.

– (void) encodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
//194.保存视图状态相关信息

– (void) decodeRestorableStateWithCoder:(NSCoder *)coder NS_AVAILABLE_IOS(6_0);
//195.恢复和保持视图状态相关信息

– (void) applicationFinishedRestoringState NS_AVAILABLE_IOS(7_0);
//196.其他对象解码完成后，系统会调用此方法

@end

@interface UIViewController (UIConstraintBasedLayoutCoreMethods)
//197.增加分类基于布局约束的核心方法

/* Base implementation sends -updateConstraints to the view.
When a view has a view controller, this message is sent to the view controller during
the autolayout updateConstraints pass in lieu of sending updateConstraints directly
to the view.
You may override this method in a UIViewController subclass for updating custom
constraints instead of subclassing your view and overriding -[UIView updateConstraints].
Overrides must call super or send -updateConstraints to the view.
*/
– (void)updateViewConstraints NS_AVAILABLE_IOS(6_0);
//198.更新布局约束的方法，viewController的view再更新视图布局时，会先调用这个方法，可以通过重写这个方法去更新当前view的内部布局，而不用再继承这个view去重写updateConstraints方法，记得注意重写时，要调用super或者调用当前view的updateContraints方法。

@end

@protocol UIViewControllerTransitioningDelegate;
//199.viewController过渡的代理协议

@interface UIViewController(UIViewControllerTransitioning)

@property (nonatomic,assign) id transitioningDelegate NS_AVAILABLE_IOS(7_0);
//200.实例化协议属性

@end

@interface UIViewController (UILayoutSupport)
// These objects may be used as layout items in the NSLayoutConstraint API
@property(nonatomic,readonly,retain) id topLayoutGuide NS_AVAILABLE_IOS(7_0);
//201.这个属性是通过计算viewController->view->top到覆盖这个view最下层的那个bar-》bottom的距离

@property(nonatomic,readonly,retain) id bottomLayoutGuide NS_AVAILABLE_IOS(7_0);
//202.这个属性是通过计算viewController->view->bottom到覆盖这个biew上层那个bar-top的距离

@end

@class NSExtensionContext;//？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
//203.引入NSExtensionContext类，iOS8新增的一个跨站上下文属性的extensionContext，来处理containing app与扩展之间的通信，上下文的类型是NSExtensionContext。

@interface UIViewController(NSExtensionAdditions)
//204.添加分类 并且绑定协议

// Returns the extension context. Also acts as a convenience method for a view controller to check if it participating in an extension request.
@property (nonatomic,readonly,retain) NSExtensionContext *extensionContext NS_AVAILABLE_IOS(8_0);
//205.实例化NSExtensionContext属性
