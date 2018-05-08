## SpringMVC 流程
* j2ee容器 web.xml 解析加载spring servlet
* servlet init 加载spring 配置文件
* spring 扫描java bean，通过反射组装到IOC容器中
* java bean 依赖注入
* HandlerMaping 组装url和java bean method
* 客户端请求doGet/doPost匹配到url,找到method再invoke
* servlet response method return