## 结构
> 核心组件 Connector 和 Container
![](res/0.png)


## 调优
```
<Connector port="8080" protocol="org.apache.coyote.http11.Http11AprProtocol"
               connectionTimeout="20000"
               redirectPort="8443" 
                maxThreads="500"
                minSpareThreads="100"
                maxSpareThreads="200"
                acceptCount="200"
                maxIdleTime="30000"
                enableLookups="false"
               />
```
**Tomcat的并发请求处理数量=** `maxThreads + acceptCount`
* protocol：启用APR连接模式，提高异步IO处理性能。启用配置请参考：《开启Tomcat APR运行模式，优化并发性能》 
* maxThreads：最大能接受的请求数，默认为200 
* minSpareThreads：最少备用线程数，默认初始化，默认为25 
* maxSpareThreads：最多备用线程数，一旦创建的线程超过这个值，Tomcat就会关闭不再需要的socket线程 
* acceptCount：等待处理的请求队列，默认为100，超过队列长度，服务器则拒绝客户端请求，直接返回403 
* maxIdleTime：如果一个线程在30秒以内没有活跃，则终止运行并从线程池中移除。除非线程池数量小于或等于minSpareThreads数量。默认值是1分钟 
* enableLookups：如果为true，调用request.getRemoteHost会执行DNS反查，反向解析IP对应的域名或主机，效率较低，建议设为false。 
更多参数设置，请参考Tomcat官方文档：[http://tomcat.apache.org/tomcat-8.0-doc/config/http.html](http://tomcat.apache.org/tomcat-8.0-doc/config/http.html)

## vs jetty


## 资料
[https://www.ibm.com/developerworks/cn/java/j-lo-tomcat1/](https://www.ibm.com/developerworks/cn/java/j-lo-tomcat1/)