`ASAbsoluteLayoutSpec` 中你可以通过设置它们的 `layoutPosition` 属性来指定其子节点的横纵坐标。 绝对布局比其他类型的布局相比，不太灵活且难以维护。

`ASAbsoluteLayoutSpec` 有一个属性：

* sizing：

    确定 `ASAbsoluteLayoutSpec` 将占用多少空间，可选值包括：Default，Size to Fit。请注意，Size to Fit 将复制旧的 `ASStaticLayoutSpec` 的行为。

```objc
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  let maxConstrainedSize = constrainedSize.max

  // 在一个静态布局中,使用 ASAbsoluteLayoutSpec 布局所有子节点
  guitarVideoNode.style.layoutPosition = CGPoint.zero
  guitarVideoNode.style.preferredSize = CGSize(width: maxConstrainedSize.width, height: maxConstrainedSize.height / 3.0)

  nicCageVideoNode.style.layoutPosition = CGPoint(x: maxConstrainedSize.width / 2.0, y: maxConstrainedSize.height / 3.0)
  nicCageVideoNode.style.preferredSize = CGSize(width: maxConstrainedSize.width / 2.0, height: maxConstrainedSize.height / 3.0)

  simonVideoNode.style.layoutPosition = CGPoint(x: 0.0, y: maxConstrainedSize.height - (maxConstrainedSize.height / 3.0))
  simonVideoNode.style.preferredSize = CGSize(width: maxConstrainedSize.width / 2.0, height: maxConstrainedSize.height / 3.0)

  hlsVideoNode.style.layoutPosition = CGPoint(x: 0.0, y: maxConstrainedSize.height / 3.0)
  hlsVideoNode.style.preferredSize = CGSize(width: maxConstrainedSize.width / 2.0, height: maxConstrainedSize.height / 3.0)

  return ASAbsoluteLayoutSpec(children: [guitarVideoNode, nicCageVideoNode, simonVideoNode, hlsVideoNode])
}
```
