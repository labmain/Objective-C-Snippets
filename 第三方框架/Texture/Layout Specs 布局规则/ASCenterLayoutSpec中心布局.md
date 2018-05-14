
`ASCenterLayoutSpec` 将其子节点的中心设置为最大的 `constrainedSize` 的中心。


如果 `ASCenterLayoutSpec` 的宽度或高度没有设定约束，那么它会缩放到和子节点的宽度或高度一致。

`ASCenterLayoutSpec` 有两个属性：

* centeringOptions：

    决定子节点如何在 `ASCenterLayoutSpec` 中居中，可选值包括：None，X，Y，XY。

* sizingOptions：

    决定 `ASCenterLayoutSpec` 占用多少空间，可选值包括：Default，minimum X，minimum Y，minimum XY。

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  let subnode = ASDisplayNodeWithBackgroundColor(UIColor.green, CGSize(width: 60.0, height: 100.0))
  let centerSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: [], child: subnode)
  return centerSpec
}
```
