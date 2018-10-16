#!/bin/bash

# add nginx repo
cat > /etc/yum.repos.d/nginx.repo << EOF
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/\$basearch/
gpgcheck=0
enabled=1
EOF

# yum install
yum -y install nginx

# forbid selinux
setenfore permissive
sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config

# temporary close firewalld
systemctl stop firewalld

# start nginx
systemctl enable nginx
systemctl start nginx

# test nginx
curl -I localhost
