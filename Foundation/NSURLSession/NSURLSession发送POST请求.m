/*
使用NSURLSession发送POST请求的方法和NSURLConnection类似，整个过程如下：

　　　　1）确定请求路径（一般由公司的后台开发人员以接口文档的方式提供）

　　　　2）创建可变的请求对象（因为需要修改），此步骤不可以省略

　　　　3）修改请求方法为POST

　　　　4）设置请求体，把参数转换为二进制数据并设置请求体

　　　　5）创建会话对象（NSURLSession）

　　　　6）根据会话对象创建请求任务（NSURLSessionDataTask）

　　　　7）执行Task

　　　　8）当得到服务器返回的响应后，解析数据（XML|JSON|HTTP）
*/

//1.创建会话对象
NSURLSession *session=[NSURLSession sharedSession];

//2.根据会话对象创建task
NSURL *url=[NSURL URLWithString:@"http://123.207.175.144/Test1.php"];

//3.创建可变的请求对象
NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];

//4.修改请求方法为POST
request.HTTPMethod=@"POST";

//5.设置请求体
request.HTTPBody=[@"Login=1" dataUsingEncoding:NSUTF8StringEncoding];

//6.根据会话对象创建一个Task(发送请求）
    /*
             第一个参数：请求对象
             第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
                        data：响应体信息（期望的数据）
                        response：响应头信息，主要是对服务器端的描述
                        error：错误信息，如果请求失败，则error有值
     */
NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){

   //8.解析数据
   NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
   NSLog(@"%@",dict);
}];

//7.执行任务
[dataTask resume];
