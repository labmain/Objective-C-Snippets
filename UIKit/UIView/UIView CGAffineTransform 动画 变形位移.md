## 位移

## 缩放

## 旋转

## 复原

self.levelImgV.transform = CGAffineTransform.identity

## 复合动画
```Objc
CGAffineTransform rotation = CGAffineTransformMakeRotation(45.0f/180.0f*M_PI);
CGAffineTransform scale = CGAffineTransformMakeScale(1.5f, 1.5f);
CGAffineTransform transform = CGAffineTransformConcat(rotation, scale);
layerView.layer.affineTransform = transform;
```
```Swift
let scale = CGAffineTransform(scaleX: 0.01, y: 0.01)
let trans = CGAffineTransform(translationX: 100, y: 100)
self.contentView.transform = scale.concatenating(trans)
```