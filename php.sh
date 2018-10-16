#!/bin/bash

# define php version
PHPVER=7.2.11
PHPTAR=php-$PHPVER.tar.gz
PHPDIR=php-$PHPVER

# to src dir
cd /usr/local/src

# download and uncompress
wget http://cn2.php.net/distributions/$PHPTAR
tar zxvf $PHPTAR

# cd php source
cd $PHPDIR

# make configure
./configure --prefix=/usr/local/$PHPDIR \
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

make && make install

# symbolik
ln -sf /usr/local/$PHPDIR/ /usr/local/php
ln -sf /usr/local/php/bin/* /usr/bin
ln -sf /usr/local/php/sbin/php-fpm  /usr/sbin
cp /usr/local/src/$PHPDIR/php.ini-production /usr/local/php/etc/php.ini
cp /usr/local/src/$PHPDIR/sapi/fpm/php-fpm.service /usr/lib/systemd/system/php-fpm.service
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf
systemctl daemon-reload
systemctl enable php-fpm
systemctl start php-fpm

# install redis ext
pecl install igbinary redis
echo -e "extension=igbinary.so\nextension=redis.so" >> /usr/local/php/etc/php.ini

# return to home

cd
