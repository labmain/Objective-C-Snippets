// 告诉self.view约束需要更新
   [self.view setNeedsUpdateConstraints];
   // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
   [self.view updateConstraintsIfNeeded];

   [UIView animateWithDuration:0.3 animations:^{
       [self.view layoutIfNeeded];
   }];
