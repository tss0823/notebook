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
[https://www.cnblogs.com/xinysu/p/6555082.html](https://www.cnblogs.com/xinysu/p/6555082.html)