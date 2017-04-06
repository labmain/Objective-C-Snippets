//1.字典转换为字符串(JSON格式),利用 NSData作为桥梁;
NSDictionary *dic = @{@"name":@"Lisi",@"sex":@"m",@"tel":@"1770"};  
//把字符串转换为NSData
NSData *data = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil]; 
//以NSData创建字符串对象
NSString *dicStr  = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
NSLog(@"字典转换为字符串是%@",dicStr);
//结果是一个JSON字符串:
{  
  "name" : "Lisi",  
  "sex" : "m",  
  "tel" : "1770"  
}  