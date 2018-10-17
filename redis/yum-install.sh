#!/bin/bash

yum -y install epel-release
yum -y install redis
systemctl enable redis
systemctl start redis
