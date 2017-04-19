公司要把j2ee的project搬到 docker里，所以，先从一个tomcat的镜像开始吧！

```
# docker pull tomcat
```

因为是在阿里云的ecs上，使用了阿里云的docker库，因此下载速度飞快！

查看本地已下载的镜像：

```
# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
ubuntu              latest              8251da35e7a7        12 days ago         188.4 MB
tomcat              latest              71093fb71661        5 weeks ago         347.7 MB
busybox             latest              8c2e06607696        4 months ago        2.433 MB
```

基于这个image，创建一个容器吧：

```
# docker create --name dev_tomcat -p 8080:8080 tomcat
// --name 给这个容器起一个名字
// -p host到container的端口映射
```

打一个比方说，一个image就相当于一个系统光盘，容器，就是一部安装了这个系统电脑。启动：

```
# docker start dev_tomcat
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                    NAMES
94e167c8b2b8        tomcat:latest       "catalina.sh run"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp   dev_tomcat
```


通过docker ps命令，可以看到现在这个容器的运行情况。不过既然这是启动一个tomcat的容器，如何能看到tomcat的启动情况呢：

```
# docker logs dev_tomcat
```

// 熟悉的tomcat启动信息又出来了，如果你没看到，那个，赏一丈红吧。


看到这些log，
1. 可以确定tomcat启动成功
2. Tomcat自带应用已经部署成功：manager, doc, examples, root, host-manager.
3. tomcat目录/usr/local/tomcat
4. webapp目录/usr/local/tomcat/webapps
来访问一下：http://ipaddress:8080，正常情况下，应该可能看到熟悉的tomcat的经典界面了。

上面提到，container相当于一个安装了image这个系统的电脑，那没理由不可以进去看看的吧！那就进去吧：

```
# docker exec -t -i dev_tomcat /bin/bash
```
// docker exec意思是：在dev_tomcat下面运行一个命令，在这里，运行的是/bin/bash
// -t 表示分配一个pseudo-TTY，-i 表示可交互
// 运行之后，提示符就变成了，tomcat这个image的默认工作目录是/usr/local/tomcat，自动打开：
root@94e167c8b2b8:/usr/local/tomcat#
root@94e167c8b2b8:/usr/local/tomcat# cd webapps/
// 进入webapps里面，看看是不是几个默认的应用都在里面
root@94e167c8b2b8:/usr/local/tomcat/webapps# ls
ROOT  docs  examples  host-manager  manager