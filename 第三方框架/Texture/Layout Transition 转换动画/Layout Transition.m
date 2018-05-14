使用 Layout Transition API 必须使用自动子节点管理功能。

// self.automaticallyManagesSubnodes = YES;

self.signupNode.fieldState = SignupNodeAge;

[self.signupNode transitionLayoutWithAnimation:YES];

- (void)animateLayoutTransition:(id<ASContextTransitioning>)context
{
  if (self.fieldState == SignupNodeName) {
    CGRect initialNameFrame = [context initialFrameForNode:self.ageField];
    initialNameFrame.origin.x += initialNameFrame.size.width;
    self.nameField.frame = initialNameFrame;
    self.nameField.alpha = 0.0;
    CGRect finalAgeFrame = [context finalFrameForNode:self.nameField];
    finalAgeFrame.origin.x -= finalAgeFrame.size.width;
    [UIView animateWithDuration:0.4 animations:^{
      self.nameField.frame = [context finalFrameForNode:self.nameField];
      self.nameField.alpha = 1.0;
      self.ageField.frame = finalAgeFrame;
      self.ageField.alpha = 0.0;
    } completion:^(BOOL finished) {
      [context completeTransition:finished];
    }];
  } else {
    CGRect initialAgeFrame = [context initialFrameForNode:self.nameField];
    initialAgeFrame.origin.x += initialAgeFrame.size.width;
    self.ageField.frame = initialAgeFrame;
    self.ageField.alpha = 0.0;
    CGRect finalNameFrame = [context finalFrameForNode:self.ageField];
    finalNameFrame.origin.x -= finalNameFrame.size.width;
    [UIView animateWithDuration:0.4 animations:^{
      self.ageField.frame = [context finalFrameForNode:self.ageField];
      self.ageField.alpha = 1.0;
      self.nameField.frame = finalNameFrame;
      self.nameField.alpha = 0.0;
    } completion:^(BOOL finished) {
      [context completeTransition:finished];
    }];
  }
}