#!/bin/bash

yum -y update
yum -y install yum-utils mariadb vim wget zip unzip gcc autoconf  git \
openssl-devel curl-devel \
libxml2-devel libpng-devel freetype-devel libjpeg-devel
