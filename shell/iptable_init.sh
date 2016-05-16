#!/bin/bash
#iptables configure
#查看规则
#export PATH=/etc/rc.d/init.d:$PATH
iptables -L -n

#清除自己设置的规则
#iptables -X

#清除所有规则
iptables -F

#设定预设规则
iptables -P INPUT DROP
#iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
#iptables -P OUTPUT DROP
iptables -P FORWARD DROP
#iptables -P FORWARD ACCEPT

#开启常用端口
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -i lo -p all -j ACCEPT
iptables -A INPUT -s 10.174.110.159 -p tcp -j ACCEPT
iptables -A INPUT -s 10.174.108.45 -p tcp -j ACCEPT
iptables -A INPUT -s 10.24.27.47 -p tcp -j ACCEPT
iptables -A INPUT -s 10.24.26.251 -p tcp -j ACCEPT
iptables -A INPUT -s 10.24.36.133 -p tcp -j ACCEPT
iptables -A INPUT -s 10.24.33.195 -p tcp -j ACCEPT
iptables -A INPUT -s 10.47.96.84 -p tcp -j ACCEPT
iptables -A INPUT -s 10.174.107.140 -p tcp -j ACCEPT
#iptables -A INPUT -s 10.174.107.140 -p tcp --dport 3306 -j ACCEPT
iptables -A INPUT -s 223.95.73.202 -p tcp -j ACCEPT
