#!/bin/bash
#install mysql
#download
wget http://repo.mysql.com//mysql57-community-release-el6-7.noarch.rpm
#install from local
sudo yum localinstall mysql57-community-release-el6-7.noarch.rpm
#configure
sudo yum-config-manager --disable mysql57-community
sudo yum-config-manager --enable mysql56-community
#install
sudo yum install mysql-community-server

#start mysql
sudo service mysqld start