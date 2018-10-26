# Lets Encrypt 使用

### 基于 docker 执行

```
docker run --rm -p 80:80 -v /etc/letsencrypt:/etc/letsencrypt certbot/certbot \
auth --standalone -m 'your email' --agree-tos -d 'your domain'
```
> 例如

```
docker run --rm -p 80:80 -v /etc/letsencrypt:/etc/letsencrypt certbot/certbot \
auth --standalone -m wzz@szprism.com --agree-tos -d wiki.szprism.com
```

### 生成密钥交换 dhparam.pem，参考 [openssl dhparam](https://cn.aliyun.com/jiaocheng/128920.html)

```
openssl dhparam -out /etc/letsencrypt/dhparam.pem 2048
```

#### ansile

```
yum install -y ansible
```


#### sonarqube

```
docker run -d --name sonarqube \
    -p 9000:9000 -p 9092:9092 \
    -e SONARQUBE_JDBC_USERNAME=sonar \
    -e SONARQUBE_JDBC_PASSWORD=sonar \
    -e SONARQUBE_JDBC_URL=jdbc:postgresql://localhost/sonar \
    --restart always \
    -v /data/sonarqube/conf:/opt/sonarqube/conf \
    -v /data/sonarqube/data:/opt/sonarqube/data \
    -v /data/sonarqube/extensions:/opt/sonarqube/extensions \
    -v /data/sonarqube/lib/bundled-plugins:/opt/sonarqube/lib/bundled-plugins \
    sonarqube:alpine
```


ohmyzsh 

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  autojump
  composer
  docker
  gradle
  git
  git-flow
  git-prompt
  git-remote-branch
  git-flow-completion
  go
  golang
  kubectl
  man
  npm
  pass
  repo
  rsync
  sudo
  systemd
  yum
  
  
  yum install -y gitflow zsh autojump autojump-zsh
  
/etc/environment                                                                                                                                                                                                                                      
LC_CTYPE="zh_CN.UTF-8"
LC_ALL="zh_CN.UTF-8"
LANG="zh_CN.UTF-8"
  
  