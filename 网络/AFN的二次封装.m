// 我用一个单例类将一些常用的网络请求进行了二次封装，主要包括post请求 get请求  图片文件上传下载  视频的断点续传等功能。
// 首先大家先去github上下载AFN，将文件夹内的AFNetworking文件夹拖入工程中，然后创建一个图片文件参数类代码如下：

#import <Foundation/Foundation.h>

@interface UploadParam : NSObject
/**
 *  上传文件的二进制数据
 */
@property (nonatomic, strong) NSData *data;
/**
 *  上传的参数名称
 */
@property (nonatomic, copy) NSString *name;
/**
 *  上传到服务器的文件名称
 */
@property (nonatomic, copy) NSString *fileName;

/**
 *  上传文件的类型
 */
@property (nonatomic, copy) NSString *mimeType;


@end
#import "UploadParam.h"

@implementation UploadParam

@end
// 然后创建网络工具AFNManager具体代码如下(此处我提供了代理和block两种方式进行传值供大家选择)：

#import <Foundation/Foundation.h>
#import "AFNManagerDelegate.h"
#import "UploadParam.h"
@interface AFNManager : NSObject

@property (nonatomic, weak) id<AFNManagerDelegate> delegate;

/**
 *  AFNManager单利
 */
+(AFNManager *)sharedManager;
#pragma mark --代理的方式传值
/**
 *  get
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters;

/**
 *  post
 */
- (void)Post:(NSString *)URLString parameters:(id)parameters;

/**
 *  upload
 */
- (void)Upload:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam;

#pragma mark --block的形式传值
/**
 *  get请求
 */
- (void)GET:(NSString *)URLString parameters:(id)parameters succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;
/**
 *  post请求
 */
- (void)Post:(NSString *)URLString parameters:(id)parameters succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;
/**
 *  upload
 */
- (void)Upload:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam succeed:(void (^)(id data))succeed failure:(void (^)(NSError *error))failure;


#pragma mark --断点续传
/**
 *  开始下载  断点续传
 *
 *  @param URLString 请求接口
 */
- (void)downloadStartWithUrl:(NSString *)URLString fileName:(NSString *)fileName;
/**
 *  开始上传  断点续传
 *
 *  @param URLString 请求接口
 */
- (void)uploadStartWithUrl:(NSString *)URLString fileData:(NSData *)fileData;
/**
 *  暂停操作  断点续传
 */
- (void)operationPause;
/**
 *  继续操作  断点续传
 */
- (void)operationResume;
/**
 *  取消操作
 */
- (void)operationCancel;
@end

#import "AFNManager.h"
#import "AFNetworking.h"
@interface AFNManager()
{
    AFHTTPRequestOperation *operation; //创建请求管理（用于上传和下载）
}
@end
static AFNManager *manager = nil;
@implementation AFNManager
+(AFNManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[self alloc] init];
        }
    });
    return manager;
}

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {

            manager = [super allocWithZone:zone];
        }
    });
    return manager;
}
- (void)GET:(NSString *)URLString parameters:(id)parameters
{
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidSuccess:)]) {

            [self.delegate AFNManagerDidSuccess:responseObject];
        }


    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidFaild:)]) {

            [self.delegate AFNManagerDidFaild:error];
        }
    }];
}

- (void)Post:(NSString *)URLString parameters:(id)parameters
{
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    [mgr POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidSuccess:)]) {

            [self.delegate AFNManagerDidSuccess:responseObject];
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidFaild:)]) {

            [self.delegate AFNManagerDidFaild:error];
        }
    }];
}

