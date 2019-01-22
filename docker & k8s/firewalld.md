http://raman-kumar.blogspot.com/2018/05/failed-to-start-firewalldservice-unit.html
https://blog.csdn.net/chengyuqiang/article/details/79238136
systemctl status firewalld
Failed to start firewalld.service: Unit is masked
fix
systemctl unmask firewalld
systemctl start firewalld
firewall-cmd --zone=public --add-port=30001/tcp --permanent
systemctl restart firewalld  ##记得 修改端口后要重启
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=31003/tcp --permanent
firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --zone=public --add-port=6379/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --list-ports
 80/tcp 443/tcp 22/tcp 31003/tcp 3306/tcp 6379/tcp

firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='172.16.0.0/24' reject"
firewall-cmd --permanent --add-rich-rule="rule family='ipv4' source address='10.244.0.0/16' accept"

目录：
/etc/firewalld/zones
vim public.xml