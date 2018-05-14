`ASBackgroundLayoutSpec` 设置一个子节点(蓝色)为内容，将背后的另一个子节点拉伸为背景(红色)。

`ASBackgroundLayoutSpec` 的 `size` 根据子节点的 `size` 确定，在下图中，子节点是蓝色层，子节点的 `size` 作为 `constrainedSize` 传递给背景图层(红色)，因此重要的一点是，子节点(蓝色)必须有一个固有大小或明确设置 `size`。


当使用 `ASOverlayLayoutSpec` 进行自动的子节点管理时，节点有时会表现出错误的顺序，这是一个已知的问题，并且很快就会解决。当前的解决方法是手动添加节点，布局元素(蓝色)必须作为子节点添加到父节点后面的子节点(红色)。

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  let backgroundNode = ASDisplayNodeWithBackgroundColor(UIColor.red)
  let foregroundNode = ASDisplayNodeWithBackgroundColor(UIColor.blue)
  return ASBackgroundLayoutSpec(child: foregroundNode, background: backgroundNode)
}
```

**注意：添加子节点的顺序对于这个布局规则是很重要的。 背景对象必须在前台对象之前作为子节点添加到父节点，目前使用 ASM 不能保证这个顺序一定是正确的！**
