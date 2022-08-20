## 语言
* 后端 java/python/nodejs/php/C/
* 前端 js[vuejs/reactjs/angluarjs]h5,android,ios
* 脚本 shell,groovy

## 技术领域
* 网络编程
* 数据库编程
* 中间件
* web安全
* AR/区块链
* 云原生
* 编译
* 逆向
* 算法&数据结构
* 大数据&AI
* 加密&解密


## java技术
* 热部署
* 调试
* 爬虫/反爬虫
* JVM (字节码/执行指令/内存模型/垃圾回收/线程模型/类加载)
* IO/NIO/String/Set/List/Map/Queue/Stack
* NIO Socket
* 线程/锁
* 动态代理（CGLIB,JDK invoke）
* 序列化/反序列化
* Instrumentation 代理 （Btrace的实现）
* 性能监控命令（jxxx）
* 日志（log4j,slf4j）
* XML/JSON
* SPI (Service Provider Interface)
* CAS (Compare and swap)
* 

  
## j2ee
* JDO
* JPA
* JMS
* JMX
* Sevlet
* JDBC
* JNDI
* WebService
* JCA
* JCE (Java Cryptography Extension)
* JTA
* RMI
* RPC
* 
  

## 网络
* TCP/IP协议
* UDP协议
* 应用层 HTTP/HTTPS/FTP/SMTP/DNS
* SSL/TLS
* SSH
* Socket/WebSocket


## 数据库
* Mysql/Oracle/MongoDB
* 表结构
* 索引结构 （B+数，Hash）
* 聚集索引和非聚集索引
* 事务
* 连接池
* OLTP/OLAP
* SQL优化
* 分库分表
* 备份
* ACID
* 脏读/不可重复读/幻读/
* innodb vs myisam
* 
  

## web前端技术
* jquery
* bootstrap
* css
* html
* javascript
* es6
* html5
* vuejs
* reactjs
* angluarjs

## java框架
* spring/boot/mvc/cloud
* mybatis
* hibernate
* struts
* velocity/framemark
* webwork
* varnish/squid/nginx
* dbcp/c3p0/druid/
* 


## 框架和容器技术
### web容器
* tomcat
* jetty
* jboss
* weblogic
* websphere

### 反向代理
* nginx
* httpd

### 通信
* netty
* mina

### 消息队列
* kafka
* redis
* rocketMQ
* metaQ
  

### 分布式缓存
* redis
* memcached

### 搜索
* lucene
* es
* solr
* 

### RPC
* Grpc
* dubbo
* hession

### 一致性
* zookeeper
* etcd

### 安全


## 插件
* chrome/firefox/
* idea/burpsuit/

## 比较好用的组件
* Jodd
* google guava

## 非常有用的shell命令
* netstat -nt | grep 10.237.230.188:80 | awk '{print $5}'|awk -F":" '{print $4}'  |  sort | uniq -c | sort -nr
* ps p 14766 -L -o pcpu,pid,tid,time,tname,stat,psr | sort -n -k1 -r //查看cpu 高的线程
* 
* //获取每个task消耗时间数
grep "task over" biz.log | awk -F ' ' '{print $(NF-1)}' | awk -F '=' '{print $2}'

//时间最长的30条记录
grep "task over" biz.log | awk -F ' ' '{print $(NF-1)}' | awk -F '=' '{print $2}'| sort -nr | head -n 30    

//时间最短的30条记录
grep "task over" biz.log | awk -F ' ' '{print $(NF-1)}' | awk -F '=' '{print $2}'| sort -nr | tail-n 30    

//统计时间为一位数的记录
grep "task over" biz.log | awk -F ' ' '{print $(NF-1)}' | awk -F '=' '{if(length($2) ==1) {print $2} }' | wc -l

//统计外网访问的数量
netstat -net | grep 172.16.208.190:80 | awk '{print $5}' | awk -F ':'  '{print $1}' | uniq -c | sort -nr

netstat -net | grep 8080 | awk '{print $5}' | awk -F ':'  '{print $1}' |  sort | uniq -c | sort -nr  #有效

## 代码文件版本管理
* git
* svn
* maven
* gradle
* 


## 小游戏
* 贪吃蛇
* 连连看


## 其他好玩的项目
* 输入法
* 数据库
* 字典


## 细节技术点
* 代理 proxy-connection
* http状态码（1xx,2xx,3xx,4xx,5xx）
* EIS (ERP,CRM,SCM)

## 设计模式
* 工厂
* 代理
* 生产消费
* 观察者
* 适配器
* 

# 问题目录
* tech_question
* http请求乱码
* java class 获取路径
* 类加载，涉及到不同的容器等
* 文件下载编码
* try catch finally 在 return 前还是后执行？
* java内存溢出，怎么解决?
* java 程序网路访问慢，怎么定位？
* tomcat 类加载顺序
* java异常在架构中怎么处理？

## 相关工具
### java开发
* eclipse
* idea
* netbeans

## php套件
* 

### 前端开发
* webstorm
* 

### 文本编辑器
* vscode （推荐）
* notepad++
* editplus
* submine
* atom

### 运维
* jenkins
* 

### 项目管理
* jira
* 禅道
* xmind (本地)
  
### ssh 终端
* iterm (macos)
* xshell

### 虚拟机
* vmware
* 



## 相关书籍


## 
* java 对象拷贝
* nginx 307
* 