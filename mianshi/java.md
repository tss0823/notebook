## 基础（熟悉java api）
* 字符串
* 容器类（ArrayList,HashMap,TreeMap,LinkedList,Set,Stack,Queue）
* 工具类 （Collections,Calendar,System）
* IO/NIO
* net(URL,URLConnection,HttpURLConnection,Socket)


## jvm
* jvm 内存模型 （5大模型）
* GC （7钟类型）
* 类加载(7个阶段) ，双亲委派，三种破坏双亲委派



## 设计原则 （6大原则）
* 开闭原则 `OCP，基于接口抽象开发，尽可能去扩展，而不是去修改`
* 里氏替换原则 `LSP，更好的利用基类的方法，AbstService,AbsController`
* 依赖倒置原则(Dependence Inversion Principle DIP) `细节依赖于抽象，高层模块不应该依赖底层模块` 
* 接口隔离原则(Interface Segregation Principle ISP) `根据业务建立单一个接口,一个缓存实现两个接口 CacheService,QueueService`
* 合成/聚合复用原则(Composite/Aggregate Reuse Principle CARP) `在一个新的对象里面使用一些已有的对象，spring 注入service类`
* 迪米特法则(Law of Demeter LoD) `不要给陌生人说话,可以通过中介转发`
> 心得：高内聚低耦合，面向接口编程，组合优先继承，创建与使用分离

## 设计模式 (23种)
* 创建型模式，共五种：工厂方法模式、抽象工厂模式、单例模式、建造者模式、原型模式。
* 结构型模式，共七种：适配器模式、装饰器模式、代理模式、外观模式、桥接模式、组合模式、享元模式。
* 行为型模式，共十一种：策略模式、模板方法模式、观察者模式、迭代子模式、责任链模式、命令模式、备忘录模式、状态模式、访问者模式、中介者模式、解释器模式。





