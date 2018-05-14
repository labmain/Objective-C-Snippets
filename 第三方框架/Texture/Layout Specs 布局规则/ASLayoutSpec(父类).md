`ASLayoutSpec` 是所有布局规则的父类，它的主要工作是处理和管理所有的子类，它也可以用来创建自定义的布局规则。不过创建 `ASLayoutSpec` 的自定义子类是一项 `super advanced` 级别的操作，如果你有这方面的需要，建议你尝试将我们提供的布局规则进行组合，以创建更高级的布局。

`ASLayoutSpec` 的另一个用途是应用了 `.flexShrink` 或者 `.flexGrow` 是，在 `ASStackLayoutSpec` 中作为一个 `spacer` 和其他子节点一起使用，

```
override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec
{
  ...
  let spacer = ASLayoutSpec()
  spacer.style.flexGrow = 1.0

  stack.children = [imageNode, spacer, textNode]
  ...
}
```
