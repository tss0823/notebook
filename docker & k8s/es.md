## install
### es 集群 k8s
* https://blog.csdn.net/chenleiking/article/details/79453460
* https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#docker-prod-cluster-composefile

## elk 集群 k8s
* https://cloud.tencent.com/developer/article/1343712

## xpack 认证
* https://www.jianshu.com/p/eaf54202aa08

## 依赖日志 (连接关系， /var/lib/docker/containers 才是最终日志)
> /var/log/containers > /var/log/pods/  >  /var/lib/docker/containers

## 安装ik
./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.2.2/elasticsearch-analysis-ik-6.2.2.zip
https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v6.4.3/elasticsearch-analysis-ik-6.4.3.zip

## es 问题
AccessDeniedException: /usr/share/elasticsearch/data/nodes
https://github.com/elastic/elasticsearch-docker/issues/21

## es 健康监测问题
2019-02-01 02:54:27,105 WARN  [http-nio-28082-exec-6] org.springframework.boot.actuate.health.AbstractHealthIndicator: Elasticsearch health check failed
java.net.ConnectException: Connection refused
	at org.elasticsearch.client.RestClient$SyncResponseListener.get(RestClient.java:943)
	at org.elasticsearch.client.RestClient.performRequest(RestClient.java:227)
	at org.springframework.boot.actuate.elasticsearch.ElasticsearchRestHealthIndicator.doHealthCheck(ElasticsearchRestHealthIndicator.java:58)
	at org.springframework.boot.actuate.health.AbstractHealthIndicator.health(AbstractHealthIndicator.java:84)
	at org.springframework.boot.actuate.health.CompositeHealthIndicator.health(CompositeHealthIndicator.java:98)
	at org.springframework.boot.actuate.health.HealthEndpoint.health(HealthEndpoint.java:50)
	at org.springframework.boot.actuate.health.HealthEndpointWebExtension.health(HealthEndpointWebExtension.java:54)
    