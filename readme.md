1. 初始化系统
	
	```
	yum -y update
	yum -y install yum-utils mysql vim wget zip unzip gcc autoconf  git \
	openssl-devel curl-devel \
	libxml2-devel libpng-devel freetype-devel libjpeg-devel
	```

2. 安装 nginx

	a. 添加以下 repo 内容
	
	```
	[nginx]
	name=nginx repo
	baseurl=http://nginx.org/packages/centos/7/$basearch/
	gpgcheck=0
	enabled=1
	```
	到 /etc/yum.repos.d/nginx.repo，执行 `yum -y install nginx`
	
	b. 禁用 selinux
	
	```
	setenfore permissive
	sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
	```
	
	c. 临时关闭防火墙
	
	```
	systemctl stop firewalld
	```
	
	d. 启动 nginx
	
	```
	systemctl enable nginx
	systemctl start nginx
	```
	
	e. 测试
	
	`curl -I localhost` 看到类似输出
	
	```
	HTTP/1.1 200 OK
	Server: nginx/1.14.0
	Date: Mon, 15 Oct 2018 09:51:06 GMT
	Content-Type: text/html
	Content-Length: 612
	Last-Modified: Tue, 17 Apr 2018 15:48:00 GMT
	Connection: keep-alive
	ETag: "5ad61730-264"
	Accept-Ranges: bytes
	```
	nginx 安装完毕
	
3. 安装 php
	
	a. 编译配置
	
	```
	./configure --prefix=/usr/local/php-7.2.11 \
	--with-config-file-path=/usr/local/php/etc \
	--enable-fpm \
	--enable-opcache \
	--enable-mysqlnd \
	--enable-bcmath \
	--enable-mbregex \
	--enable-mbstring \
	--enable-zip \
	--enable-inline-optimization \
	--enable-pcntl \
	--enable-xml \
	--with-mhash \
	--with-pdo-mysql=mysqlnd \
	--with-iconv-dir \
	--with-curl \
	--with-openssl \
	--with-zlib \
	--with-pear \
	--with-gd \
	--with-jpeg-dir \
	--with-png-dir \
	--with-freetype-dir \
	--with-gettext \
	--disable-cgi 
	```
	
	b. 编译安装
	
	```
	make && make install
	```
	
	c. 杂项处理
	
	```
	ln -sf /usr/local/php-7.2.11/ /usr/local/php
	ln -sf /usr/local/php/bin/* /usr/bin
	ln -sf /usr/local/php/sbin/php-fpm  /usr/sbin
	cp /usr/local/src/php-7.2.11/php.ini-production /usr/local/php/etc/php.ini
	cp /usr/local/src/php-7.2.11/sapi/fpm/php-fpm.service /usr/lib/systemd/system/php-fpm.service
	cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
	cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
	systemctl daemon-reload
	systemctl enable php-fpm
	systemctl start php-fpm
	pecl install igbinary redis
	echo -e "extension=igbinary.so\nextension=redis.so" >> /usr/local/php/etc/php.ini
	```
	
4. 安装 redis
	
	```
	yum -y install epel-release
	yum -y install redis
	systemctl enable redis
	systemctl start redis
	```

5. 安装 mysql

	```
	wget https://dev.mysql.com/get/mysql80-community-release-el7-1.noarch.rpm
	rpm -Uvh ./mysql80-community-release-el7-1.noarch.rpm
	yum-config-manager --disable mysql80-community
	yum-config-manager --enable mysql57-community
	yum install mysql-community-server
	systemctl enable mysqld
	systemctl start mysqld
  	```
  	参考：[mysql docs](https://dev.mysql.com/doc/mysql-yum-repo-quick-guide/en/#repo-qg-yum-installing)
  	
6. 防火墙
 
 	```
 	firewall-cmd --permanent --zone=public --add-port=22222/tcp
	firewall-cmd --permanent --zone=public --add-port=80/tcp
	firewall-cmd --permanent --zone=public --add-port=443/tcp
	firewall-cmd --reload
	firewall-cmd --zone=public --list-ports
 	```