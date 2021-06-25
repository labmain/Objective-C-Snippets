```swift
for view in stackView.arrangedSubviews {
    stackView.removeArrangedSubview(view)
    // 记得也要从父视图移除
    view.removeSubviews()
}
```