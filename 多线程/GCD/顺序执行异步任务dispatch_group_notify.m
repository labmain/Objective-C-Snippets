dispatch_group_t serviceGroup = dispatch_group_create();

// Start the first task
dispatch_group_enter(serviceGroup);

[self startTask:5  Block:^(BOOL success) {
    dispatch_group_leave(serviceGroup);
}];

// Start the second task
dispatch_group_enter(serviceGroup);

[self startTask:5 Block:^(BOOL success) {
    dispatch_group_leave(serviceGroup);
}];

dispatch_group_notify(serviceGroup,dispatch_get_main_queue(),^{
    NSLog(@"finish");
});

NSLog(@"next");


- (void)startTask:(NSInteger)time Block:(someBlock)block
{
    for (NSInteger i=0; i<time; i++) {
        
        NSLog(@"%ld",i);
    }
    block(YES);
}
