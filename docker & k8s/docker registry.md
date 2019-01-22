## 安装
* https://www.linuxidc.com/Linux/2018-03/151308.htm
* docker pull registry
* docker run -itd -v /data/registry:/var/lib/registry -p 5000:5000 --restart=always --name registry registry:latest 
* 遇到 docker registry iptables: No chain/target/match by that name 
 > systemctl restart docker.service 重启解决
 * 测试镜像库
 > curl http://127.0.0.1:5000/v2/_catalog
 * docker tag busybox:latest  172.16.0.236:5000/busybox:v1
 * docker push 172.16.0.236:5000/busybox:v1
 * 删除主机镜像
 > docker rmi  -f 758ec7f3a1ee
 
 ## 授权
 * docker run --entrypoint htpasswd registry -Bbn loongPay lp123456@ > auth/htpasswd
 

 //生成 key
 https://medium.com/@ifeanyiigili/how-to-setup-a-private-docker-registry-with-a-self-sign-certificate-43a7407a1613
openssl req  -newkey rsa:4096 -nodes -sha256 -keyout certs/domain.key -x509 -days 365 -out certs/domain.crt
mkdir -p /etc/docker/certs.d/172.16.0.236:5000
cp certs/domain.crt /etc/docker/certs.d/172.16.0.236:5000/ca.crt
certs/domain.crt /usr/local/share/ca-certificates/ca.crt

 //end
 发布出现问题
 Error response from daemon: Get https://172.16.0.236:5000/v2/: x509: cannot validate certificate for 172.16.0.236 because it doesn't contain any IP SANs

准备解决连接：
https://serverfault.com/questions/611120/failed-tls-handshake-does-not-contain-any-ip-sans

https://github.com/docker/distribution/issues/948

改了认证问题记得重启
systemctl restart docker.service


 docker run -d -p 5000:5000 --restart=always --name registry -v `pwd`/certs:/root/registry/certs  -v `pwd`/auth:/root/registry/auth -e "REGISTRY_AUTH=htpasswd" -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e REGISTRY_AUTH_HTPASSWD_PATH=/root/registry/auth/htpasswd -e REGISTRY_HTTP_TLS_CERTIFICATE=/root/registry/certs/domain.crt -e REGISTRY_HTTP_TLS_KEY=/root/registry/certs/domain.key -v /data:/var/lib/registry registry

 docker run -d -p 5000:5000 --restart=always --name registry -v /etc/kubernetes/pki:/etc/registry/certs  -v `pwd`/auth:/root/registry/auth -e "REGISTRY_AUTH=htpasswd" -e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" -e REGISTRY_AUTH_HTPASSWD_PATH=/root/registry/auth/htpasswd -e REGISTRY_HTTP_TLS_CERTIFICATE=/etc/registry/certs/ca.crt -e REGISTRY_HTTP_TLS_KEY=/etc/registry/certs/ca.key -v /data:/var/lib/registry registry



* UI
docker run -d -p 83:80 --restart=always -e REGISTRY_URL=http://127.0.0.1:5000 -e DELETE_IMAGES=true joxit/docker-registry-ui:static

* 登录 仓库
> docker login -u loongPay -p lp123456@  172.16.0.236:5000

* 问题 http: server gave HTTP response to HTTPS client

vim /etc/docker/daemon.json 
{
  "registry-mirrors": [ "https://registry.docker-cn.com"],
  "insecure-registries": [ "172.18.18.90:5000"]
}

* 172.31.245.31

* 查看内网ip
> kubectl get pods --all-namespaces -o=wide

* 查看部署的应用
> kubectl get deployments

