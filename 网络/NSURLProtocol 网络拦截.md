使用场景

* 重定向网络请求(可以解决 DNS 域名劫持问题) 
* 忽略网络请求，使用本地缓存 
* 自定义网络请求的返回结果 Response 
* 拦截图片加载请求，转为从本地文件加载 
* 一些全局的网络请求设置 
* 快速进行测试环境的切换 
* 过滤掉一些非法请求网络的缓存处理(如网络图片缓存)可以拦截 UIWebView ，基于系统的 NSURLConnection 或者 NSURLSession 进行封装的网络请求。目 前 WKWebView 无法被 NSURLProtocol 拦截。
* 当有多个自定义 NSURLProtocol 注册到系统中的话，会按照他们注册的反向顺序依次调用 URL 加载流程。当其中有一个 NSURLProtocol 拦截到请求的话，后续的 NSURLProtocol 就无法拦截到 该请求。 


网络拦截：

* 拦截NSURLSession
* 拦截AFN
* 拦截UIWebView，WKWebView
* 拦截所有请求
