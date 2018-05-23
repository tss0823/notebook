## 为什么使用B+Tree 做索引，而不用BTree,Hash,RBTree
* 不用BTree,层数少，IO次数限制
* 不用Hash,不利于范围查询
* 不用RBTree，层数少，IO次数限制

## InnoDB索引和MyISAM索引区别
聚集索引和非聚集索引的区别
* 聚集索引，通过主键索引组织的索引数据，集合副索引
* 非聚集索引，keyword 来

## Mysql 为什么用自增数字作为id,而不是随机数，或其他字符
* 算法 B+Ttree append更简单
* 物理上 能分配连续的文件block
* 查询 B+Tree 更简单

## 怎样提高缓存命中率

## 文件
* 参数文件
* 日志文件
* socket 文件 `/tmp/mysql.socket`
* pid 文件
* 表结构文件  `frm`
* 引擎文件 `表空间文件ibdata1,idb,重做日志文件ib_logfile0,ib_logfile1`

## 日志文件
* 错误日志（error log）
* 二进制日志 （binlog）
* 慢查询日志 （slow query log）
* 查询日志 （log）

## 二进制日志和重做日志的区别
> 二进制是逻辑上sql,重做日志是物理上



## redo undo
> redo log 也称重做日志，用来保证事务的原子性和持久性。undo log 用来保证事务的一致性

## 调优
* CPU，看是OLAP,还是OLTP系统，OLAP是cpu密集型，很多比较，排序计算，OLTP是IO密集型，时间短，sql简单。innodb_read_io_threads,innodb_write_io_threads 调大来增加IO的线程。
* 操作系统64，内存使用>4G
* 文件系统，windows默认NTFS,Linux EXT3,EXT4,XFS
* 测试工具 sysbench,tpcc-mysql

## 索引最左匹配原则
* 最左前缀匹配原则，非常重要的原则，mysql会一直向右匹配直到遇到范围查询(>、<、between、like)就停止匹配

## mysql 索引类型
* 主键 `必须唯一，不允许为空`
* 唯一 `允许为空`
* 普通索引
* 组合索引/联合索引
* 全文索引 `分词搜索`

## 新建索引的5大原则
1. 最左前缀匹配原则，非常重要的原则，mysql会一直向右匹配直到遇到范围查询(>、<、between、like)就停止匹配，比如a = 1 and b = 2 and c > 3 and d = 4 如果建立(a,b,c,d)顺序的索引，d是用不到索引的，如果建立(a,b,d,c)的索引则都可以用到，a,b,d的顺序可以任意调整。
2. =和in可以乱序，比如a = 1 and b = 2 and c = 3 建立(a,b,c)索引可以任意顺序，mysql的查询优化器会帮你优化成索引可以识别的形式
3. 尽量选择区分度高的列作为索引,区分度的公式是count(distinct col)/count(*)，表示字段不重复的比例，比例越大我们扫描的记录数越少，唯一键的区分度是1，而一些状态、性别字段可能在大数据面前区分度就是0，那可能有人会问，这个比例有什么经验值吗？使用场景不同，这个值也很难确定，一般需要join的字段我们都要求是0.1以上，即平均1条扫描10条记录
4. 索引列不能参与计算，保持列“干净”，比如from_unixtime(create_time) = ’2014-05-29’就不能使用到索引，原因很简单，b+树中存的都是数据表中的字段值，但进行检索时，需要把所有元素都应用函数才能比较，显然成本太大。所以语句应该写成create_time = unix_timestamp(’2014-05-29’);
5. 尽量的扩展索引，不要新建索引。比如表中已经有a的索引，现在要加(a,b)的索引，那么只需要修改原来的索引即可

## 哪些条件不走索引
1. null 值判断；
2. != , <> 操作符；
3. or(大多数情况下)；
4. in（大多数情况下）；
5. like的使用（大多数情况下）；
6. where 子句中对字段进行表达式操作,eg： select id from t where num/2=100 ；
7. 在 where 子句中对字段进行函数操作
8. 在 where 子句中的“=”左边进行函数、算术运算或其他表达式运算；


## 参考资料
* [https://www.cnblogs.com/xinysu/p/6555082.html](https://www.cnblogs.com/xinysu/p/6555082.html)
* [https://tech.meituan.com/mysql-index.html](https://tech.meituan.com/mysql-index.html)
* [MySQL 索引及查询优化总结](https://cloud.tencent.com/developer/article/1004912)