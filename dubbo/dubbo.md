## 目标
> 分布式垂直应用调用的协调治理
> 解耦，负载，容错，监控，扩展，运维

## RPC 特征
1. 接口序列化,反序列化
2. socket IO
3. 接口实例，工厂
4. 负载，监控
5. 协议

## 功能
### 集群容错
* Failover `失败自动切换，当出现失败，重试其它服务器,可通过 retries="2" 来设置重试次数(不含第一次)`
* Failfast `快速失败，只发起一次调用，失败立即报错。通常用于非幂等性的写操作，比如新增记录`
* Failsafe `失败安全，出现异常时，直接忽略。通常用于写入审计日志等操作`
* Failback `失败自动恢复，后台记录失败请求，定时重发。通常用于消息通知操作`

### 负载
* Random
* RR (RoundRobin)
* LeastActive `最少活跃调用`
* ConsistentHash `一致性Hash`






## dubbo 注册中心
* multicast `相互监控`
* Zookeeper 
* Redis
* Simple `需要安装simple节点`

## 资料
[https://github.com/apache/incubator-dubbo](https://github.com/apache/incubator-dubbo)





