## navigationBar的translucent属性，控制view的原点位置
* 当`translucent = true`（默认值）时，`UIViewController`中的`self.view`的原点是`(0,0)`
* 当`translucent = false`时，`UIViewController`中的`self.view`的原点是`(0,CGRectGetMaxY(self.navigationController.navigationBar.frame))`