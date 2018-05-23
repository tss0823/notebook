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

## 三大核心接口机制及作用
> BeanFactory、ApplicationContext、WebApplicationContext

## bean的作用域
* singleton：在IOC容器中仅存在一个Bean实例，Bean以单例方式存在，外部引用都指向这个Bean。
* prototype：每次调用Bean都返回一个新实例。
* request：在同一个Http请求的Bean相同，每个Http请求创建一个新的Bean。
* session：在Http请求对应同一个session时对应同一个Bean。
* globalSession：一般的web应用中globalSession等价于session，只有在portlet web应用中才存在globalSession概念。

## 资料
* [annotation](https://blog.csdn.net/achenyuan/article/details/72786759)
* [三大核心接口机制及作用](https://blog.csdn.net/rcj183419/article/details/54708505)
