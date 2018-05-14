根据水平位置和垂直位置的设定，将一个子节点放置在九宫格布局规则中的任意位置。

这是一个非常强大的布局规则，但是它非常复杂，在这个概述中无法逐一阐述， 有关更多信息，请参阅 `ASRelativeLayoutSpec` 的 `-calculateLayoutThatFits:` 方法和属性。

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  ...
  let backgroundNode = ASDisplayNodeWithBackgroundColor(UIColor.blue)
  let foregroundNode = ASDisplayNodeWithBackgroundColor(UIColor.red, CGSize(width: 70.0, height: 100.0))

  let relativeSpec = ASRelativeLayoutSpec(horizontalPosition: .start,
                                          verticalPosition: .start,
                                          sizingOption: [],
                                          child: foregroundNode)

  let backgroundSpec = ASBackgroundLayoutSpec(child: relativeSpec, background: backgroundNode)
  ...
}
```

