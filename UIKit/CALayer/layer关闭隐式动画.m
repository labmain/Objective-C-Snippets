[CATransaction begin];
[CATransaction setDisableActions:YES];
self.myview.layer.position = CGPointMake(10, 10); // layer 的更改放在这里
[CATransaction commit];
