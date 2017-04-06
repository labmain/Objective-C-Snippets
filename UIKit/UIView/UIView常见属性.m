// UIView是否接受events事件，默认为YES
BOOL userInteractionEnabled;
// 用于做标识所用，默认为0
NSInteger tag;
// Core Animation layer有关，在常用方法中再详细讲解
CALayer  *layer;
// UIView在父视图中的位置
CGRect            frame;
// UIView相对自己的位置
CGRect            bounds;
// UIView的中心点. animatable
CGPoint           center;
// 线性代数里面讲的矩阵变换，这个是恒等变换,一般用来旋转，缩放
CGAffineTransform transform;
// 修改contentScaleFactor可以让UIView的渲染精度提高，这样即使在CGAffineTransform放大之后仍然能保持锐利。
CGFloat contentScaleFactor;
// 是否允许多点触摸
BOOL multipleTouchEnabled;
// default is NO
BOOL       exclusiveTouch;
// UIView的背影颜色
UIColor   backgroundColor;
// UIView是否隐藏
BOOL hidden;
// 为0时完全透明，为1时完全不透明。
CGFloat  alpha;
//在类的层次结构中，如果clipsTobounds设为YES,超出superView的部分subview就不会显示，否则会做显示， 默认情况下是NO。
BOOL clipsToBounds;
//这是一个优化属性，如果该值为YES, 那么绘图在绘制该视图的时候把整个视图当作不透明对待。这样，绘图系统在执行绘图过程中会优化一些操作并提升系统性能；如果是设置为NO, 绘图系统将其和其他内容平等对待，不去做优化操作。为了性能方面的考量，默认被置为YES(意味着‘优化’)。
BOOL opaque;

UIView  *superview;// 父视图
NSArray *subviews;// 子视图
注：frame和center都是相对于父视图的，bounds是相对于自身的。当view完全透明和隐藏时不能响应事件。
opaque和alpha 是有关系的。 一个不透明视图需要整个边界里面的内容都是不透明的。基于这个原因，opaque设置为YES，要求对应的alpha必须为1.0。如果一个UIView实例opaque被设置为YES, 而同时它又没有完全填充它的边界(bounds),或者它包含了整个或部分的透明的内容视图，那么将会导致未知的结果。 因此，如果视图部分或全部支持透明，那么你必须把opaque这个值设置为NO.
