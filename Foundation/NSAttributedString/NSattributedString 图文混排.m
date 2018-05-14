// 文字__昵称
NSMutableAttributedString * mutAttStr_nickName = [[NSMutableAttributedString alloc]initWithString:[message.senderDisplayName stringByAppendingString:@" "]];    // 空格 隔开

[mutAttStr_nickName addAttribute:NSFontAttributeName
                           value:(14)
                           range:NSMakeRange(0, message.senderDisplayName.length)];

// 图片(图片+水印 合成图)
UIImage * image = [ZHFGroupChatViewController imageWithText:@"吧主"
                                                   textFont:(20)
                                                  textColor:[UIColor whiteColor]
                                                  textFrame:CGRectMake((8), (0), (40), (28))
                                                originImage:UIIMAGE(@"managerPic")
                                     imageLocationViewFrame:CGRectMake((0), (0), (56), (28))
                   ];
// attachment
NSTextAttachment *textAttach_image = [[NSTextAttachment alloc] initWithData:nil ofType:nil];

// 调节 图文混排中, 图的垂直对齐 - 调整y值
textAttach_image.bounds = CGRectMake(0, -2, image.size.width, image.size.height);
textAttach_image.image = image ;
NSAttributedString *textAttachmentString = [NSAttributedString attributedStringWithAttachment:textAttach_image];

// 拼接
[mutAttStr_nickName appendAttributedString:textAttachmentString];

