# confluence & jira 安装

配置数据库

/etc/my.cnf

```
default_storage_engine=INNODB 
transaction_isolation=READ-COMMITTED
max_allowed_packet = 512M
innodb_log_file_size = 2G
```

```
-- confluce
create database confluence character set utf8 collate utf8_bin;
CREATE USER 'confluence'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON confluence.* TO 'confluence'@'localhost';
FLUSH PRIVILEGES;

-- jira
create database jira character set utf8 collate utf8_bin;
GRANT ALL ON jira.* TO 'jira'@'localhost';
```

MySQL Lib

```
wget https://cdn.mysql.com//Downloads/Connector-J/mysql-connector-java-5.1.47.tar.gz
tar xf mysql-connector-java-5.1.47.tar.gz
cp mysql-connector-java-5.1.47/*.jar /opt/atlassian/confluence/confluence/WEB-INF/lib/
```

confluence 破解

```
cp /opt/atlassian/confluence/confluence/WEB-INF/lib/atlassian-extras-decoder-v2-3.4.1.jar atlassian-extras-2.4.jar
```
下载 atlassian-extras-2.4.jar 到本地


修改权限

```
chown -R confluence.confluence /opt/atlassian/confluence/ /var/atlassian/application-data/confluence/
chmod -R u=rwx,go-rwx /opt/atlassian/confluence/ /var/atlassian/application-data/confluence/
```