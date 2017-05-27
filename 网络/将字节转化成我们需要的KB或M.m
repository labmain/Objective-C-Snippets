- (NSString*)formatByteCount:(long long)size
{
    return [NSByteCountFormatter stringFromByteCount:size countStyle:NSByteCountFormatterCountStyleFile];
}


- (NSString *)transformedByteCount:(long long)byteCount
{
    double convertedValue = byteCount;
    int multiplyFactor = 0;

    NSArray *tokens = [NSArray arrayWithObjects:@"bytes",@"KB",@"MB",@"GB",@"TB",@"PB", @"EB", @"ZB", @"YB",nil];

    while (convertedValue > 1024) {
        convertedValue /= 1024;
        multiplyFactor++;
    }

    return [NSString stringWithFormat:@"%4.2f %@",convertedValue, [tokens objectAtIndex:multiplyFactor]];

}
