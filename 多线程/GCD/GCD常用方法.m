#AfterGCD(系统自带)
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(<#delayInSeconds#> * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    <#code to be executed after a specified delay#>
});

#子线程完成后，回到主线程
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
    <#ToDo#>
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        <#GoMain#>
    });
});

#OnceGCD(系统自带)
static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    <#code to be executed once#>
});

#MainGCD
dispatch_async(dispatch_get_main_queue(), ^{
    <#code#>
});

#GlobalGCD
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    <#TODO#>
});
