/* CoreGraphics - CGContext.h */
// 原文出处 http://blog.csdn.net/u014286994/article/details/51333118 (有图片)
/** Graphics state functions. **/
//为了让开发者在进行坐标变换时无须计算多次坐标变换后的累加结果，Quartz 2D还提供了如下两个方法来保存、恢复绘图状态

/*
 保存CGContextRef当前的绘图状态，方便以后恢复该状态*/
void CGContextSaveGState(CGContextRef__nullable c)
// 需要说明的是，CGContextSaveGState()函数保存的绘图状态，不仅包括当前坐标系统的状态，也包括当前设置的填充风格、线条风格、阴影风格等各种绘图状态。但 CGContextSaveGState()函数不会保存当前绘制的图形

/*
 把CGContextRef的状态恢复到最近一次保存时的状态*/
void CGContextRestoreGState(CGContextRef__nullable c)

/** Coordinate space transformations. **/

/* 缩放坐标系统
该方法控制坐标系统水平方向上缩放 sx，垂直方向上缩放 sy。在缩放后的坐标系统上绘制图形时，所有点的 X 坐标都相当于乘以 sx 因子，所有点的 Y 坐标都相当于乘以 sy因子。*/
void CGContextScaleCTM(CGContextRef__nullable c, CGFloat sx, CGFloat sy)

/* 平移坐标系统
 该方法相当于把原来位于 (0, 0) 位置的坐标原点平移到 (tx, ty)点。在平移后的坐标系统上绘制图形时，所有坐标点的 X坐标都相当于增加了 tx，所有点的 Y坐标都相当于增加了 ty。*/
void CGContextTranslateCTM(CGContextRef__nullable c,
    CGFloat tx, CGFloat ty)

/* 旋转坐标系统
 该方法控制坐标系统旋转 angle 弧度。在缩放后的坐标系统上绘制图形时，所有坐标点的 X、Y坐标都相当于旋转了 angle弧度之后的坐标。*/
void CGContextRotateCTM(CGContextRef__nullable c, CGFloat angle)

/*
 使用 transform变换矩阵对 CGContextRef的坐标系统执行变换，通过使用坐标矩阵可以对坐标系统执行任意变换。*/
void CGContextConcatCTM(CGContextRef__nullable c,
    CGAffineTransform transform)

/* 获取CGContextRef的坐标系统的变换矩阵*/
CGAffineTransform CGContextGetCTM(CGContextRef__nullable c)

/** Drawing attribute functions. **/

/*
 设置绘制直线、边框时的线条宽度*/
void CGContextSetLineWidth(CGContextRef__nullable c, CGFloat width)

/*
 设置线段端点的绘制形状。该属性支持如下三个值。*/
typedef CF_ENUM(int32_t, CGLineCap) {
    kCGLineCapButt, //该属性值指定不绘制端点，线条结尾处直接结束。这是默认值。
    kCGLineCapRound,//该属性值指定绘制圆形端点，线条结尾处绘制一个直径为线条宽度的半圆。
    kCGLineCapSquare//该属性值指定绘制方形端点。线条结尾处绘制半个边长为线条宽度的正方形。需要说明的是，这种形状的端点与“butt”形状的端点十分相似，只是采用这种形式的端点的线条略长一点而已
};
void CGContextSetLineCap(CGContextRef__nullable c, CGLineCap cap)

typedef CF_ENUM(int32_t, CGLineJoin) {
    kCGLineJoinMiter, // 这是默认的属性值。该方格的连接点形状如图1所示。
    kCGLineJoinRound, // 稍微圆角, 该方格的连接点形状如图2所示。
    kCGLineJoinBevel  // 斜角,该方格的连接点形状如图3所示。
};
图1     图2    图3
/*
 设置线条连接点的风格，该属性支持如上三个值：*/
void CGContextSetLineJoin(CGContextRef__nullable c, CGLineJoin join)

/*
 当把连接点风格设为meter风格时，该方法用于控制锐角箭头的长度*/
void CGContextSetMiterLimit(CGContextRef__nullable c, CGFloat limit)


/*
 Linedash pattern(虚线模式)允许我们沿着描边绘制虚线。我们通过在CGContextSetLineDash结构体中指定虚线数组和虚线相位来控制虚线的大小及位置。
其中lengths属性指定了虚线段的长度，该值是在绘制片断与未绘制片断之间交替。phase属性指定虚线模式的起始点。图3-11显示了虚线模式：*/
void CGContextSetLineDash(CGContextRef__nullable c, CGFloat phase,const CGFloat *__nullable lengths, size_t count)

