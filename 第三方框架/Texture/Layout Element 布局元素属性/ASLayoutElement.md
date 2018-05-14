### ASLayoutElement Properties

**请注意，以下属性适用于所有布局元素。**

#### .style.width

`ASDimension` 类型，`width` 属性描述了 `ASLayoutElement` 内容区域的宽度。 `minWidth` 和 `maxWidth` 属性会覆盖 `width`， 默认值为 `ASDimensionAuto`。

#### .style.height

`ASDimension` 类型，`height` 属性描述了 `ASLayoutElement` 内容区域的高度。 `minHeight` 和 `maxHeight` 属性会覆盖 `height`，默认值为 `ASDimensionAuto`。

#### .style.minWidth

`ASDimension` 类型，`minWidth` 属性用于设置一个特定布局元素的最小宽度。 它可以防止 `width` 属性的使用值小于 `minWidth` 指定的值，`minWidth` 的值会覆盖 `maxWidth` 和 `width`。 默认值为 `ASDimensionAuto`。

#### .style.maxWidth

`ASDimension` 类型，`maxWidth` 属性用于设置一个特定布局元素的最大宽度。 它可以防止 `width` 属性的使用值大于 `maxWidth` 指定的值，`maxWidth` 的值会覆盖 `width`，`minWidth` 会覆盖 `maxWidth`。 默认值为 `ASDimensionAuto`。

#### .style.minHeight

`ASDimension` 类型，`minHeight` 属性用于设置一个特定布局元素的最小高度。 它可以防止 `height` 属性的使用值小于 `minHeight` 指定的值。 `minHeight` 的值会覆盖 `maxHeight` 和 `height`。 默认值为 `ASDimensionAuto`。

#### .style.maxHeight

`ASDimension` 类型，`maxHeight` 属性用于设置一个特定布局元素的最大高度，它可以防止 `height` 属性的使用值大于 `maxHeight` 指定的值。 `maxHeight` 的值会覆盖 `height`，`minHeight` 会覆盖 `maxHeight`。 默认值为 `ASDimensionAuto`。

#### .style.preferredSize

`CGSize` 类型， 建议布局元素的 `size` 应该是多少。 如果提供了 `minSize` 或 `maxSize` ，并且 `preferredSize` 超过了这些值，则强制使用 `minSize` 或 `maxSize`。 如果未提供 `preferredSize`，则布局元素的 `size` 默认为 `calculateSizeThatFits:` 方法提供的固有大小。

此方法是可选的，但是对于没有固有大小或需要用与固有大小不同的的 size 进行布局的节点，则必须指定 `preferredSize` 或 `preferredLayoutSize` 中的一个，比如没这个属性可以在 `ASImageNode` 上设置，使这个节点的 `size` 和图片 `size` 不同。

**警告：当 size 的宽度或高度是相对值时调用 getter 将进行断言。**

#### .style.minSize

`CGSize` 类型，可选属性，为布局元素提供最小尺寸，如果提供，`minSize` 将会强制使用。 如果父级布局元素的 `minSize` 小于其子级的 `minSize`，则强制使用子级的 `minSize`，并且其大小将扩展到布局规则之外。

例如，如果给全屏容器中的某个元素设置 50％ 的 `preferredSize` 相对宽度，和 200pt 的 `minSize` 宽度，`preferredSize` 会在 iPhone 屏幕上产生 160pt 的宽度，但由于 160pt 低于 200pt 的 `minSize` 宽度，因此最终该元素的宽度会是 200pt。

#### .style.maxSize

`CGSize` 类型，可选属性，为布局元素提供最大尺寸，如果提供，`maxSize` 将会强制使用。 如果子布局元素的 `maxSize` 小于其父级的 `maxSize`，则强制使用子级的 `maxSize`，并且其大小将扩展到布局规则之外。

例如，如果给全屏容器中的某个元素设置 50％ 的 `preferredSize` 相对宽度，和 120pt 的 `maxSize` 宽度，`preferredSize` 会在 iPhone 屏幕上产生 160pt 的宽度，但由于 160pt 高于 120pt 的 `maxSize` 宽度，因此最终该元素的宽度会是 120pt。

#### .style.preferredLayoutSize

`ASLayoutSize` 类型，为布局元素提供建议的相对 `size`。 `ASLayoutSize` 使用百分比而不是点来指定布局。 例如，子布局元素的宽度应该是父宽度的 50％。 如果提供了可选的 `minLayoutSize` 或 `maxLayoutSize`，并且 `preferredLayoutSize` 超过了这些值，则将使用 `minLayoutSize` 或 `maxLayoutSize`。 如果未提供此可选值，则布局元素的 `size` 将默认是 `calculateSizeThatFits:` 提供的固有大小。

#### .style.minLayoutSize

`ASLayoutSize` 类型， 可选属性，为布局元素提供最小的相对尺寸， 如果提供，`minLayoutSize` 将会强制使用。 如果父级布局元素的 `minLayoutSize` 小于其子级的 `minLayoutSize`，则会强制使用子级的 `minLayoutSize`，并且其大小将扩展到布局规则之外。

#### .style.maxLayoutSize

`ASLayoutSize` 类型， 可选属性，为布局元素提供最大的相对尺寸。 如果提供，`maxLayoutSize` 将会强制使用。 如果父级布局元素的 `maxLayoutSize` 小于其子级的 `maxLayoutSize`，那么将强制使用子级的 `maxLayoutSize`，并且其大小将扩展到布局规则之外。



