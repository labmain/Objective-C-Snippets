- (IBAction)watchContentBtnClick:(id)sender {
    //先将未到时间执行前的任务取消。
    [[self class] cancelPreviousPerformRequestsWithTarget:self selector:@selector(todoSomething:) object:sender];
    [self performSelector:@selector(todoSomething:) withObject:sender afterDelay:0.2f];
}

- (void)todoSomething:(id)sender {
    if ([self.watchContentBtn.titleLabel.text isEqualToString:@"不会翻译"]) {
        [self changeBottomState:YES];
        [self addTranslateExercise];
        [self changeAnswerArea:_translateQueAndAns.answer isHighlight:YES];
        self.tipBtn.selected = YES;
    } else {
        [self changeBottomState:NO];
        [self changeAnswerArea:TipLabelText isHighlight:NO];
        self.tipBtn.selected = NO;
    }
}