/* 设置弯曲的路径中的图形上下文的准确性。*/
void CGContextSetFlatness(CGContextRef__nullable c, CGFloat flatness)

/*
 设置全局透明度*/
void CGContextSetAlpha(CGContextRef__nullable c, CGFloat alpha)

/*
设置CGContextRef的叠加模式。Quartz 2D支持多种叠加模
*/void CGContextSetBlendMode(CGContextRef __nullable c, CGBlendMode mode)

/** Path construction functions. **/

/* Note that a context has a single path in use at any time: a path is not
   part of the graphics state. */

/* 开始创建路径. */
void CGContextBeginPath(CGContextRef__nullable c)

/* 开始一个新的子路径点 */
void CGContextMoveToPoint(CGContextRef__nullable c,
    CGFloat x, CGFloat y)

/* 添加一条直线段从当前指向的(x,y)。 */
void CGContextAddLineToPoint(CGContextRef__nullable c,
    CGFloat x, CGFloat y)

/**
 *  从当前添加一个三次Bezier曲线
 *  @param cp1x 控制点1 x坐标
 *  @param cp1y 控制点1 y坐标
 *  @param cp2x 控制点2 x坐标
 *  @param cp2y 控制点2 y坐标
 *  @param x    直线的终点 x坐标
 *  @param y    直线的终点 y坐标
 */
void CGContextAddCurveToPoint(CGContextRef__nullable c, CGFloat cp1x, CGFloat cp1y, CGFloat cp2x, CGFloat cp2y, CGFloat x, CGFloat y)

/**
 *  从当前添加一个二次Bezier曲线
 *  @param cpx 控制点 x坐标
 *  @param cpy 控制点 y坐标
 *  @param x   直线的终点 x坐标
 *  @param y   直线的终点 y坐标
 */
void CGContextAddQuadCurveToPoint(CGContextRef__nullable c, CGFloat cpx, CGFloat cpy,CGFloat x,CGFloat y)

/* 关闭当前上下文的子路径,且当前点和起点连接起来 */
void CGContextClosePath(CGContextRef__nullable c)

/** Path construction convenience functions. **/

/* 添加一个矩形路径 */
void CGContextAddRect(CGContextRef__nullable c, CGRect rect)

/* 添加多个矩形路径 */
void CGContextAddRects(CGContextRef__nullable c,
    const CGRect * __nullable rects, size_t count)

/* 添加多条直线路径*/
void CGContextAddLines(CGContextRef__nullable c,
    const CGPoint * __nullable points, size_t count)

/* 根据一个矩形,绘制椭圆（圆形 */
void CGContextAddEllipseInRect(CGContextRef__nullable c, CGRect rect)

/**
 *  添加弧形对象
 *  @param x          中心点x坐标
 *  @param y          中心点y坐标
 *  @param radius     半径
 *  @param startAngle 起始弧度
 *  @param endAngle   终止弧度
 *  @param clockwise  是否逆时针绘制，0则顺时针绘制
 */
void CGContextAddArc(CGContextRef__nullable c, CGFloat x,CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle,int clockwise)


/* 这个函数使用一个序列的三次贝塞尔曲线创建一个弧
 原理:首先画两条线，这两条线分别是 current point to (x1,y1)和(x1,y1) to (x2,y2).这样就是出现一个以(x1,y1)为顶点的两条射线，然后定义半径长度，这个半径是垂直于两条射线的，这样就能决定一个圆了，如果当前点和第一个切点的弧(起点)是不平等的,那么会添加一条直线段从当前指向第一个切点。弧的终点成为新的当前点的路径。*/

void CGContextAddArcToPoint(CGContextRef__nullable c, CGFloat x1, CGFloat y1, CGFloat x2, CGFloat y2, CGFloat radius)

/*添加路径到图形上下文 */

void CGContextAddPath(CGContextRef__nullable c, CGPathRef__nullable path)

/** Path stroking. **/

/*
 使用绘制当前路径时覆盖的区域作为当前CGContextRef中的新路径。举例来说，假如当前CGContextRef包含一个圆形路径且线宽为10，调用该方法后，当前CGContextRef将包含一个环宽为10的环形路径*/
void CGContextReplacePathWithStrokedPath(CGContextRef__nullable c)

/** Path information functions. **/

/* 表示目前的路径是否包含任何的子路径 */
bool CGContextIsPathEmpty(CGContextRef__nullable c)

