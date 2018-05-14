`ASLayoutSize` 类似于 `CGSize`，但是它的**宽度和高度可以同时使用 pt 值或百分比值**。 宽度和高度的类型是独立的，它们的值类型可以不同。

```
ASLayoutSizeMake(_ width: ASDimension, _ height: ASDimension)
```

`ASLayoutSize` 用于描述布局元素的 `.preferredLayoutSize`，`.minLayoutSize` 和 `.maxLayoutSize` 属性，它允许在一个 API 中同时使用固定值和相对值。