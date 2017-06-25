## Static quick actions静态标签

```
Static quick actions are available to the userimmediately upon app installation. Define Home screen static quick actions in your app’sInfo.plistfile in theUIApplicationShortcutItemsarray.
```

在`info.plist`的文件中添加`UIApplicationShortcutItems`数组就可以使用了，具体数组里面的配置下面会有说明，还有一点需要强调的是，使用静态标签是程序安装以后就可以立即使用了。
**快捷菜单允许的最多显示的项目为 4个**

`UIApplicationShortcutItemType`(required) 这个键值设置一个快捷通道类型的字符串 我们可以监听该项的值来判断用户是从哪一个标签进入App的，该字段的值可以为空

`UIApplicationShortcutItemTitle`(required) 这个键值设置标签的标题 我们可以监听该项的值来判断用户是从哪一个标签进入App的 如果该字符串过长并且没有设置subtitle，会以两行展示，还是不够的话末尾会变为省略号

`UIApplicationShortcutItemSubtitle` 设置标签的副标题 会在主标题下面显示，主标题不论多长都会以一行显示，副标题过长会以一行显示，末位是省略号。

`UIApplicationShortcutItemIconType` 设置标签的图标样式，系统提供了29中样式的图标，但大部分只能在9.1的系统上使用，只有少数可以在9.0的系统中使用，这一部分会在后边详细介绍

`UIApplicationShortcutItemIconFile` 设置自定义标签图片文件的路径 从app bundle或者asset catalog中选择一张图片，要求方形，35X35点坐标，retina 屏幕是70 x 70像素，plus是104 x 104像素，设置了这个值，系统会忽略UIApplicationShortcutItemIconType

`UIApplicationShortcutItemUserInfo` 设置信息字典(用于传值)


## Home Screen Quick Actions​的响应方法

类似推送，当我们点击标签进入应用程序时，也可以进行一些操作，我们可以在AppDelegate中增加了这样一个方法，在方法中可以做一些页面跳转等需求：

```objc
- (void)application:(UIApplication*)application performActionForShortcutItem:(UIApplicationShortcutItem*)shortcutItem completionHandler:(void(^)(BOOL))completionHandler;
```

## 当程序不在后台的时候

`completionHandler()` 在 API 的说明中我们看到当应用并非在后台
而是直接重新开进程的时候，会直接返回NO

UIApplication 提供了一个可以从 launchOptions 这个字典中
获取到 `shortcutItem` 的 `keyUIApplicationLaunchOptionsShortcutItemKey`
有了这个 `Key` 我们就可以处理不同的事件

```objc
- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions;
```

```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) {
        // 是否是从3D Touch 启动 ，防止调用 application:performActionForShortcutItem:completionHandler
        UIApplicationShortcutItem *shortcutItem;
        shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
        if (shortcutItem) {
            [self shortcutItemLaunchingWithItem:shortcutItem];
            return NO;
        }

    }

    return YES;
}
```

当用户选择了一个主界面`quick action`，系统会调用`application:performActionForShortcutItem:completionHandler:`方法，但是注意，系统会在调用这个方法之前，先调用`application:willFinishLaunchingWithOptions:和application:didFinishLaunchingWithOptions:`，所以如果`quick action`使你的app显示的界面不一样的话（本来打开你的app会进入View A，但是使用quick action会进入View B），这时候就要在两个launch方法中处理`quick action``，UIApplicationShortcutItem` 存在于`launchOptions`的`UIApplicationLaunchOptionsShortcutItemKey`中，处理完成后，返回NO，系统就不会再调用`application:performActionForShortcutItem:completionHandler:`。