/* 返回一个非空的路径中的当前点。 */
CGPoint CGContextGetPathCurrentPoint(CGContextRef__nullable c)

/* 返回包含当前路径的最小矩形。*/
CGRect CGContextGetPathBoundingBox(CGContextRef__nullable c)

/* Return a copy of the path of `context'. The returned path is specified in
   the current user space of `context'. */

CGPathRef __nullableCGContextCopyPath(CGContextRef__nullable c)

/* 检查当前路径中是否包含指定的点。 */
bool CGContextPathContainsPoint(CGContextRef__nullable c,
    CGPoint point, CGPathDrawingMode mode)

/** Path drawing functions. **/

typedef CF_ENUM (int32_t, CGPathDrawingMode) {
  kCGPathFill,//只有填充（非零缠绕数填充），不绘制边框  如图1
  kCGPathEOFill,//奇偶规则填充（多条路径交叉时，奇数交叉填充，偶交叉不填充）如图2
  kCGPathStroke,        // 只有边框  如图3
  kCGPathFillStroke,    // 既有边框又有填充  如图4
  kCGPathEOFillStroke   // 奇偶填充并绘制边框  如图5
};
图1 图2图3图4图5
/*
 使用指定模式绘制当前CGContextRef中所包含的路径。CGPathDrawingMode 属性如上*/

void CGContextDrawPath(CGContextRef__nullable c, CGPathDrawingMode mode)

/** Path drawing convenience functions. **/

/*
 填充该路径包围的区域*/
void CGContextFillPath(CGContextRef__nullable c)

/*
 使用奇偶规则来填充该路径包围的区域。奇偶规则指：如果某个点被路径包围了奇数次，系统绘制该点；如果被路径包围了偶数次，系统不绘制*/
void CGContextEOFillPath(CGContextRef__nullable c)

/*
 使用当前 CGContextRef设置的线宽绘制路径*/
void CGContextStrokePath(CGContextRef__nullable c)

/*
 填充rect代表的矩形*/
void CGContextFillRect(CGContextRef__nullable c, CGRect rect)

/*
 填充多个矩形
*/
void CGContextFillRects(CGContextRef__nullable c,
    const CGRect * __nullable rects, size_t count)

/*
 使用当前 CGContextRef设置的线宽绘制矩形框*/
void CGContextStrokeRect(CGContextRef__nullable c, CGRect rect)

/*
 使用指定线宽绘制矩形框*/
void CGContextStrokeRectWithWidth(CGContextRef__nullable c,
    CGRect rect, CGFloat width)

/*
 擦除指定矩形区域上绘制的图形*/
void CGContextClearRect(CGContextRef__nullable c, CGRect rect)

/*
 填充rect矩形的内切椭圆区域*/
void CGContextFillEllipseInRect(CGContextRef__nullable c,
    CGRect rect)

/*
 使用当前 CGContextRef设置的线宽绘制rect矩形的内切椭圆*/
void CGContextStrokeEllipseInRect(CGContextRef__nullable c, CGRect rect)

/*
     CGContextBeginPath(context);
     for (k = 0; k < count; k += 2) {
       CGContextMoveToPoint(context, s[k].x, s[k].y);
       CGContextAddLineToPoint(context, s[k+1].x, s[k+1].y);
     }
     CGContextStrokePath(context);
 使用当前 CGContextRef设置的线宽绘制多条线段。该方法需要传入2N个CGPoint组成的数组，其中1、2个点组成第一条线段，3、4个点组成第2条线段，以此类推*/
void CGContextStrokeLineSegments(CGContextRef__nullable c,
    const CGPoint * __nullable points, size_t count)

/** Clipping functions. **/

/* 修改当前剪贴路径，使用非零绕数规则。 */
void CGContextClip(CGContextRef__nullable c)

/* 修改当前剪贴路径，使用奇偶规则。 */
void CGContextEOClip(CGContextRef__nullable c)

/*  剪切遮罩处理(针对图片）*/
void CGContextClipToMask(CGContextRef__nullable c, CGRect rect, CGImageRef__nullable mask)


/* 获取到了需要绘制的图形上下文的位置与大小*/

CGRect CGContextGetClipBoundingBox(CGContextRef__nullable c)


/** Clipping convenience functions. **/

/* 剪切指定矩形区域外的部分. */
void CGContextClipToRect(CGContextRef__nullable c, CGRect rect)


/* 剪切指定多个矩形区域外的部分 */
void CGContextClipToRects(CGContextRef__nullable c,const CGRect *  rects, size_t count)


