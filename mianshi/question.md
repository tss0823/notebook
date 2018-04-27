## 整理的
1. 为什么Set、List、map不实现Cloneable和Serializable接口
2. 什么时候使用Linkedhashmap、Concurrenthashmap、Weakhashmap
3. Arrays.sort的实现
4. 什么时候使用CopyOnWriteArrayList
5. ReentrantLock和synchronized 区别
6. AQS的实现原理
7. 类加载机制的步骤，每一步做了什么，static和final修改的成员变量的加载时机
8. jvm参数的设置和jvm调优
9. 什么情况产生年轻代内存溢出、什么情况产生年老代内存溢出
10. Redis和memcached，内存和存储策略，应用场景
11. Reactor模型和Proactor模型
12. ip问题 如何判断ip是否在多个ip段中
13. 消息队列广播模式和发布/订阅模式的区别




## 答案
1. 因为他们是接口，克隆，序列化应该根据实现类有关
2. LinkedHashMap 和 WeakHashMap 可以实现缓存容器，两者都可以自动回收旧的内存，LinkedHashMap 是通过 重写 `removeEldestEntry` 通过一个闸值决定是否删除老的，WeekHashMap是通过虚拟机的垃圾回收弱引用。ConcurrentHashMap用户多线程环境
3.  
4. 针对增删改采用`Sytem.arraycopy`方法，应用于当写时遍历操作较多的情况的多线程环境，也就是数组长度超大的情况
5. https://yq.aliyun.com/articles/38340
6. 
7. 详见[java.md](jvm.md)的类加载介绍,static 修饰的准备阶段0 or null,初始化真正的值.final 修饰准备阶段赋值真正的值
8. -Xms -Xmx -Xmn -Xss -MaxPersize

