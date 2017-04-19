Docker提供了多个容器直接访问的方法，最简单的方式是直接使用端口映射-p参数指定映射的端口或者-P映射所有端口，多个容器直接通过网络端口进行访问。

但网络端口映射方式并不是Docker中连接多个容器的唯一方式，更安全的方法是可以使用Docker的连接系统(--link)连接多个容器，当容器连接到一起时，接受者容器就可以看到源容器的信息。

> 以Tomcat + Mysql为例，建立容器之间的连接 

在容器直接建立连接要使用--link选项


```
--link <name or id>:alias //前者是源容器（即被连接的）名称或id，后者是连接别名
```
### 新建MySQL容器
要建立容器连接的话，就要依赖容器的名字了，使用--name指定源容器的名字为xgl-mysql

```
docker run --name xgl-mysql -p 3566:3306 -e MYSQL_ROOT_PASSWORD=rootroot -d mysql:5.5
```

### 创建Tomcat容器，并且连接到MySQL容器

```
docker run --name xgl-tomcat -p 8888:8080 -v /mvdb/webapps/:/usr/local/tomcat/webapps --link xgl-mysql:mysql tomcat:7.0
```

这里通过--link选项指定了要连接的容器是xgl-mysql，连接别名是mysql。

### 容器信息互通

建立两个容器之间的连接之后，在接收容器（Recipient）中必然会需要访问源容器（Source）的资源，我们在为容器建立连接时，源容器在创建时并没有使用-p/-P指定要暴露出来的端口，因此如何访问源容器的信息呢？

为了可以让接收容器能够访问源容器的信息，Docker提供了两种方式：

1. 环境变量
1. /etc/hosts文件

**环境变量**

Docker在连接容器的时候，会根据--link提供的参数自动的在接收者容器中创建一些环境变量，包括源容器的Dockerfile中使用ENV命令设置的环境变量和源容器启动时(docker run)，使用-e或者--env， --env-file参数指定的环境变量。

主要包含以下环境变量，这里假设alias=mysql。

```
<alias>_PORT
<alias>_PORT_<port>_<protocol>
<alias>_PORT_<port>_<protocol>_ADDR
<alias>_PORT_<port>_<protocol>_PORT
<alias>_PORT_<port>_<protocol>_PROTO
<alias>_NAME
```

例如:

```
#docker run -i -t --rm --link mysql:mysql ubuntu:14.04 env
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=9c74aa611463
TERM=xterm
MYSQL_PORT=tcp://172.17.0.3:3306
MYSQL_PORT_3306_TCP=tcp://172.17.0.3:3306
MYSQL_PORT_3306_TCP_ADDR=172.17.0.3
MYSQL_PORT_3306_TCP_PORT=3306
MYSQL_PORT_3306_TCP_PROTO=tcp
MYSQL_NAME=/desperate_ritchie/mysql
HOME=/root
```
上述例子中，指定了容器的别名为msyql，因此所有环境变量都是以MYSQL_开头。

> 注意：如果源容器重启，接收容器中的环境变量信息并不会自动更新，因此，如果要使用源容器的IP地址，请使用/etc/hosts中配置的主机信息。

**/etc/hosts文件**

除了环境变量之外，Docker也在接收容器的/etc/hosts文件中更新了hosts信息。

进入上述创建的xgl-tomcat容器查看hosts信息如下：

```
# docker exec -it xgl-tomcat /bin/bash

root@2363a9efe228:/usr/local/tomcat# cat /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.17.0.2      mysql 5c6c2b9b2a15 xgl-mysql
172.17.0.3      2363a9efe228
```

从上可以看出，在接收容器的hosts文件中增加了两条额外的信息，本机IP和别名以及源容器的IP、容器名称（xgl-mysql）和别名(mysql)。与环境变量不同的是，如果源容器重启了，接收容器中/etc/hosts中的信息会自动更新。