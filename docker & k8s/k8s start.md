## 重装
* 因为修改了ip，如果只是直接改ip,在 /etc/kubernetes or ~/.kube/ 改的话，会出现 Unable to connect to the server: x509: certificate is valid for 10.96.0.1, 172.31.245.31, not 172.16.0.236 
* https://stackoverflow.com/questions/46360361/invalid-x509-certificate-for-kubernetes-master 这里有解释why
* 还有一种方式直接跳过验证
-bash-4.2# kubectl --insecure-skip-tls-verify  get nodes --all-namespaces
NAME               STATUS   ROLES    AGE   VERSION
skyline-delivery   Ready    master   11d   v1.13.1

kubeadm alpha phase certs selfsign --apiserver-advertise-address=0.0.0.0 --cert-altnames=172.31.245.31 --cert-altnames=172.16.0.236 
docker rm `docker ps -q -f 'name=k8s_kube-apiserver*'`
systemctl restart kubelet


### 步骤
* kubectl drain skyline-delivery --delete-local-data --force --ignore-daemonsets
* kubectl delete node skyline-delivery
* kubeadm reset
* 重启  kubelet
* 批量替换 sed -i "s/172.31.245.31/172.16.0.236/g" `grep "172.31.245.31" *.conf`
* docker 批量操作  docker stop `docker ps -q -f 'name=k8s_*'`


## 重新安装步 
* 设置 hostname
hostnamectl set-hostname your-new-hostname
vim /etc/hostname
主节点初始化
* kubeadm init --apiserver-advertise-address=172.16.0.236 --pod-network-cidr=10.244.0.0/16
>
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

export KUBECONFIG=/etc/kubernetes/admin.conf

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml


让主节点能安排pod
* kubectl taint nodes --all node-role.kubernetes.io/master-

从节点加入
* kubeadm join 172.16.0.236:6443 --token 27hatw.1jq7cx4vcrh3oyvu --discovery-token-ca-cert-hash sha256:79f107337b1378325d9d78b54f34e38a5e98538e0a2983c8f478aed4efd0889f

拷贝主节点的admin.conf 到从节点，从节点才能操作相关命令
* scp root@172.16.0.236:/etc/kubernetes/admin.conf ~/
* kubectl --kubeconfig ./admin.conf get nodes

### 安装 kubernetes-dashboard.yaml
* kubectl apply -f kubernetes-dashboard.yaml
* 一直停留在 ContainerCreating 
* kubectl describe pod kubernetes-dashboard-57df4db6b-dfzrf --namespace=kube-system ## 通过这个方法来诊断
* "cni0" already has an IP address different from 10.244.1.1/24
太困惑
通过这个链接解决 https://www.cnblogs.com/jiuchongxiao/p/8942080.html
rm -rf /var/lib/cni/flannel/* && rm -rf /var/lib/cni/networks/cbr0/* && ip link delete cni0  
rm -rf /var/lib/cni/networks/cni0/*
kubeadm reset


## dashboard 添加 token
wget https://raw.githubusercontent.com/rootsongjc/kubernetes-handbook/master/manifests/dashboard-1.7.1/admin-role.yaml
kubectl create -f admin-role.yaml
kubectl -n kube-system describe $(kubectl -n kube-system get secret -n kube-system -o name | grep admin-token) | grep token

reids 集群
> https://github.com/sanderploegsma/redis-cluster
## 问题

*   Warning  FailedScheduling  83s (x2 over 83s)  default-scheduler  pod has unbound immediate PersistentVolumeClaims (repeated 2 times)
  
*   Normal     FailedBinding  12s (x5 over 42s)  persistentvolume-controller  no persistent volumes available for this claim and no storage class is set
*   
https://kubernetes.io/docs/concepts/storage/dynamic-provisioning/

新建一个 
https://kubernetes.io/examples/pods/storage/pv-claim.yaml
https://kubernetes.io/examples/pods/storage/pv-volume.yaml

* 全部启动后
set key 出现这个  (error) CLUSTERDOWN Hash slot not served

么有加入集群，初始化好

*** Redis Cluster requires at least 3 master nodes.
*** This is not possible with 4 nodes and 1 replicas per node.
*** At least 6 nodes are required.

至少3个节点起步

redis-cli -h 10.244.0.169 -p 6379 cluster nodes
redis-cli -h 10.244.1.133 -p 6379 cluster meet 10.244.0.178 6379

10.244.1.118:6379 10.244.0.172:6379 10.244.1.119:6379 10.244.0.173:6379 10.244.1.120:6379 10.244.0.174:6379

[ERR] Node 10.244.1.133:6379 is not empty. Either the node already knows other nodes (check with CLUSTER NODES) or contains some key in database 0.

## DNS
* Kube-DNS CoreDNS

## 运行 busybox
docker run  -dti  --name busyboxtest  docker.io/busybox  /bin/sh 

## 问题
/usr/lib/systemd/system
-bash-4.2# sudo systemctl restart rsyslog
Failed to restart rsyslog.service: 连接超时
See system logs and 'systemctl status rsyslog.service' for details.

感谢下面的连接；

https://serverfault.com/questions/712928/systemctl-commands-timeout-when-ran-as-root
systemctl --force --force reboot 执行这个命令可以


## 应用平滑升级
kubectl -n k8s-ecoysystem-apps set image deployments/pay-member pay-member=/justmine/helloworldapi:v2.3

## mac start k8s
https://matthewpalmer.net/kubernetes-app-developer/articles/guide-install-kubernetes-mac.html


ssh -gqTfnN -D 8080 root@47.75.175.157 -p 10021