#!/bin/bash

wget https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
rpm -Uvh ./mysql80-community-release-el7-1.noarch.rpm

yum-config-manager --disable mysql80-community
yum-config-manager --enable mysql57-community

yum install mysql-community-server

systemctl enable mysqld
systemctl start mysqld

rm -rf ./mysql80-community-release-el7-1.noarch.rpm
