## 分片、副本配置
```
index.number_of_shards: 5 
index.number_of_replicas: 2
```
表示每个节点5个分片，每个分片包含2个副本分片，总共15个分片，正好可以配置3个节点

### 目录结构
elasticsearch_1/data/ec_cluster/nodes/0/indices/stack_log-2018.05/4/index/

## 创建索引
![](res/5.png)
以下是在主副分片和任何副本分片上面 成功新建，索引和删除文档所需要的步骤顺序：

1. 客户端向 Node 1 发送新建、索引或者删除请求。
2. 节点使用文档的 _id 确定文档属于分片 0 。请求会被转发到 Node 3`，因为分片 0 的主分片目前被分配在 `Node 3 上。
3. Node 3 在主分片上面执行请求。如果成功了，它将请求并行转发到 Node 1 和 Node 2 的副本分片上。一旦所有的副本分片都报告成功, Node 3 将向协调节点报告成功，协调节点向客户端报告成功。

## 获取单个文档
![](res/6.png)
以下是从主分片或者副本分片检索文档的步骤顺序：

1. 客户端向 Node 1 发送获取请求。

2. 节点使用文档的 _id 来确定文档属于分片 0 。分片 0 的副本分片存在于所有的三个节点上。 在这种情况下，它将请求转发到 Node 2 。

3. Node 2 将文档返回给 Node 1 ，然后将文档返回给客户端。

在处理读取请求时，协调结点在每次请求的时候都会通过轮询所有的副本分片来达到负载均衡。

在文档被检索时，已经被索引的文档可能已经存在于主分片上但是还没有复制到副本分片。 在这种情况下，副本分片可能会报告文档不存在，但是主分片可能成功返回文档。 一旦索引请求成功返回给用户，文档在主分片和副本分片都是可用的。

## 局部更新文档
![](res/7.png)
以下是部分更新一个文档的步骤：

客户端向 Node 1 发送更新请求。
它将请求转发到主分片所在的 Node 3 。
Node 3 从主分片检索文档，修改 _source 字段中的 JSON ，并且尝试重新索引主分片的文档。 如果文档已经被另一个进程修改，它会重试步骤 3 ，超过 retry_on_conflict 次后放弃。
如果 Node 3 成功地更新文档，它将新版本的文档并行转发到 Node 1 和 Node 2 上的副本分片，重新建立索引。 一旦所有副本分片都返回成功， Node 3 向协调节点也返回成功，协调节点向客户端返回成功。

## 路由
shard = hash(routing) % number_of_primary_shards `routing 默认为_id`

## 参考文献
* [https://www.elastic.co/guide/cn/elasticsearch/guide/current/intro.html](https://www.elastic.co/guide/cn/elasticsearch/guide/current/intro.html) [英文版](https://www.elastic.co/guide/en/elasticsearch/guide/current/index.html)
* [文件配置](https://blog.csdn.net/u010039929/article/details/56840531)
