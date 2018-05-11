## 直播相关协议
* RTMP (Real Time Messaging Protocal)
> Adobe公司的流媒体传输协议，端口号1935普通网络用户均可使用，包括非IOS平台用户，对非80端口（如1935）无限制的网络环境用户。
> 优点：防HTTP下载，延时短。

* HLS (HTTP Live Streaming)
> IOS平台下的流媒体传输协议  ，端口号80
> 优点：H5浏览器支持比较好，IOS，安卓原生支持。
> 缺点：延迟性比较大。楼上说的切片，关键帧改变后切片时间可以缩短，而且可以自己设定首次产生多少分片。

* HTTP FLV (FLASH VIDEO)
> 是一种将直播流模拟成FLV文件，通过HTTP协议进行下载的模式来实现流媒体传输的协议，端口号80 一般建议使用HTTP FLV，实时性和RTMP相等。
> 优点：HTTP相比于RTMP省去了一些协议交互时间，首屏时间更短。HTTP可拓展的功能更多。

### m3u8
hls 索引文件

## 资料
[https://www.zhihu.com/question/47504661](https://www.zhihu.com/question/47504661)
[http://www.samirchen.com/ios-rtmp-vs-hls/](http://www.samirchen.com/ios-rtmp-vs-hls/)
[https://blog.csdn.net/cabbage2008/article/details/50522190](https://blog.csdn.net/cabbage2008/article/details/50522190)