- (void)Upload:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam
{
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    [mgr POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) { // 上传的文件全部拼接到formData

        /**
         *  FileData:要上传的文件的二进制数据
         *  name:上传参数名称
         *  fileName：上传到服务器的文件名称
         *  mimeType：文件类型
         */
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.fileName mimeType:uploadParam.mimeType];




    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidSuccess:)]) {

            [self.delegate AFNManagerDidSuccess:responseObject];
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidFaild:)]) {

            [self.delegate AFNManagerDidFaild:error];
        }
    }];

}
-(void)GET:(NSString *)URLString parameters:(id)parameters succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure
{
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    [mgr GET:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject == nil) {
            return ;
        }
        succeed(responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error);
    }];
}
-(void)Post:(NSString *)URLString parameters:(id)parameters succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure
{
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];

    [mgr POST:URLString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (responseObject == nil) {
            return ;
        }
        succeed(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {

        failure(error);
    }];

}
-(void)Upload:(NSString *)URLString parameters:(id)parameters uploadParam:(UploadParam *)uploadParam succeed:(void (^)(id))succeed failure:(void (^)(NSError *))failure
{
    // 创建请求管理者
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];


    [mgr POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) { // 上传的文件全部拼接到formData

        /**
         *  FileData:要上传的文件的二进制数据
         *  name:上传参数名称
         *  fileName：上传到服务器的文件名称
         *  mimeType：文件类型
         */
        [formData appendPartWithFileData:uploadParam.data name:uploadParam.name fileName:uploadParam.fileName mimeType:uploadParam.mimeType];


    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidSuccess:)]) {

            succeed(responseObject);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(AFNManagerDidFaild:)]) {

            failure(error);
        }
    }];

}
-(void)downloadStartWithUrl:(NSString *)URLString fileName:(NSString *)fileName
{
    NSString *filePath = [NSString stringWithFormat:@"%@/Documents/%@",NSHomeDirectory(), fileName];

    operation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];

    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:filePath append:NO];
//    可以在此设置进度条

//    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
//
//    }];
    __weak typeof(self) weakself = self;
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        请求成功做出提示
        if (weakself.delegate && [weakself.delegate respondsToSelector:@selector(AFNManagerDidSuccess:)]) {

            [weakself.delegate AFNManagerDidSuccess:responseObject];
        }


    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        请求失败做出提示
        if (weakself.delegate && [weakself.delegate respondsToSelector:@selector(AFNManagerDidFaild:)]) {

            [weakself.delegate AFNManagerDidFaild:error];
        }
    }];

    [operation start];
}
- (void)uploadStartWithUrl:(NSString *)URLString fileData:(NSData *)fileData
{
    operation = [[AFHTTPRequestOperation alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URLString]]];

    operation.inputStream = [[NSInputStream alloc] initWithData:fileData];

//    设置进度条
//    [operation setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
//
//    }];
    __weak typeof(self) weakself = self;
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        请求成功做出提示
        if (weakself.delegate && [weakself.delegate respondsToSelector:@selector(AFNManagerDidSuccess:)]) {

            [weakself.delegate AFNManagerDidSuccess:responseObject];
        }


    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //        请求失败做出提示
        if (weakself.delegate && [weakself.delegate respondsToSelector:@selector(AFNManagerDidFaild:)]) {

            [weakself.delegate AFNManagerDidFaild:error];
        }
    }];

    [operation start];
}
- (void)operationPause
{
    [operation pause];
}
- (void)operationResume
{
    [operation resume];
}
- (void)operationCancel
{
    [operation cancel];
}

//网络监听（用于检测网络是否可以链接。此方法最好放于AppDelegate中，可以使程序打开便开始检测网络）
- (void)reachabilityManager
{
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    //打开网络监听
    [mgr.reachabilityManager startMonitoring];

    //监听网络变化
    [mgr.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {

                //当网络不可用（无网络或请求延时）
            case AFNetworkReachabilityStatusNotReachable:
                break;

                //当为手机WiFi时
            case AFNetworkReachabilityStatusReachableViaWiFi:
                break;

                //当为手机蜂窝数据网
            case AFNetworkReachabilityStatusReachableViaWWAN:
                break;

                //其它情况
            default:
                break;
        }
    }];

    //    //停止网络监听（若需要一直检测网络状态，可以不停止，使其一直运行）
//    [mgr.reachabilityManager stopMonitoring];
}


@end
// 网络工具代理协议代码如下：
#import <Foundation/Foundation.h>
@class AFNManager;

@protocol AFNManagerDelegate <NSObject>

@optional
/**
 *  发送请求成功
 *
 *  @param manager AFNManager
 */
-(void)AFNManagerDidSuccess:(id)data;
/**
 *  发送请求失败
 *
 *  @param manager AFNManager
 */
-(void)AFNManagerDidFaild:(NSError *)error;
@end

http://www.cnblogs.com/sxwangjiadong/p/4970751.html
