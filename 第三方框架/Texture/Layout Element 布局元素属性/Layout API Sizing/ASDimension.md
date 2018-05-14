
`ASDimension` 基本上是一个正常的 `CGFloat`，支持表示一个 pt 值，一个相对百分比值或一个自动值，这个单位允许一个的 API 同时使用固定值和相对值。

```
// 返回一个相对值
ASDimensionMake("50%")
ASDimensionMakeWithFraction(0.5)

// 返回一个 pt 值
ASDimensionMake("70pt")
ASDimensionMake(70)
ASDimensionMakeWithPoints(70)
```

使用 `ASDimension` 的示例：

`ASDimension`用于设置 `ASStackLayoutSpec` 子元素的 `flexBasis` 属性。 `flexBasis` 属性根据在盒子排序方向是水平还是垂直，来指定对象的初始大小。在下面的视图中，我们希望左边的盒子占据水平宽度的 40％，右边的盒子占据宽度的 60％，这个效果我们可以通过在水平盒子容器的两个 `childen` 上设置 `.flexBasis` 属性来实现：

```
self.leftStack.style.flexBasis = ASDimensionMake("40%")
self.rightStack.style.flexBasis = ASDimensionMake("60%")

horizontalStack.children = [self.leftStack, self.rightStack]]
```