### ASStackLayoutElement Properties

**请注意，以下属性只有在 `ASStackLayout` 的 `subnode`上设置才会生效。**

#### .style.spacingBefore

`CGFloat` 类型，direction 上与前一个 node 的间隔。

#### .style.spacingAfter

`CGFloat` 类型，direction 上与后一个 node 的间隔。

#### .style.flexGrow

`Bool` 类型，子节点尺寸总和小于 minimum ，即存在剩余空间时，是否放大。

#### .style.flexShrink

`Bool` 类型，子节点总和大于 maximum，即空间不足时，是否缩小。

#### .style.flexBasis

`ASDimension` 类型，描述在剩余空间是均分的情况下，应用 `flexGrow` 或 `flexShrink` 属性之前，该对象在盒子中垂直或水平方向的初始 `size`，

#### .style.alignSelf

`ASStackLayoutAlignSelf` 类型，描述对象在十字轴的方向，此属性会覆盖 `alignItems`，可选值有：

* `ASStackLayoutAlignSelfAuto`
* `ASStackLayoutAlignSelfStart`
* `ASStackLayoutAlignSelfEnd`
* `ASStackLayoutAlignSelfCenter`
* `ASStackLayoutAlignSelfStretch`

#### .style.ascender

`CGFloat` 类型，用于基线对齐，描述对象从顶部到其基线的距离。

#### .style.descender

`CGFloat` 类型，用于基线对齐，描述对象从基线到其底部的距离。