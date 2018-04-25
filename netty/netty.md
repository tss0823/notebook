
## startup
> NioEventLoopGroup 
ServerBootStrap 接受两个线程池
bossGroup 线程池 负责 accept 服务，返回SocketChannel 丢给 workerGroup 处理
workerGroup 线程池 负责 IO read,write

## handler

## pipeline

## eventLoop

## reactor模型
* 单线程  (single)
* 多线程 （accpet single,handdler multi）
* 主从 （accept ,handler all multi）

##
> 参考链接 [https://segmentfault.com/a/1190000007403873](https://segmentfault.com/a/1190000007403873)

