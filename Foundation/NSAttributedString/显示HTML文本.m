NSString * htmlString = @"<html><body> Some html string \n <font size=\"13\" color=\"red\">This is some text!</font> </body></html>";
NSAttributedString * attrStr = [[NSAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
UILabel * myLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
myLabel.attributedText = attrStr;
[self.view addSubview:myLabel];
//只能在iOS7以后运行
