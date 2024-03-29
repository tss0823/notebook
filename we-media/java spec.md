## java 好的编码习惯
已经快2个月没有更新了，拖延症害死人，每次想动笔，可是觉得准备不充分，总有补充的地方。​最近偶尔读到了一篇关于邓小平改革理论相关的文章评说，颇有感触，怎么去平衡主要和次要，抓中心，于是我总结了java编码相关的一些习惯，虽然不能面面俱到，但都是到觉得有必要坚持下来的习惯

### 命名可读性（好的命名比注释更实用）
* 编码最大的忌讳就是代码的随意性，命名不规范。好的命名不仅提高可读性，而且让后续的维护和扩展更顺利。当然注释是必须的，我个人推荐如果代码的规范命名，让人一看就知道其功能和业务，这里面命名包括常见的：包，类，方法，属性，常量，枚举，变量等
* 包名小写，一般格式 com.公司名称.项目名称.业务名称 比如: com.hzcompany.mall.member
* 类名遵循 UpperCamelCase(大骆驼拼写法)风格，比如：UserService,业务名称+功能后缀（常见的有Controller,Service,Dao,Vo,DTO等）
* 方法，属性，变量遵循 LowerCamelCase(小驼峰拼写发)风格，比如：bookMeeting
* 常量性命名全部大写，单词间用下划线隔开，比如：MAX_MEETING_COUNT




## 代码布局（行，列，嵌套）
* 一行不能超过120个字符
* 一个方法最好不能超过80行
* 不推荐层层嵌套（if/for,while），可以通过方法或return,或 continue/break 来处理,比如
  
修改前：
for (condition,express){  
    if( a == b){   
       for (...){} 
    }
 }
 
 修改后：
 for (condition,express){  
     if( a != b){ 
       contiue;  //跳出，就不用在里面嵌套
     } 
     for (...){}  
  }


## 异常
* try catch 不要随意捕捉，除非遇到可预知的异常，比如第三方依赖，捕捉异常后记得抛出去。

## 日志
* 日志可以用于调试，错误跟踪的用处，切记输出关键业务信息（时间，行数，参数，返回结果等）

## 接口依赖
* 第三方接口（rpc）调用，永远不要高估第三方接口的稳定性。网络超时和接口的不稳定性，必须通过一套幂等机制去检测


## 抽象能力
* 找到系统的变化点，并隔离变化点,本质区分核心与外围，变化的（可扩展，多态）和不变的（抽象，独立），做到高内聚低耦合。

## 控制好scope
* 方法，属性访问权限不要轻易public,先最小private开始，随着依赖扩展再逐步放开访问

## 做业务需求的习惯思考
* 做需求不光考虑业务需求，有时候更重要的是系统架构需求(接口超时怎么容错; 宕机，crash,怎么重启;数据破坏了怎么恢复，怎么跟踪；遇到未知错误，怎么收集，怎么解决，怎么防范；怎么在用户体验下功夫)

以上几点并没有把所有的java的一个编码规范或习惯全部罗列，仅属于个人经验所得，如果想获取更多编码规范和开发习惯的话，可以公众号(狗娃编程)回复 "java开发规范" 获取阿里巴巴的"java开发手册"电子书资料
