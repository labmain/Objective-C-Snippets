NSXMLParser解析简要说明  
1.是sax方法解析  
2.需要创建NSXMLParser实例 （alloc）  
    并创建解析器 （initWithData:）  
        为解析器定义委托 （setDelegate:）  
            运行解析器 （parser）  
++++++当parser初始化并执行parse语句时([parser parse]),程序会跳到代理方法里面走第一个代理方法++++++  
3.这种解析方式是利用它的代理NSXMLParserDelegate实现的  
第一个代理方法：开始处理xml数据，它会把整个xml遍历一遍，识别元素节点名称  
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict;  
第二个代理方法：也就是得到文本节点里存储的信息数据  
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;  
第三个代理方法：存储从第二个代理方法中获取到的信息  
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName  
这就是解析的过程，在这个过程中会不停的重复的执行这三个代理方法，直到遍历完成  

另外：  
    解析开始执行的方法  
- (void)parserDidStartDocument:(NSXMLParser *)parser;  
    解析结束执行的方法  
- (void)parserDidEndDocument:(NSXMLParser *)parser;  
    当出现解析错误的时候，会执行这个方法  
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError;