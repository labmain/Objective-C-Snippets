- (NSAttributedString *)setLineSpacing:(NSString *)string spacing:(NSInteger)space {
    NSMutableAttributedString *mattString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];

    [paragraphStyle setLineSpacing:space];//调整行间距
    [mattString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, string.length)];
    return [mattString copy];
}
