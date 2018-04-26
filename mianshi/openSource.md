## ZooKeeper
### 目标
> 分布式协调服务器节点,保障一致性，防止脑裂
* Node，类似于unix文件系统，放在内存中，速度快
* 集群，高可用，容错，扩展
* 版本号，顺序性


### 功能
* 配置管理   ``
* 名字服务
* 发布，订阅
* 负载
* 分布式事务
* 分布式锁 `（Leader Election）保证一个服务节点来服务,共享锁，通过序号节点`
* 分布式队列 `序号节点`
* 选举
* 数据同步

### 角色
* Leader
* Follower
* Observer 不参与选举

### 节点
* ephemeral
* persistent

### java客户端 (Dubbu 都在用)
ZkClient
Curator

## RocketMQ vs Kafka vs ActiveMQ


## Nginx vs Httpd

## Netty vs Mina

## Redis vs Memcached

## Tomcat vs Jetty

## Solr vs Electicsearch

## Dubbo vs Hessian

## Fst vs Kryo

## ssm vs ssh

## dbcp vs c3p0


