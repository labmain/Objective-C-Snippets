[attStr enumerateAttribute:(NSString *)kCTFontAttributeName inRange:NSMakeRange(0, html.length) options:0 usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
        UIFont *font = value;
        NSRange boldRange = [font.fontName rangeOfString:@"Bold"];
        if (boldRange.location == NSNotFound) {
            font = [UIFont fontWithName:@"HelveticaNeue" size:fontNum];
        }else{
            font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontNum];
        }

        [html removeAttribute:(NSString *)kCTFontAttributeName range:range];
        [html addAttribute:(NSString *)kCTFontAttributeName value:font range:range];
    }];
