## SpringMVC 流程
* j2ee容器 web.xml 解析加载spring servlet
* servlet init 加载spring 配置文件
* spring 扫描java bean，通过反射组装到IOC容器中
* java bean 依赖注入
* HandlerMaping 组装url和java bean method
* 客户端请求doGet/doPost匹配到url,找到method再invoke
* servlet response method return

## ApplicationContext （继承 BeanFactory,实现 RecourseLoader接口）
* 标识一个应用环境
* 利用BeanFactory创建Bean对象
* 保存对象的关系表
* 能够捕捉各种事件

## IOC
### 组成 Context,Core,Bean
### 启动流程
* 创建BeanFacotry
* 注册感兴趣的事件
* 创建bean实例对象
* 触发被监听的对象


## AOP （Aspect Oriented Programming）
> 面向切面编程，通过预编译方式和运行期动态代理实现程序功能的统一维护的一种技术
### 两种实现方式
* xml
* aspectj (依赖第三方包)

## 拦截器
* java bean handler method执行拦截器 （HandlerInterceptorAdapter）
* WebRequestInterceptor `url 请求的拦截`

## 注解
* @Configuration  等价 spring-application.xml 配置
* @Value
* @Controller, @Service, @Repository,@Component 作用于java bean
* @Autowired,@Resource,@Qualifier
* @PostConstruct 和 @PreDestory 作用于方法 ioc生命周期初始化后和销毁前
* @Controller,@RequestMapping,@RequestParam 

## Spring 5.0
* Spring Boot
* Spring Cloud
* Spring Cloud Data Flow

## 资料
[annotation](https://blog.csdn.net/achenyuan/article/details/72786759)
