## 为什么要用可重入锁
> 所谓重入锁，指的是以线程为单位，当一个线程获取对象锁之后，这个线程可以再次获取本对象上的锁，而其他的线程是不可以的
> synchronized 和   ReentrantLock 都是可重入锁
> 可重入锁的意义在于防止死锁
> 实现原理实现是通过为每个锁关联一个请求计数和一个占有它的线程。
> 当计数为0时，认为锁是未被占有的。线程请求一个未被占有的锁时，jvm讲记录锁的占有者，并且讲请求计数器置为1 。
> 如果同一个线程再次请求这个锁，计数将递增；
> 每次占用线程退出同步块，计数器值将递减。直到计数器为0,锁被释放。
> 一个加锁的方法调用另一个加锁的方法,此时如果没有重入的锁，那么这段代码将产生死锁。 

## Java中Lock，tryLock，lockInterruptibly有什么区别
> 抛弃实现上的区别 先从需求上说 首先 synchronized关键字没办法中断申请独占前的阻塞JDK5新追加的JUC解决了这个问题(当然不是只解决这一个问题)
> lock -> 调用后一直阻塞到获得锁
> tryLock -> 尝试是否能获得锁 如果不能获得立即返回
> lockInterruptibly -> 调用后一直阻塞到获得锁 但是接受中断信号(题主用过Thread#sleep吧)

## AbstractQueuedSynchronizer
> tryLock,await 通过链表(node)+state 实现锁和等待
> 实现功能 可重入 state+1,

## Unsafe 一些方法说明 compareAndSwapObject, objectFieldOffset

## unload 写在哪里？为什么？
> 写在finally中，防止代码异常，或者return 不能释放锁，导致死锁

## 什么情况下导致死锁
> 相互等待对方释放锁，两个嵌套的synchronized的方法，两个线程调用，或者lock 不关闭

##  可重入锁，和不可重入锁/自旋锁编写
> https://blog.csdn.net/soonfly/article/details/70918802




## 资料
[Java中Lock，tryLock，lockInterruptibly有什么区别](https://www.zhihu.com/question/36771163/answer/68978834)