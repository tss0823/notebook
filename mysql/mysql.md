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