## 拼便宜
* a = 3,b > 2,c = 1 哪些走索引
* redis 两个线程 修改一个变量安全吗，有哪些措施保证安全 setnx
* 分布式事务 交易系统中，订单库，库存库，通过redis 轮询a,b节点
* hashMap 1.8 链表转红黑树为什么闸值是8  

## 聚轮网络
* zookeeper 监控的节点挂掉了，怎样自动重启 (客户端轮询服务端列表重新请求，如果会话过期则创建一个新实例，中间可能出现会话转移问题，导致操作覆盖，3.2.0版本之后发现不是owner直接抛出异常)
* zookeeper 一个节点挂掉了，其他节点怎样去选举
* 多数据源的事务
* 搜索的业务商户与多少红包（1000代理商，*100商户，10w商户，*3-5红包 30w-50w红包,100w pv）


## 阿里巴巴新零售
* jmm & gc 描述
* nio & aio 区别
* poll & epoll 区别
* concurrentHashMap hashTable 区别
* 一个接口很慢怎么找问题
* 一个表大量的数据怎么查询，索引都建好了
* 通过做项目学到和总结的东西
* sychronized 和 reentrantlock 区别
* 分布式事务2阶段和3阶段提交描述，以及paxos
* mysql 和 nosql 应用场景

## 二维火
* 索引怎么建，a and b and c and d,b c,d c,a
* rocketmq 机制

## 数脉科技
* jdk 怎么编译，依赖的库文件
* tomcat 组件，启动流程

## 大搜车
a 线程每秒钟 打印count++,b 线程监控count=10 关掉a,b 也结束

## 车蚁金融
spring cloud 应用网关

## 人力窝
mq 幂等 producer > servername > customer

## 小v客
* 一分钟内限制接口调用次数 (redis setnx setex)
* tree 表 根据path 查询所有的子节点