* service  (https://segmentfault.com/a/1190000014116698)
> Service访问。借助Service，可以方便的实现服务发现与负载均衡。
Service可以被指定四种类型：

ClusterIP - 在集群中内部IP上暴露服务。此类型使Service只能从群集中访问。
NodePort - 通过每个 Node 上的 IP 和静态端口（NodePort）暴露服务。NodePort 服务会路由到 ClusterIP 服务，这个 ClusterIP 服务会自动创建。通过请求 <NodeIP>:<NodePort>，可以从集群的外部访问一个 NodePort 服务。
LoadBalancer - 使用云提供商的负载均衡器（如果支持），可以向外部暴露服务。外部的负载均衡器可以路由到 NodePort 服务和 ClusterIP 服务。(一般常用此类型向外暴露端口，并做负载均衡)
ExternalName - 通过返回 CNAME 和它的值，可以将服务映射到 externalName 字段的内容，没有任何类型代理被创建。

* deployment
> kubectl create -f  deploy.yml
> kubectl delete -f  deploy.yml

* service
> 

* expose
> kubectl expose deployment pay-member --type=LoadBalancer

* k8s login get token
> kubectl -n kube-system describe $(kubectl -n kube-system get secret -n kube-system -o name | grep namespace) | grep token
> eyJhbGciOiJSUzI1NiIsImtpZCI6IiJ9.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJuYW1lc3BhY2UtY29udHJvbGxlci10b2tlbi1yaGNmbCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJuYW1lc3BhY2UtY29udHJvbGxlciIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImZjOTZhYTUzLTA4ZDktMTFlOS1iZDEyLTAwMTYzZTA0Yzk5YyIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlLXN5c3RlbTpuYW1lc3BhY2UtY29udHJvbGxlciJ9.be-Cfb38BzZfcgbYqfKkMAh_bWjbe0bMjr_75yHeR6NO7vV1-lDvjE_BQjPfvq_xDbVX5DKxDKJvrVhNPL9UMWJKlTXTC7AFbjwtqqyXoL_ZDzjhKsXC-cMsza_ydalepdJ4RVoOk0m2vpOPQsYEWzMUYGcPeqkjZrhzZI3aFhUJW3Y9rLFPZuOMLWxReJLDY3ZSpqouutGVMGKvsAOhcerqzNkzk66z8-a8WmH5jpL3M-ud0FFm3nHwIet8McWs98zykpn1JMWBg4KnayhbCcdkaCGP71aGuvXDU44rvWf0JcPPctcw4Vdy00Avd8B-dUrj9L0_1nZQ4ZdVUOJprw

* kubectl 重启
> systemctl restart kubelet

* create namespace
> kubectl config set-context dev --namespace=development --cluster=lithe-cocoa-92103_kubernetes --user=kubernetes-admin
> kubectl config set-context prod --namespace=production --cluster=kubernetes --user=kubernetes-admin
> https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
> https://kubernetes.io/docs/tasks/administer-cluster/namespaces/
> https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/
> https://kubernetes.io/docs/concepts/configuration/secret/

* x509
> https://brancz.com/2017/10/16/kubernetes-auth-x509-client-certificates/

* 添加用户
> kubectl config set-credentials admin --username="admin" --password="123456@abcLoongPay"
> kubectl config set-context dev --cluster=kubernetes --user=admin

* 认证方式  https://zhangchenchen.github.io/2017/08/17/kubernetes-authentication-authorization-admission-control/
> static token  file
> Bootstrap Tokens
> Static Password File
> Service Account Tokens

* 授权模式
> Node Authorization
> ABAC Authorization
> RBAC Authorization
> Webhook Authorization

* RBAC 示例
> https://docs.bitnami.com/kubernetes/how-to/configure-rbac-in-your-kubernetes-cluster/


* 卷 
> 要使用卷，需要为 pod 指定为卷（spec.volumes 字段）以及将它挂载到容器的位置（spec.containers.volumeMounts 字段）


* dokcer 格林时间 差8小时问题
> https://blog.csdn.net/a1010256340/article/details/80269508

* elk
> kubectl apply -f elk-single.yaml

* kubectl create secret docker-registry myregistrykey --docker-server=172.16.0.236:8500 --docker-username=loongPay --docker-password=lp123456@ --docker-email=sam@gmail.com


 Failed to pull image "172.16.0.236:5000/pay-member:v1.0": rpc error: code = Unknown desc = Error response from daemon: Get https://172.16.0.236:5000/v2/: x509: cannot validate certificate for 172.16.0.236 because it doesn't contain any IP SANs 

*  docker inspect f553caa23155  查看docker 信息
  
* curl --cacert /root/registry/certs/domain.crt  --basic --user loongPay:lp123456@ https://172.16.0.236:5000/v2/_catalog


openssl x509 -req -days 365 -in certs/domain.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem
echo subjectAltName = IP:172.16.0.236 > extfile.cnf
openssl x509 -req -days 365 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf


