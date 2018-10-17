# MySQL 5.7 初始化配置

1. **重置密码**

	查看默认密码 `grep password /var/log/mysqld.log`
	
	```
	[root@li1888-190 ~]# grep password /var/log/mysqld.log
	2018-10-17T02:23:09.004218Z 1 [Note] A temporary password is generated for root@localhost: #!pF2BEw5jJ>
	2018-10-17T02:24:22.085926Z 2 [Note] Access denied for user 'root'@'localhost' (using password: YES)
	```
	
	默认密码为：*#!pF2BEw5jJ>*
	
	执行 `mysql -uroot -p`, 输入密码
	
	```
	[root@li1888-190 ~]# mysql -uroot -p
	Enter password:
	Welcome to the MySQL monitor.  Commands end with ; or \g.
	Your MySQL connection id is 3
	Server version: 5.7.23
	
	Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.
	
	Oracle is a registered trademark of Oracle Corporation and/or its
	affiliates. Other names may be trademarks of their respective
	owners.
	
	Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
	
	mysql>
	```
	
	设置新密码如：*fJrNHsv>78u]8Z%T* ，执行 `SET PASSWORD = PASSWORD('fJrNHsv>78u]8Z%T');`
	
	> 	mysql 5.7 密码复杂度要求高，设置简单密码要提示：
	> 	`ERROR 1819 (HY000): Your password does not satisfy the current policy requirements`，
	>	具体参考 `validate_password_policy` 相关配置。