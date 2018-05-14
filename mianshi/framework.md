## 项目结构
* maven 父子多级
* ssm (SpringVMC Spring MyBatis)

## 启动流程
> j2ee容器启动时，StandardContext.startInternal()  ， 扫描所有jar并找到 META-INF/services/javax.servlet.SpringServletContainerInitializer （继承 ServletContainerInitializers），然后加载 Spring WebApplicationInitializer 并调用 onStartup 方法。这是serlvet3.0 新增的一个动态注册,不光注册servlet,还可以注册Filter,Listener

>  利用 Spring Configuration，Import，ImportResource，ComponentScan 动态加载配置文件或配置类，扫描java bean

>  主要通过注解来实现

## 其他关键词
### 服务器熔断和服务降级(过载保护，服务降级)
> 服务熔断对服务提供了proxy，防止服务不可能时，出现串联故障（cascading failure），导致雪崩效应。服务熔断一般是某个服务（下游服务）故障引起，而服务降级一般是从整体负荷考虑,根据业务功能来的
> [资料](https://blog.csdn.net/whereismatrix/article/details/53465722)

### 分布式一致性 CAP,BASE

## 架构设计原则
### 高并发
拆分，服务化，消息队列，缓存

### 高可用
集群，限流，降级

### 业务设计
幂等，防重，状态机

### 限流方式
* 滑动窗口协议
* 漏桶算法
* 控制传输速率的算法
* 令牌桶算法

tcp 时间窗口演示
https://media.pearsoncmg.com/aw/ecs_kurose_compnetwork_7/cw/content/interactiveanimations/selective-repeat-protocol/index.html