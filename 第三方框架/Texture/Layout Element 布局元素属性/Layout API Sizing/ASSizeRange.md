
`UIKit` 没有提供一个机制绑定最小和最大的 `CGSize`，因此，为了支持最小和最大的 `CGSize`，我们创建了 `ASSizeRange`， `ASSizeRange` 主要应用在 Llayout API 的内部，但是 `layoutSpecThatFits:` 方法的的输入参数 `constrainedSize` 是 `ASSizeRange` 类型。

```
func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
```

传递给 `ASDisplayNode` 子类 `layoutSpecThatFits:` 方法的 `constrainedSize` 是 `Node` 最适合的最小和最大尺寸，你可以在布局元素上使用 `constrainedSize` 中包含的最小和最大 `CGSize` 。

