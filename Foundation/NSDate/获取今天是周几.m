/** 获取今天是周几 **/  
-(NSString *)_getWeakDay:(UIButton *)sender  
{  
    NSInteger weakday = [[NSDate date] weekday];//周末为第一天  
    NSString *selectWeakDay = @"";  
    NSInteger tmpWeakday = weakday;  
    switch (sender.tag) {  
        case 100://今天  
        {  
            tmpWeakday = weakday;  
        }  
            break;  
        case 101://明天  
        {  
            tmpWeakday = weakday+1;  
            if(tmpWeakday>7)  
            {  
                tmpWeakday = 1;  
            }  
        }  
            break;  
        case 102://后天  
        {  
            tmpWeakday = weakday + 2;  
            if(tmpWeakday - 7 > 0)  
            {  
                (tmpWeakday == 8) ? (tmpWeakday = 1) : (tmpWeakday = 2);  
            }  
        }  
            break;  
        default:  
            break;  
    }  
      
    switch (tmpWeakday) {  
        case 1:  
            selectWeakDay = @"星期天";  
            break;  
              
        case 2:  
            selectWeakDay = @"星期一";  
            break;  
              
        case 3:  
            selectWeakDay = @"星期二";  
            break;  
              
        case 4:  
            selectWeakDay = @"星期三";  
            break;  
              
        case 5:  
            selectWeakDay = @"星期四";  
            break;  
              
        case 6:  
            selectWeakDay = @"星期五";  
            break;  
              
        case 7:  
            selectWeakDay = @"星期六";  
            break;  
        default:  
            break;  
    }  
      
    return selectWeakDay;  
}  