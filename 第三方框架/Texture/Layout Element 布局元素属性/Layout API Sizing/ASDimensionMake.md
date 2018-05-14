`ASDimension` 类型 `auto` 表示布局元素可以根据情况选择最合理的方式。

```
let width = ASDimensionMake(.auto, 0)
let height = ASDimensionMake("50%")

layoutElement.style.preferredLayoutSize = ASLayoutSizeMake(width, height)
```

你也可以使用固定值设置布局元素的 `.preferredSize`、`.minSize`、`.maxSize` 属性。

```
layoutElement.style.preferredSize = CGSize(width: 30, height: 60)
```

大多数情况下，你不需要要限制宽度和高度。如果你需要，可以使用 `ASDimension` 值单独设置布局元素的 `size` 属性：

```
layoutElement.style.width     = ASDimensionMake("50%")
layoutElement.style.minWidth  = ASDimensionMake("50%")
layoutElement.style.maxWidth  = ASDimensionMake("50%")

layoutElement.style.height    = ASDimensionMake("50%")
layoutElement.style.minHeight = ASDimensionMake("50%")
layoutElement.style.maxHeight = ASDimensionMake("50%")
```