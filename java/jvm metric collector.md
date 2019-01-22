## jvm 指标 采集 技术
http://blog.51cto.com/gnzhutan/1425227

一般Java中间件监控技术分为2种：JMX与ByteCode

byteCode 是通过 JVMTI来拦截被载入的Class

actuator + prometheus + grafana

https://www.callicoder.com/spring-boot-actuator-metrics-monitoring-dashboard-prometheus-grafana/


$ docker run -d --name=prometheus -p 9090:9090 -v /Users/sam/workspace/prometheus.yml:/etc/prometheus/prometheus.yml prom/prometheus --config.file=/etc/prometheus/prometheus.yml

grafana password admin/tss123456@

//复制这个grafana id ，导入grafana import 项中
https://grafana.com/dashboards/6756


## tracing  和 monitor 区别

### 调用链技术
* Zipkin
* Pinpoint
* Skywalking
  


