Content Hugging Priority 视图抗拉伸优先级
值越小,越先被拉伸

Content Compression Resistance 抗压缩优先级
值越小,越先被压缩,

```swift
view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
view.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
```