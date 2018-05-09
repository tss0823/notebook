## 项目结构
* maven 父子多级
* ssm (SpringVMC Spring MyBatis)

## 启动流程
> j2ee容器启动时，StandardContext.startInternal()  ， 扫描所有jar并找到 META-INF/services/javax.servlet.SpringServletContainerInitializer （继承 ServletContainerInitializers），然后加载 Spring WebApplicationInitializer 并调用 onStartup 方法。这是serlvet3.0 新增的一个动态注册,不光注册servlet,还可以注册Filter,Listener

>  利用 Spring Configuration，Import，ImportResource，ComponentScan 动态加载配置文件或配置类，扫描java bean

>  主要通过注解来实现

