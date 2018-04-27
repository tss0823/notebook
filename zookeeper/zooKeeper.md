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

### 节点 （4种）
* ephemeral (普通，顺序)
* persistent （普通，顺序）

#### 节点信息
* DataTree 整棵树对象
* DataNo 树节点，包括 parent:DataNode data:byte[] acl:Long stat:StatPersisted children:Set<String>
* 所有的DataNo 通过ConcurrentHashMap 存储，key为路径path

## 持久化


### java客户端 (Dubbu 都在用)
ZkClient
Curator