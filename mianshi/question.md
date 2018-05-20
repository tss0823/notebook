## 整理的
1. 为什么Set、List、map不实现Cloneable和Serializable接口
2. 什么时候使用Linkedhashmap、Concurrenthashmap、Weakhashmap
3. Arrays.sort的实现
4. 什么时候使用CopyOnWriteArrayList
5. ReentrantLock和synchronized 区别
6. AQS的实现
7. 类加载机制的步骤，每一步做了什么，static和final修改的成员变量的加载时机
8. jvm参数的设置和jvm调优
9. 什么情况产生年轻代内存溢出、什么情况产生年老代内存溢出
10. Redis和memcached，内存和存储策略，应用场景
11. Reactor模型和Proactor模型
12. ip问题 如何判断ip是否在多个ip段中
13. SOA和微服务的区别
14. 常用排序算法，二分查找，链表相关，数组相关，字符串相关，树相关等
15. B树和B+树的区别
16. Comparable 和Comparator的区别
17. 分布式锁的实现




## 答案
1. 因为他们是接口，克隆，序列化应该根据实现类有关
2. LinkedHashMap 和 WeakHashMap 可以实现缓存容器，两者都可以自动回收旧的内存，LinkedHashMap 是通过 重写 `removeEldestEntry` 通过一个闸值决定是否删除老的，WeakHashMap是通过虚拟机的垃圾回收弱引用。ConcurrentHashMap用户多线程环境
3.  
4. 针对增删改采用`Sytem.arraycopy`方法，应用于当写时遍历操作较多的情况的多线程环境，也就是数组长度超大的情况
5. [https://yq.aliyun.com/articles/38340](https://yq.aliyun.com/articles/38340)
6. 由一个状态和队列来辅助锁的工具，主要是独占锁，共享锁4个方法，详见[http://ifeve.com/abstractqueuedsynchronizer-use/#more-18899](http://ifeve.com/abstractqueuedsynchronizer-use/#more-18899)
7. 详见[java.md](jvm.md)的类加载介绍,static 修饰的准备阶段0 or null,初始化真正的值.final 修饰准备阶段赋值真正的值
8. 详见[java.md](jvm.md)的GC介绍
9. 
10. 4个方面，1 数据结构，2 内存管理，3 持久化，4 集群管理 
11. Reactor 属于IO复用同步模型,Proactor属于IO异步模型。Reactor是在事件发生时就通知事先注册的事件（读写由处理函数完成）；Proactor是在事件发生时进行异步I/O（读写由OS完成），待IO完成事件分离器才调度处理器来处。
12. IP和子网掩码转2进制相与 后，得到网络地址，网络地址一样则在一个子网.详见[https://zhidao.baidu.com/question/1822196323113238548.html](https://zhidao.baidu.com/question/1822196323113238548.html)
13. [https://www.zhihu.com/question/37808426](https://www.zhihu.com/question/37808426),SOA和微服务都是跨语言，跨平台，相比SAO,微服务高效开发，便捷构建部署，更轻量级，服务拆分更单一，去中心化，去ESB,微服务倡导细粒度，重用组合.部署打包自动化通过结合docker.微服务更多为了可扩充性、负载均衡以及提高吞吐量而去分解应用.
14. 
15. B+Tree 优势，缩短层高，减少检索时间，去掉data Record 指针。叶子节点链表，实现顺序遍历。
https://www.zhihu.com/question/57466414
16. Comparable 是内部的比较器，Comparator 是外部比较器，在Colletions 作为参数传递
17. 有3种方案，db,redis,zookeeper

