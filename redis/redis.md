## 客户端连接服务器
src/redis-cli -h 10.24.31.96 -p 7379

## 获取版本
10.24.31.96:6379> info
# Server
redis_version:3.0.7

## 数据结构
字符串、列表、集合、有序集合、哈希

## 数据持久化
### RDB快照
* 二进制数据库文件，时间+次数 fork 进程 saveTo tempFile,然后rename tempFile to rdb文件，在生成快照前后这段时间的数据因服务宕机可能丢失

### AOF（Append Only File）日志
* 协议文本数据库文件，保存数据修改命令
* aof 重写，瘦身，保存add命令即可
* 保存模式 
> AOF_FSYNC_NO
> AOF_FSYNC_EVERYSEC
> AOF_FSYNC_ALWAYS

![](res/0.png)

## 内存结构和管理
> 内存的大小放入内存头中

## 内存回收策略 (lru,random,ttl)
* volatile-lru -> remove the key with an expire set using an LRU algorithm
* allkeys-lru -> remove any key accordingly to the LRU algorithm
* volatile-random -> remove a random key with an expire set
* allkeys-random -> remove a random key, any key
* volatile-ttl -> remove the key with the nearest expire time (minor TTL)
* noeviction -> don't expire at all, just return an error on write operations

## vs memcached
* 数据结构，redis 有5种，memcached key-value
* 分布式，reddis 负载主从，memcached 通过外部client 环状hash
* 内存模型，redis，memcached 预分配，chunk,Slab Class,Slab Allocation
* 持久化，redis 快照，aof,memcached 没有
* IO模型，redis是单线程+io多路复用：检查文件描述的就绪状态，memcached 是多线程+锁

## sentinel (哨兵)
Redis 的 Sentinel 系统用于管理多个 Redis 服务器（instance）， 该系统执行以下三个任务
**监控（Monitoring）：** Sentinel 会不断地检查你的主服务器和从服务器是否运作正常。
**提醒（Notification）：** 当被监控的某个 Redis 服务器出现问题时， Sentinel 可以通过 API 向管理员或者其他应用程序发送通知。
**自动故障迁移（Automatic failover）：** 当一个主服务器不能正常工作时， Sentinel 会开始一次自动故障迁移操作， 它会将失效主服务器的其中一个从服务器升级为新的主服务器， 并让失效主服务器的其他从服务器改为复制新的主服务器； 当客户端试图连接失效的主服务器时， 集群也会向客户端返回新主服务器的地址， 使得集群可以使用新主服务器代替失效服务器。

## 主从集群


## 参考资料
* [http://redisbook.readthedocs.io/en/latest/internal/aof.html](http://redisbook.readthedocs.io/en/latest/internal/aof.html)
* [https://yq.aliyun.com/articles/67122](https://yq.aliyun.com/articles/67122)
* [https://www.biaodianfu.com/redis-vs-memcached.html](https://www.biaodianfu.com/redis-vs-memcached.html)
* [主从集群](https://blog.csdn.net/u011204847/article/details/51307044)
* [sentinel](https://blog.csdn.net/u011204847/article/details/51307044)
