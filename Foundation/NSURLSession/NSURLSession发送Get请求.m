/*
使用NSURLSession发送GET请求的方法和NSURLConnection类似，整个过程如下：

　　　　1）确定请求路径（一般由公司的后台开发人员以接口文档的方式提供），GET请求参数直接跟在URL后面

　　　　2）创建请求对象（默认包含了请求头和请求方法【GET】），此步骤可以省略

　　　　3）创建会话对象（NSURLSession）

　　　　4）根据会话对象创建请求任务（NSURLSessionDataTask）

　　　　5）执行Task

　　　　6）当得到服务器返回的响应后，解析数据（XML|JSON|HTTP）
*/

// 第一种Get方法
//1.确定请求路径
NSURL *url=[NSURL URLWithString:@"http://123.207.175.144/Test1.php?Login=1"];

//2.创建请求对象
//请求对象内部默认已经包含了请求头和请求方法（GET）
NSURLRequest *request=[NSURLRequest requestWithURL:url];

//3.获得会话对象
NSURLSession *session=[NSURLSession sharedSession];

//4.根据会话对象创建一个Task(发送请求）
     /*
      第一个参数：请求对象
      第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
                data：响应体信息（期望的数据）
                response：响应头信息，主要是对服务器端的描述
                error：错误信息，如果请求失败，则error有值
      */
NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
                                    if(error==nil){
                                      //6.解析服务器返回的数据
                                      //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
                                        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

                                        NSLog(@"%@",dict);
                                    }
                                }];
//5.执行任务
[dataTask resume];

// 第二种Get方法

//1.确定请求路径
    NSURL *url=[NSURL URLWithString:@"http://123.207.175.144/Test1.php?Login=1"];

    //2.获得会话对象
    NSURLSession *session=[NSURLSession sharedSession];

    //3.根据会话对象创建一个Task(发送请求）
         /*
                  第一个参数：请求路径
                  第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
                            data：响应体信息（期望的数据）
                            response：响应头信息，主要是对服务器端的描述
                            error：错误信息，如果请求失败，则error有值
                  注意：
                     1）该方法内部会自动将请求路径包装成一个请求对象，该请求对象默认包含了请求头信息和请求方法（GET）
                     2）如果要发送的是POST请求，则不能使用该方法
        */
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){

        //5.解析数据
        NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",dict);
    }];

     //4.执行任务
    [dataTask resume];
