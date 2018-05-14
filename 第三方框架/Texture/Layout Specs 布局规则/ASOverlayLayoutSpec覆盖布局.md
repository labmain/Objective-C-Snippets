`ASOverlayLayoutSpec` 将其上面的子节点(红色)延伸，覆盖一个子节点(蓝色)。

`overlaySpec` 的 `size` 根据子节点的 `size` 计算， 在下图中，子节点是蓝色的层，然后将子节点的 `size` 作为 `constrainedSize` 传递给叠加布局元素(红色)， 因此，重要的一点是，子节点(蓝色)必须具有固有大小或明确设置 `size`。


当使用 `ASOverlayLayoutSpec` 进行自动的子节点管理时，节点有时会表现出错误的顺序，这是一个已知的问题，并且很快就会解决。当前的解决方法是手动添加节点，布局元素(红色)必须作为子节点添加到父节点后面的子节点(蓝色)。

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  let backgroundNode = ASDisplayNodeWithBackgroundColor(UIColor.blue)
  let foregroundNode = ASDisplayNodeWithBackgroundColor(UIColor.red)
  return ASOverlayLayoutSpec(child: backgroundNode, overlay: foregroundNode)
}
```
