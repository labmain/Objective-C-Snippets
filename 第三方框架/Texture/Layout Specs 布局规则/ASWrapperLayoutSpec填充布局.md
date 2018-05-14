`ASWrapperLayoutSpec` 是一个简单的 `ASLayoutSpec` 子类，它可以封装了一个 `LayoutElement`，并根据 `LayoutElement` 上设置的大小计算其布局及子元素布局。

`ASWrapperLayoutSpec` 可以轻松的从 `-layoutSpecThatFits:` 中返回一个 `subnode`。 你可以在这个 `subnode` 上设定 `size` ，但是如果你需要设定 `.position` ，请使用 `ASAbsoluteLayoutSpec` 。

```
// 返回一个 subnode
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec 
{
  return ASWrapperLayoutSpec(layoutElement: _subnode)
}

// 设定 size，但不包括 position。
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec 
{
  _subnode.style.preferredSize = CGSize(width: constrainedSize.max.width,
                                        height: constrainedSize.max.height / 2.0)
  return ASWrapperLayoutSpec(layoutElement: _subnode)
}
```