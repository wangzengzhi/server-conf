## MySQL 5.7 TDE

安装插件

```
INSTALL PLUGIN keyring_file  SONAME 'keyring_file.so';
UNINSTALL PLUGIN keyring_file; --卸载
SHOW PLUGINS; --查看
```

创建密钥目录及文件

```
mkdir -p /usr/local/mysql/mysql-keyring/
chown -R mysql. /usr/local/mysql/mysql-keyring/
chmod 750 /usr/local/mysql/mysql-keyring/
```

在my.cnf的[mysqld]段，加这两行

```
early-plugin-load=keyring_file.so
keyring_file_data=/usr/local/mysql/mysql-keyring/keyring
```

查看配置信息

```
SHOW GLOBAL VARIABLES LIKE '%keyring_file_data%';
```

表加密

```
CREATE TABLE tbname (column_name INT) ENCRYPTION='Y';
ALTER TABLE tbname ENCRYPTION='Y';
ALTER TABLE tbname ENCRYPTION='Y';
```

查看表加密

```
SELECT * FROM information_schema.tables WHERE CREATE_OPTIONS like '%ENCRYPTION="Y"%'\G
```

[参考](http://www.mamicode.com/info-detail-2421241.html)