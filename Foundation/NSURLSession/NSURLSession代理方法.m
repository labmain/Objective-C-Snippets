#import "ViewController.h"

@interface ViewController ()<NSURLSessionDataDelegate>
@property (nonatomic, strong) NSMutableData *responseData;
@end

@implementation ViewController

-(NSMutableData *)responseData
 {
         if (_responseData == nil) {
                 _responseData = [NSMutableData data];
             }
         return _responseData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     //[self performSelector:@selector(getAndSynchronousMethod)];
    [self delegateTest];
}

-(void)delegateTest
{
         //1.确定请求路径
         NSURL *url = [NSURL URLWithString:@"http://123.207.175.144/Test1.php?Login=1"];

         //2.创建请求对象
         //请求对象内部默认已经包含了请求头和请求方法（GET）
         NSURLRequest *request = [NSURLRequest requestWithURL:url];

         //3.获得会话对象,并设置代理
         /*
                  第一个参数：会话对象的配置信息defaultSessionConfiguration 表示默认配置
                  第二个参数：谁成为代理，此处为控制器本身即self
                  第三个参数：队列，该队列决定代理方法在哪个线程中调用，可以传主队列|非主队列
                  [NSOperationQueue mainQueue]   主队列：   代理方法在主线程中调用
                  [[NSOperationQueue alloc]init] 非主队列： 代理方法在子线程中调用
                  */
         NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];

         //4.根据会话对象创建一个Task(发送请求）
         NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];

         //5.执行任务
         [dataTask resume];

}

//1.接收到服务器响应的时候调用该方法
 -(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
 {
         //在该方法中可以得到响应头信息，即response
         NSLog(@"didReceiveResponse--%@",[NSThread currentThread]);

         //注意：需要使用completionHandler回调告诉系统应该如何处理服务器返回的数据
         //默认是取消的
         /*
                     NSURLSessionResponseCancel = 0,        默认的处理方式，取消
                     NSURLSessionResponseAllow = 1,         接收服务器返回的数据
                     NSURLSessionResponseBecomeDownload = 2,变成一个下载请求
                     NSURLSessionResponseBecomeStream        变成一个流
                  */

         completionHandler(NSURLSessionResponseAllow);
}

//2.接收到服务器返回数据的时候会调用该方法，如果数据较大那么该方法可能会调用多次
 -(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
 {
         NSLog(@"didReceiveData--%@",[NSThread currentThread]);

         //拼接服务器返回的数据
         [self.responseData appendData:data];
}

//3.当请求完成(成功|失败)的时候会调用该方法，如果请求失败，则error有值
 -(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
 {
         NSLog(@"didCompleteWithError--%@",[NSThread currentThread]);

         if(error == nil)
             {
                     //解析数据
                     NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:self.responseData options:kNilOptions error:nil];
                     NSLog(@"%@",dict);
                 }
}

@end