/** Primitive color functions. **/

/*
 使用指定颜色来设置该CGContextRef的填充颜色*/
void CGContextSetFillColorWithColor(CGContextRef__nullable c,
    CGColorRef __nullable color)

/*
 使用指定颜色来设置该CGContextRef的线条颜色*/
void CGContextSetStrokeColorWithColor(CGContextRef__nullable c,
    CGColorRef __nullable color)

/** Color space functions. **/

/* 颜色空间填充 */
void CGContextSetFillColorSpace(CGContextRef__nullable c, CGColorSpaceRef__nullable space)

/* 设置线框颜色空间 */

void CGContextSetStrokeColorSpace(CGContextRef__nullable c,
    CGColorSpaceRef __nullable space)

/** Color functions. **/

/* 设置填充颜色空间 CGFloat redColor[4] = {1.0,0,0,1.0};*/
void CGContextSetFillColor(CGContextRef__nullable c,const CGFloat *__nullable components(redColor))

/* 设置画笔颜色 CGFloat redColor[4] = {1.0,0,0,1.0};*/
void CGContextSetStrokeColor(CGContextRef__nullable c,const CGFloat *__nullable components(redColor))

/** Pattern functions. **/

/*
 设置该CGContextRef使用位图填充*/
void CGContextSetFillPattern(CGContextRef__nullable c, CGPatternRef__nullable pattern,const CGFloat * __nullable components)

/*
 设置该CGContextRef使用位图绘制线条、边框*/
void CGContextSetStrokePattern(CGContextRef__nullable c, CGPatternRef__nullable pattern,const CGFloat * __nullable components)

/*
 设置该CGContextRef采用位图填充的相位*/
void CGContextSetPatternPhase(CGContextRef__nullable c, CGSize phase)

/** Color convenience functions. **/

/*
 使用灰色来设置该CGContextRef的填充颜色*/
void CGContextSetGrayFillColor(CGContextRef__nullable c,
    CGFloat gray, CGFloat alpha)

/*
 使用灰色来设置该CGContextRef的线条颜色*/
void CGContextSetGrayStrokeColor(CGContextRef__nullable c,
    CGFloat gray, CGFloat alpha)

/*
 使用RGB颜色模式来设置该CGContextRef的填充颜色*/
void CGContextSetRGBFillColor(CGContextRef__nullable c, CGFloat red,
    CGFloat green, CGFloat blue, CGFloat alpha)

/* 设置画笔颜色 */
void CGContextSetRGBStrokeColor(CGContextRef__nullable c,
    CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)

/*
 使用CMYK颜色模式来设置该CGContextRef的填充颜色*/
void CGContextSetCMYKFillColor(CGContextRef__nullable c,
    CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha)

/*
 使用CMYK颜色模式来设置该CGContextRef的线条颜色*/
void CGContextSetCMYKStrokeColor(CGContextRef__nullable c,
    CGFloat cyan, CGFloat magenta, CGFloat yellow, CGFloat black, CGFloat alpha)

/** Rendering intent. **/

/* 在当前图形状态设置渲染意向 */
void CGContextSetRenderingIntent(CGContextRef__nullable c,
    CGColorRenderingIntent intent)

/** Image functions. **/

/* 绘制图像到图形上下文中 */
void CGContextDrawImage(CGContextRef__nullable c, CGRect rect,
    CGImageRef __nullable image)

/* 重复绘制的图像，扩展到提供的矩形，填补当前剪辑区域。 */
void CGContextDrawTiledImage(CGContextRef__nullable c, CGRect rect,
    CGImageRef __nullable image)

/*
  获取当前CGContextRef在放大图片时的插值质量*/
CGInterpolationQuality CGContextGetInterpolationQuality(CGContextRef__nullable c)

/*
  设置图形上下文的插值质量水平。*/
void CGContextSetInterpolationQuality(CGContextRef__nullable c,
    CGInterpolationQuality quality)

/** Shadow support. **/

/*
 设置阴影在X、Y方向上的偏移，以及模糊度和阴影的颜色
*/
void CGContextSetShadowWithColor(CGContextRef__nullable c,
    CGSize offset, CGFloat blur, CGColorRef __nullable color)


/*
 设置阴影在X、Y方向上的偏移，以及模糊度（blur值越大，阴影越模糊）。该函数没有设置阴影颜色，
默认使用1/3透明的黑色（即RGBA{0, 0, 0, 1.0/3.0}）作为阴影颜色
*/

