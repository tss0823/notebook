## 负载方式（5种）
* RR（Round Robin） 轮询
* weight 权重
* ip_hash
* fair `第三方，按后端服务器的响应时间来分配请求，响应时间短的优先分配`
* url_hash `第三方`


## vs httpd
* 请求运行模型，httpd是多进程模型，nginx多线程模型，基于epoll
* 配置上，httpd复杂，nginx简单
* httpd擅长处理动态请求，nginx擅长处理静态
* nginx 高并发，高性能，但稳定性比不上httpd，httpd稳定，处于少量请求

