
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

## NIO 空转bug,netty 解决
linux 2.6 socket 中断，epoll 轮询不堵塞，在java while.select 中一直占用CPU
##
> 参考链接 [https://segmentfault.com/a/1190000007403873](https://segmentfault.com/a/1190000007403873)

