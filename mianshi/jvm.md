## JVM
> 结构图
![](res/0.jpeg)

## 内存结构
> 5大区域
* 方法区 `常量池`
* 栈 `局部变量表，操作数栈，动态链接，返回地址`
* 堆
* 本地方法栈
* PC计数器

### 内存溢排查
* -XX:-HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=./java_pid<pid>.hprof

## GC

### 调节参数
* -Xms `初始堆大小，默认为物理内存的1/64(<1GB)；默认(MinHeapFreeRatio参数可以调整)空余堆内存小于40%时，JVM就会增大堆直到-Xmx的最大限制`
* -Xmx `最大堆大小，默认(MaxHeapFreeRatio参数可以调整)空余堆内存大于70%时，JVM会减少堆直到 -Xms的最小限制`
* -Xmn `新生代大小`
* -Xss `栈大小`
* -XX:SurvivorRatio `默认值为8。两个Survivor区与一个Eden区的比值为2:8`
* -XX:PermSize `设置永久代(perm gen)初始值。默认值为物理内存的1/64`
* -XX:MaxPermSize

### 算法
* 复制 主要针对新生代 `s1 s2 Edern`
* 标志清除 针对老年代
* 标记整理 针对老年代 cms `向一边移动`

### GC 回收器（7种）
* 新生代：Serial       ParNew       Parrallel Scanvenge
* 老年代：Serial Old                Parrallel Old   CMS
* G1 
* minor GC AND Full Gc分别在什么时候发生
* jdk1.8 永久代 用 元空间替换了，元空间使用的是本地内存，字符变量放到了heap space,方法区放到了元空间。

### GC 应用场景
* Serial收集器，客户端模式，桌面应用场景,单核cpu
* ParNew，server模式下首选，只有它嫩个跟cms结合使用
* Parallel Scavenge（并行回收）收集器，该收集器的目标是达到一个可控制的吞吐量（Throughput）,吞吐量=运行用户代码时间/（运行用户代码时间+垃圾收集时间）,主要适合在后台运算而不需要太多交互的任务
* CMS(Concurrent Mark Sweep)，主要优点：并发收集，低停顿。应用场景 响应速度，希望系统停顿时间最短，以给用户带来较好的体验，-XX:CMSInitiatingOccupancyFraction浮动百分比触发回收 
* G1,jdk1.7出现，面向服务端应用，针对具有大内存、多处理器的机器

### 监控方式
* `jstat –gcutil` 来查看堆中各个内存区域的变化以及GC的工作状态
* `-XX:+PrintGCDetails  –Xloggc:<file>`输出到日志文件来查看GC的状况
* `jmap –heap`可用于查看各个内存空间的大小

### 性能诊断调优工具
* jps
* jmap  `histo,dump`
* jhat  `分析dmp文件`
* jstack
* jstat  `gcutil`
* jConsole
* jVisualvm  

## 类加载
> 7个阶段

### 加载
> 加载是类加载过程中的一个阶段，这个阶段会在内存中生成一个代表这个类的java.lang.Class对象，作为方法区这个类的各种数据的入口。注意这里不一定非得要从一个Class文件获取，这里既可以从ZIP包中读取（比如从jar包和war包中读取），也可以在运行时计算生成（动态代理），也可以由其它文件生成（比如将JSP文件转换成对应的Class类）

### 验证
> 这一阶段的主要目的是为了确保Class文件的字节流中包含的信息是否符合当前虚拟机的要求，并且不会危害虚拟机自身的安全,大致分为4个阶段
1. 文件格式的验证：验证字节流是否符合Class文件格式的规范，并且能被当前版本的虚拟机处理，该验证的主要目的是保证输入的字节流能正确地解析并存储于方法区之内。经过该阶段的验证后，字节流才会进入内存的方法区中进行存储，后面的三个验证都是基于方法区的存储结构进行的。 

2. 元数据验证：对类的元数据信息进行语义校验（其实就是对类中的各数据类型进行语法校验），保证不存在不符合Java语法规范的元数据信息。 

3. 字节码验证：该阶段验证的主要工作是进行数据流和控制流分析，对类的方法体进行校验分析，以保证被校验的类的方法在运行时不会做出危害虚拟机安全的行为。 

4. 符号引用验证：这是最后一个阶段的验证，它发生在虚拟机将符号引用转化为直接引用的时候（解析阶段中发生该转化，后面会有讲解），主要是对类自身以外的信息（常量池中的各种符号引用）进行匹配性的校验。 

### 准备
准备阶段是正式为类变量分配内存并设置类变量的初始值阶段，即在方法区中分配这些变量所使用的内存空间。注意这里所说的初始值概念，比如一个类变量定义为：
```
public static int v = 8080;
```
实际上变量v在准备阶段过后的初始值为0而不是8080，将v赋值为8080的putstatic指令是程序被编译后，存放于类构造器<client>方法之中，这里我们后面会解释。
但是注意如果声明为：

```
public static final int v = 8080;
```
在编译阶段会为v生成ConstantValue属性，在准备阶段虚拟机会根据ConstantValue属性将v赋值为8080

### 解析
> 解析阶段是指虚拟机将常量池中的符号引用替换为直接引用的过程。符号引用就是class文件中的
* CONSTANT_Class_info
* CONSTANT_Field_info
* CONSTANT_Method_info

> 下面我们解释一下符号引用和直接引用的概念
* 符号引用与虚拟机实现的布局无关，引用的目标并不一定要已经加载到内存中。各种虚拟机实现的内存布局可以各不相同，但是它们能接受的符号引用必须是一致的，因为符号引用的字面量形式明确定义在Java虚拟机规范的Class文件格式中
* 直接引用可以是指向目标的指针，相对偏移量或是一个能间接定位到目标的句柄。如果有了直接引用，那引用的目标必定已经在内存中存在

### 初始化
顺序
1. 按代码顺序递归加载静态成员/代码块,先父类再本类
2. 按代码顺序递归加载非静态成员/代码块,先父类再本类
3. 按代码顺序递归调用构造函数,先父类再本类

触发初始化条件
1. 创建类的实例，也就是new的方式
2. 访问某个类或接口的静态变量，或者对该静态变量赋值
3. 调用类的静态方法
4. 反射（如Class.forName("xxx")）
5. 初始化某个类的子类，则其父类也会被初始化

## 静态多分派、动态单分派
![](res/3.png)

## 双亲委托（Parents Delegation Model）
> 为什么叫双亲委托，大概就是 parents 是多个父亲，也就是双亲吧
启动类加载器 < 扩展类加载器 < 应用程序类加载器 < 自定义类加载器

## jvm 调优
### jconsole,jvisualvm
> jvisualvm 监控cpu,垃圾回收活动，堆的使用，元空间的使用，线程，检测死锁

## 参考资料
* [http://www.blogjava.net/chhbjh/archive/2012/01/28/368936.html](http://www.blogjava.net/chhbjh/archive/2012/01/28/368936.html)
* [http://www.importnew.com/25295.html](http://www.importnew.com/25295.html)
* [JVM(HotSpot) 7种垃圾收集器的特点及使用场景](https://blog.csdn.net/tjiyu/article/details/53983650) 
* [静态多分派、动态单分派](http://wiki.jikexueyuan.com/project/java-vm/polymorphism.html)