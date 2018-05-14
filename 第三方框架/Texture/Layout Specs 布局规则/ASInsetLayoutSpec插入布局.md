在布局过程中，`ASInsetLayoutSpec` 将其 `constrainedSize.max` 减去其 insets 的 `CGSize` 传递给它的子节点， 一旦子节点确定了它的 `size`，`insetSpec` 将它的最终 `size` 作为子节点的 `size` 和 `margin` 。

由于 `ASInsetLayoutSpec` 是根据其子节点的 `size` 来确定的，因此子节点必须具有固有大小或明确设置其 `size` 。


```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  ...
  let insets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
  let headerWithInset = ASInsetLayoutSpec(insets: insets, child: textNode)
  ...
}
```

如果在你将 `UIEdgeInsets` 中的一个值设置为 INFINITY，则 `insetSpec` 将只使用子节点的固有大小，请看 `图像上覆盖文本` 这个例子。