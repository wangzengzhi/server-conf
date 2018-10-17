# MySQL 5.7 用户管理

1. [新增](https://dev.mysql.com/doc/refman/5.7/en/create-user.html)

	```
	CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
	```
	
2. [授权](https://dev.mysql.com/doc/refman/5.7/en/grant.html)
	
	```
	GRANT ALL ON dbname.* TO 'username'@'localhost';
	```
	> 授权之后要执行 `FLUSH PRIVILEGES;`
	
3. [改密](https://dev.mysql.com/doc/refman/5.7/en/set-password.html)

	```
	SET PASSWORD FOR 'username'@'localhost' = 'password';
	```
	> [修改](https://dev.mysql.com/doc/refman/5.7/en/alter-user.html)
	> `ALTER USER USER() IDENTIFIED BY 'password';`
	
4. [撤权](https://dev.mysql.com/doc/refman/5.7/en/revoke.html)
	
	```
	REVOKE INSERT ON dbname.* FROM 'username'@'localhost';
	```
5. [改名](https://dev.mysql.com/doc/refman/5.7/en/rename-user.html)
	
	```
	RENAME USER 'username'@'localhost' TO 'username'@'127.0.0.1';
	```
	
6. [删除](https://dev.mysql.com/doc/refman/5.7/en/drop-user.html)
	
	```
	DROP USER 'username'@'localhost';
	```
	
7. [查权]()
	
	```
	SHOW GRANTS FOR 'username'@'localhost';
	```