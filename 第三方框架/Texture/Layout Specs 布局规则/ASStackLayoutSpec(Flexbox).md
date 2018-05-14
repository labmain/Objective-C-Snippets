在 Texture 中的所有 `layoutSpec` 中，`ASStackLayoutSpec` 是最有用的，也是最强大的。 `ASStackLayoutSpec` 使用 `flexbox` 来确定其子元素的 `size` 和 `position` 。 Flexbox 旨在为不同的屏幕尺寸提供一致的布局， 在盒子布局中，你垂直或水平的对其元素。 盒子布局也可以是另一个盒子的子布局，这使得盒子布局规则几乎可以胜任任何的布局。

除了 `ASLayoutElement` 属性，`ASStackLayoutSpec` 还有 7 个属性：

* direction

    指定子元素的排序方向，如果设置了 `horizontalAlignment` 和 `verticalAlignment`，它们将被再次解析，这会导致 `justifyContent` 和 `alignItems` 也会相应地更新。

* spacing

    描述子元素之间的距离

* horizontalAlignment

    指定子元素如何在水平方向上对齐，它的实际效果取决于 `direction`，设置对齐会使 `justifyContent` 或 `alignItems` 更新。在 `direction` 改变之后，对齐方式仍然有效，因此，这是一个优先级高的属性。

* verticalAlignment

    指定子元素如何在垂直方向上对齐，它的实际效果取决于 `direction`，设置对齐会使 `justifyContent` 或 `alignItems` 更新。在 `direction` 改变之后，对齐方式仍然有效，因此，这是一个优先级高的属性。

* justifyContent

    描述子元素之间的距离。

* alignItems

    描述子元素在十字轴上的方向。

> spacing 和 justifyContent 原文都是 The amount of space between each child.
> 
> spacing 以我的理解应该翻译的没错，但是 justifyContent 感觉不太准确，这几个属性读者可以查阅 CSS 文档自行理解。

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec 
{
  let mainStack = ASStackLayoutSpec(direction: .horizontal,
                                    spacing: 6.0,
                                    justifyContent: .start,
                                    alignItems: .center,
                                    children: [titleNode, subtitleNode])

  // 设置盒子约束大小
  mainStack.style.minWidth = ASDimensionMakeWithPoints(60.0)
  mainStack.style.maxHeight = ASDimensionMakeWithPoints(40.0)

  return mainStack
}
```

Flexbox 在 Web 上的工作方式与在 CSS 中的工作方式相同，单有一些例外。例如，默认值是不同的，没有 `flex` 参数，有关更多信息，请参阅 [Web Flexbox 差异](https://link.juejin.im?target=http%3A%2F%2Ftexturegroup.org%2Fdocs%2Flayout2-web-flexbox-differences.html)。

```objc
/**
    ASStackLayoutSpec :主要用于描述空间之间左右或者上下位置关系。
 *  Stack空间分为2个轴，主轴 和 十字轴，主轴的方向和ASStackLayoutDirection平行。
        如果ASStackLayoutDirection 是水平方向，则主轴方向自左向右，十字轴方向自上向下。
        如果ASStackLayoutDirection 是垂直方向，则主轴方向自上向下，十字轴方向自左向右。
 
    ASStackLayoutJustifyContent :这个属性，用于描述主轴方向上子空间的排列方式。
        ASStackLayoutJustifyContentStart : 在主轴方向上，在父空间中居左排列。
        ASStackLayoutJustifyContentCenter : 在主轴方向上，在父空间中居中排列。
        ASStackLayoutJustifyContentEnd : 在主轴方向上，在父空间中居右排列。
        ASStackLayoutJustifyContentSpaceBetween : 在主轴方向上，在父空间中等间距排列，
        ASStackLayoutJustifyContentSpaceAround : 在主轴方向上，在父空间中每个空间左右间距相等排列。
    
    ASStackLayoutAlignItems :这个属性，用于描述主轴方向上子空间的排列方式。
        ASStackLayoutAlignItemsStart : 在十字轴方向上，居顶排列
        ASStackLayoutAlignItemsEnd   : 在十字轴方向上，居底排列
        ASStackLayoutAlignItemsCenter ：在十字轴方向上，居中排列
        ASStackLayoutAlignItemsStretch : 在十字轴方向上，填充满父空间。
 */
 ```