## MailServer

#### 组成部分:

技术栈
* vagrant
* docker-compose
* kubernetes

项目
* docker-mailserver
* mailu

## [Vagrant](http://rmingwang.com/vagrant-commands-and-config.html)

```sh
# Mac下载
$ brew cask install vagrant

# 查看版本
$ vagrant -v

# 加入box
$ vagrant box add ubuntu/xenial64

# 初始化（指定上述的box）
$ vagrant init ubuntu/xenial64

# 启动虚拟机
$ vagrant up

# ssh到虚拟机
$ vagrant ssh

# 重启虚拟机（重新载入配置文件）
$ vagrant relaod
```

## 部署测试（vagrant）

```sh
# 进入虚拟机
$ vagrant ssh


# 下载安装docker/docker-compose
[How To Install and Use Docker on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04)

[How To Install Docker Compose on Ubuntu 16.04](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-16-04)

# vagrant内部上述安装完后克隆本项目(http,非ssh，需输入gitlab账号密码)
$ git clone http://gitlab.muker.io/wells/kube-mailserver.git

# 进入目录
$ cd ~/kube-mailserver

# 配置初始账号
$ cp tmp/config/postfix-accounts.cf.example tmp/config/postfix-accounts.cf

# 启动项目
$ docker-compose up -d

# 查看Log
$ docker-compose logs -f mail

# 稍等片刻直到出现：
mail    | Sep 19 00:33:53 mail postfix/master[968]: daemon started -- version 3.1.8, configuration /etc/postfix

# 添加邮箱用户列表
$ ./setup.sh email add user2@mailserver.com mailserver.com

# 查看邮箱用户列表
$ ./setup.sh email list

#=== 以上操作都在vagrnt虚拟机上 ===#

# 本机电脑（非vagrant虚拟机）编辑/etc/hosts (192.168.50.98 为vagrant的ip，可以进入vagrant虚拟机自行查看, 视网络IP而定，非固定，请自行替换)
192.168.50.98 mailserver.com mail.mailserver.com

# 执行Ruby脚本测试
$ ruby mail_send_smtp.rb
$ ruby mail_get_imap.rb
```
