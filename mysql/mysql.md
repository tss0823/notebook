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

## 

## redo undo
> redo log 也称重做日志，用来保证事务的原子性和持久性。undo log 用来保证事务的一致性

## 参考资料
[https://www.cnblogs.com/xinysu/p/6555082.html](https://www.cnblogs.com/xinysu/p/6555082.html)