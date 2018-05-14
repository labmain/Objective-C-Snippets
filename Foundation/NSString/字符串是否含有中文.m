/**
 *  @author zhengju, 16-06-29 10:06:05
 *
 *  @brief 检测字符串中是否含有中文，备注：中文代码范围0x4E00~0x9FA5，
 *
 *  @param string 传入检测到中文字符串
 *
 *  @return 是否含有中文，YES：有中文；NO：没有中文
 */
+ (BOOL)checkIsChinese:(NSString *)string{
for (int i=0; i<string.length; i++) {
    unichar ch = [string characterAtIndex:i];
    if (0x4E00 <= ch  && ch <= 0x9FA5) {
        return YES;
    }
}
return NO;
}
