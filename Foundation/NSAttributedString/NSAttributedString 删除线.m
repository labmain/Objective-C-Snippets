NSMutableAttributedString *priceAttributed = [[NSMutableAttributedString alloc]initWithString:label.text];
NSRange range = [label.text rangeOfString:label.text];
[priceAttributed addAttribute:NSStrikethroughStyleAttributeName 
                    value:@(NSUnderlineStyleSingle) 
                    range:range];
/// iOS 10.3上显示异常，需要在添加一个NSBaselineOffsetAttributeName属性才可以。如下：
[priceAttributed addAttribute:NSBaselineOffsetAttributeName
                value:@(NSUnderlineStyleSingle) 
                range:range];