void CGContextSetShadow(CGContextRef__nullable c, CGSize offset,
    CGFloat blur)


/** Gradient and shading functions. **/

/* 绘制一个渐变填充定义的出发点和落脚点沿线变化。*/
void CGContextDrawLinearGradient(CGContextRef__nullable c,
    CGGradientRef __nullable gradient, CGPoint startPoint, CGPoint endPoint,
    CGGradientDrawingOptions options)


/* 绘制一个沿着由所提供的开始和结束的圆限定的区域变化的渐变填充。 */
void CGContextDrawRadialGradient(CGContextRef__nullable c,
    CGGradientRef __nullable gradient, CGPoint startCenter, CGFloat startRadius,
    CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)


/* 使用指定的阴影的背景，填充剪切路径。 */
void CGContextDrawShading(CGContextRef __nullable c,
    __nullable CGShadingRef shading)


/** Text functions. **/

/* 设置当前字符间距. */
void CGContextSetCharacterSpacing(CGContextRef__nullable c,
    CGFloat spacing)


/* 设置要绘制文本的位置。 */
void CGContextSetTextPosition(CGContextRef__nullable c,
    CGFloat x, CGFloat y)


/* 返回在绘制文本的位置。 */
CGPoint CGContextGetTextPosition(CGContextRef __nullable c)


/* 设置当前文本矩阵。 */
void CGContextSetTextMatrix(CGContextRef__nullable c,
    CGAffineTransform t)

/* 返回当前文本矩阵。 */
CGAffineTransform CGContextGetTextMatrix(CGContextRef__nullable c)

/* 设置当前文本的绘图模式。 */
void CGContextSetTextDrawingMode(CGContextRef__nullable c,
    CGTextDrawingMode mode)

/* 设置上下文的字体 */
void CGContextSetFont(CGContextRef__nullable c,
    CGFontRef __nullable font)

/* 设置上下文的字体大小。 */
void CGContextSetFontSize(CGContextRef__nullable c, CGFloat size)


/* 在所提供的位置绘制字形。 */
void CGContextShowGlyphsAtPositions(CGContextRef__nullable c,
    const CGGlyph * __nullable glyphs, const CGPoint * __nullable Lpositions,
    size_t count)


/** PDF functions. **/

/* 绘制一个PDF页面到当前的用户空间。 */
void CGContextDrawPDFPage(CGContextRef__nullable c,
    CGPDFPageRef __nullable page)


/** Output page functions. **/

/* 基于页面的图形上下文中开始了新的一页。 */
void CGContextBeginPage(CGContextRef__nullable c,const CGRect *__nullable mediaBox)


/* 在基于页面的图形上下文结束当前的页面。 */
void CGContextEndPage(CGContextRef__nullable c)


/** Context functions. **/

/* 图形上下文的引用计数+1 */
CGContextRef __nullableCGContextRetain(CGContextRef__nullable c)


/* 图形上下文的引用计数-1. */
void CGContextRelease(CGContextRef__nullable c)


/* 强制所有挂起的绘图操作在一个窗口上下文中立即被渲染到目标设备 */
void CGContextFlush(CGContextRef__nullable c)


/* 将一个窗口的图像上下文内容更新，即所有的绘图操作都会在下次同步到窗口上. */
void CGContextSynchronize(CGContextRef__nullable c)


/** Antialiasing functions. **/

/*
 设置该CGContextRef是否应该抗锯齿（即光滑图形曲线边缘）*/
void CGContextSetShouldAntialias(CGContextRef__nullable c,
    bool shouldAntialias)

/*
 设置该CGContextRef是否允许抗锯齿*/
void CGContextSetAllowsAntialiasing(CGContextRef__nullable c,
    bool allowsAntialiasing)

/** Font display functions. **/

/*
 设置该CGContextRef是否允许光滑字体*/
void CGContextSetShouldSmoothFonts(CGContextRef__nullable c,
    bool shouldSmoothFonts)

/*
 设置该CGContextRef是否允许光滑字体*/
void CGContextSetAllowsFontSmoothing(CGContextRef__nullable c,
    bool allowsFontSmoothing)

// Enables or disables subpixel positioning in a graphics context.
void CGContextSetShouldSubpixelPositionFonts(
    CGContextRef __nullable c, bool shouldSubpixelPositionFonts)


// Sets whether or not to allow subpixel positioning for a graphics context
void CGContextSetAllowsFontSubpixelPositioning(
    CGContextRef __nullable c, bool allowsFontSubpixelPositioning)


