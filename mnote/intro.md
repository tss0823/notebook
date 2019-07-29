## 软件
### note unit
精简，完整，详细，userId,timeCycleIndex=index(0=5min,1=30min),status(create,study,pass)

### note category 
无限极，userId

## timeCycle 时间周期（绑定用户id,最多允许10个）
5min 30min 12hour 1d 2d 4d 7d 15d
index 序号


## 时间note
每个时间单元成成note记录，每次时间5分钟（+5min 查询note），如果在这时间段内的note，就放到一起
status(0 未完成，1 已完成)，showTime，index

## 用户
accountNo,email,mobile,pwd,userName,nickName,gender

## ### UI 功能
* 登录
* 申请注册
* 忘记密码
* 修改密码
* 修改用户信息
* note 添加，修改，删除，我的note列表（待学习，已完成）
* 待学习note任务（单位时间note组）
* note任务列表 （详情，完成并制定开始(给定时间后)，完成（如果timeUnitType==max category index 相当于完成），pass）
* 统计（汇总 今日新增，今日学习，今日pass,周，月，季度，年）（时间（日，周，月，年），新增，学习，pass）

## 二期
* 圈子，加好友，分享，排名，打卡

## 管理后台
* 用户
* note
* 类目
* 时间周期
* 周期note任务

## 技术设计
* 一分钟跑一次，根据note类型找个时间周期下一个unit,计算时间是否达到，达到就生成任务（如果以存在未完成任务则不生成）

## service
### reids
brew services start redis
/usr/local/etc/redis.conf

### es
Data:    /usr/local/var/lib/elasticsearch/
Logs:    /usr/local/var/log/elasticsearch/elasticsearch_long3.log
Plugins: /usr/local/var/elasticsearch/plugins/
Config:  /usr/local/etc/elasticsearch/
elasticsearch  ## 启动


707839
Tss123456!


## aliyun
/usr/sbin/nginx -c /home/admin/conf/nginx-cloudapp.conf
/usr/sbin/mysqld --daemonize --pid-file=/var/run/mysqld/mysqld.pid
/usr/bin/java -server -Xms492M -Xmx492M -Dserver.port=8080 -jar /home/admin/cloudapp-run/spring-boot-sample-simple-1.0.jar

## 小程序账号
tss0823@gmail.com
app Id wxe05d1b80a0610044
原始Id gh_ccf11289e1cb


appId && secret


wxe05d1b80a0610044
160448113611a1d7fcb411a54dc7f71e

## 小程序研究
https://www.xiaopiu.com



## login
https://blog.csdn.net/run_youngman/article/details/82782380

