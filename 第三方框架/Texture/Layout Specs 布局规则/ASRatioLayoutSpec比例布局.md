`ASRatioLayoutSpec` 可以以固定的宽高比来缩放子节点。 这个规则必须将一个宽度或高度传递给它作为一个 `constrainedSize`，因为它使用这个值来进行计算。


使用 `ASRatioLayoutSpec` 为 `ASNetworkImageNode` 或 `ASVideoNode` 提供固有大小是非常常见的，因为两者在内容从服务器返回之前都没有固有大小。

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  // 将 subnode 缩放一半
  let subnode = ASDisplayNodeWithBackgroundColor(UIColor.green, CGSize(width: 100, height: 100.0))
  let ratioSpec = ASRatioLayoutSpec(ratio: 0.5, child: subnode)
  return ratioSpec
}
```