// Enables or disables subpixel quantization in a graphics context.
void CGContextSetShouldSubpixelQuantizeFonts(
    CGContextRef __nullable c, bool shouldSubpixelQuantizeFonts)


// Sets whether or not to allow subpixel quantization for a graphics context
void CGContextSetAllowsFontSubpixelQuantization(
    CGContextRef __nullable c, bool allowsFontSubpixelQuantization)


/** Transparency layer support. **/

/* 开始一个透明层。
 直到相应的调用CGContextEndTransparencyLayer，在指定范围内的所有后续绘制操作组合到一个完全透明的背景（它被视为一个单独的目标缓冲区从上下文）。

在透明层中绘制需要三步：
 1.  调用函数 CGContextBeginTransparencyLayer
 2.  在透明层中绘制需要组合的对象
 3.  调用函数 CGContextEndTransparencyLayer*/
void CGContextBeginTransparencyLayer(CGContextRef__nullable c,
    CFDictionaryRef __nullable auxiliaryInfo)


/* 开始透明度层，它的边界是指定的矩形，其内容是有界的。 */
void CGContextBeginTransparencyLayerWithRect(
    CGContextRef __nullable c, CGRect rect, CFDictionaryRef__nullable auxInfo)


/* 结束一个透明层。 */
void CGContextEndTransparencyLayer(CGContextRef__nullable c)

/** User space to device space tranformations. **/

/*  获取Quartz转换用户空间和设备空间的仿射变换 */
CGAffineTransform CGContextGetUserSpaceToDeviceSpaceTransform(CGContextRef__nullable c)

/*———— 点 ————*/
/* 将一个CGPoint数据结构从一个空间变换到另一个空间(DeviceSpace). */
CGPoint CGContextConvertPointToDeviceSpace(CGContextRef__nullable c,
    CGPoint point)

/* 将一个CGPoint数据结构从一个空间变换到另一个空间(UserSpace). */
CGPoint CGContextConvertPointToUserSpace(CGContextRef__nullable c,
    CGPoint point)

/*———— 大小 ————*/
/* 将一个CGSize数据结构从一个空间变换到另一个空间(DeviceSpace). */
CGSize CGContextConvertSizeToDeviceSpace(CGContextRef__nullable c, CGSize size)


/* 将一个CGSize数据结构从一个空间变换到另一个空间(UserSpace). */
CGSize CGContextConvertSizeToUserSpace(CGContextRef__nullable c, CGSize size)


/*———— 矩形 ————*/
/* 将一个CGPoint数据结构从一个空间变换到另一个空间(DeviceSpace)。 */

CGRect CGContextConvertRectToDeviceSpace(CGContextRef__nullable c,
    CGRect rect)

/* 将一个CGPoint数据结构从一个空间变换到另一个空间(UserSpace)。 */
CGRect CGContextConvertRectToUserSpace(CGContextRef__nullable c,
    CGRect rect)


/** Deprecated functions. **/
DEPRECATED…
/* 设置在一个图形上下文的字体和字体大小 */
void CGContextSelectFont(CGContextRef__nullable c,
    const char *__nullable name, CGFloat size, CGTextEncoding textEncoding)

/* 在当前文本位置，由目前的文本矩阵指定的点显示一个字符数组。 */
void CGContextShowText(CGContextRef__nullable c,
    const char *__nullable string, size_t length)

/* 在指定的位置显示一个字符串。 */
void CGContextShowTextAtPoint(CGContextRef__nullable c,
    CGFloat x, CGFloat y, const char * __nullable string, size_t length)

/* 在当前文本位置显示一个数组的字形。 */
void CGContextShowGlyphs(CGContextRef__nullable c,
    const CGGlyph * __nullable g, size_t count)

/* 在指定的位置显示一个数组的字形。 */
void CGContextShowGlyphsAtPoint(CGContextRef__nullable c, CGFloat x,
    CGFloat y, const CGGlyph * __nullable glyphs, size_t count)

/* 绘制具有不同的偏移量的一个数组字形。 */
void CGContextShowGlyphsWithAdvances(CGContextRef__nullable c,
    const CGGlyph * __nullable glyphs, const CGSize * __nullable advances,
    size_t count)

/* DEPRECATED; use the CGPDFPage API instead. */
void CGContextDrawPDFDocument(CGContextRef__nullable c, CGRect rect, CGPDFDocumentRef__nullable document,int page)
DEPRECATED…
