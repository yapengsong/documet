### 从容器内拷贝文件到主机上（CP）
cp命令具体帮助查看：docker cp --help

```
docker cp <containerId>:/file/path/within/container /host/path/target

#案例如下
docker ps //查询一下容器的id
docker cp 5c6c2b9b2a15:/var/lib/mysql/xgltest ./    
//5c6c2b9b2a15是容器ID，意思是将容器中/var/lib/mysql/xgltest文件或文件夹拷贝到当前目录下

docker cp 2f8d9134949e:/usr/local/tomcat/webapps ./   //同上含义
```
### 从主机上拷贝文件到容器内（CP）

```
docker ps //查询一下容器的id
docker cp ./webapps_xgl 5c6c2b9b2a15:/var/lib/mysql/  //将当前目录的webaaps_xgl文件夹拷贝到容器5c6c2b9b2a15中的/var/lib/mysql/目录下

#进入容器查看效果
[root@b-70 mvdb]# docker exec -it xgl-mysql /bin/bash
root@5c6c2b9b2a15:/# cd /var/lib/mysql/               
root@5c6c2b9b2a15:/var/lib/mysql# ls
5c6c2b9b2a15.pid  ib_logfile0  ib_logfile1  ibdata1  mysql  performance_schema  webapps_xgl  xgltest

#进入容器查看效果
docker cp webapps_xgl 4b7fc96dfcbc:/usr/local/tomcat 
[root@b-70 mvdb]# docker exec -it xgl-tomcat /bin/bash
root@4b7fc96dfcbc:/usr/local/tomcat# ls               
LICENSE  NOTICE  RELEASE-NOTES  RUNNING.txt  bin  conf  include  lib  logs  native-jni-lib  temp  webapps  webapps_xgl  work
```


### 从主机上挂载文件夹到容器内

#### 用-v挂载主机数据卷到容器内

1、案例一：映射tomcat下conf文件夹，便于修订配置文件

创建tomcat7.0容器如下：
```
docker create --name xgl_tomcat -p 8889:8080 -v /mvdb/conf:/usr/local/tomcat/conf tomcat:7.0
```
主机目录/mvdb/conf映射到容器/usr/local/tomcat/conf，进入容器查看conf目录是空（注意映射的目录只要主机对应目录是空的，那么创建的容器中对应的目录也是空的），这时候tomcat启动报错，因为conf下是空的。只要将tomcat7.0的conf下正规的内容拷贝到主机/mvdb/conf下即可。

```
cd /mvdb
mkdir conf
docker ps
docker start xgl_tomcat //启动容器，结果失败。因为没有conf下的文件
docker ps
docker logs xgl_tomcat //查看容器日志
scp root@192.168.1.28:/mnt1/apache-tomcat-7.0.53/conf.tar ./  
//从远程机器tomcat下拷贝正规的conf文件到/mvdb/conf（此时容器内对应的目录也有了该文件夹）
docker exec xgl_tomcat -it /bin/bash //进入容器内部
tar -xvf conf.tar  //解压和覆盖
exit

docker start xgl_tomcat //启动成功
... ... 
```

2、案例二：映射tomcat下webapps文件夹，便于发布应用

创建tomcat7.0容器如下：

```
cd /mvdb
mkdir webapps
docker create --name xgl_tomcat -p 8888:8080 -v /mvdb/webapps:/usr/local/tomcat/webapps tomcat:7.0  
//映射主机目录/mvdb/webapps到容器内/usr/local/tomcat/webapps，此时因为主机目录是空文件夹，因此容器内tomcat下/usr/local/tomcat/webapps这个目录也是空，并没有tomcat本身该有的文件内容。
docker ps
docker start xgl_tomcat //启动容器成功
docker ps
cd webapps/
docker logs -f xgl-tomcat //查看容器日志
touch index.jsp  //在主机/mvdb/webapps下新建index.jsp（容器内对应位置也立即出现）
vi index.jsp //编辑主页
ls ROOT
cd ROOT/ 
ls -l
chmod +x index.jsp  
//将ROOT下新建的index.jsp授权可执行，这时候通过浏览器就可以访问index.jsp
... ...
```

> 说明1：通过tomcat容器创建和映射主机目录发现，只要是create和run容器时想创建的映射基本都可以。

> 说明2：对于某些映射目录由于主机目录是空的，而该容器中对应目录中的文件又是容器启动需要的，则需要在主机目录中提前放置好相关文件，确保容器可启动。

>说明3：映射之后，相关目录的文件编辑和处理完全可以在主机目录上进行（比如修订tomcat配置文件和发布应用等），省的频繁进入容器操作。

>说明4：如果同时需要映射多个目录，则在create或run容器时如下操作：

```
docker create --name xgl-tomcat4 -v /root/test/webapps:/usr/local/tomcat/webapps -v /root/test/data/image:/testdata/image -v /root/test/data/audio:/testdata/audio tomcat:7.0

docker start xgl-tomcat4
docker logs xgl-tomcat4
```

#### 直接在主机上拷贝到容器物理存储系统
查看默认安装的容器参数，找到容器数据存储目录

```
docker inspect xgl-mysql
... ...
        "HostConfig": {
            "Binds": null, //会显示主机目录与容器目录绑定情况，如果容器创建或运行时没有指定则该地方为空，反之则显示映射情况
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {
                "3306/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "3566"
                    }
                ]
            },
... ...
 "Mounts": [  //这部分显示当前容器挂载情况（包括容器默认自带挂载和创建时指定的挂载情况），如下就是mysql容器默认自带挂载情况
            {
                "Name": "772021f7cc09c7050dd6521901052e67a8c33b1bf699b8692e9aaae2e118c607",
                "Source": "/var/lib/docker/volumes/772021f7cc09c7050dd6521901052e67a8c33b1bf699b8692e9aaae2e118c607/_data",
                "Destination": "/var/lib/mysql",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ],
        
... ...
```
> 说明1：根据上面展现情况，xgl-mysql这个容器没有人工指定主机与容器的目录映射。但是该容器默认的数据目录挂载在主机/var/lib/docker/volumes/772021f7cc09c7050dd6521901052e67a8c33b1bf699b8692e9aaae2e118c607/_data下，对应容器内/var/lib/mysql目录（即mysql数据存放目录）。

>说明2：如果需要备份和存放内容到xgl-mysql容器内，则可以通过上述挂载信息进行相关操作。

>说明3：不过经过对tomcat**默认创建的容器**采用同样docker inspect xgl-tomcat查看，xgl-tomcat并没有这样默认的挂载和映射。说明并不是所有容器都有这种挂载情况。具体信息如下：

```
docker inspect xgl-tomcat2

... ...
 "HostConfig": {
            "Binds": null, //没有人工绑定映射
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
... ...
 "Mounts": [],//没有容器默认的挂载
        "Config": {
            "Hostname": "2f8d9134949e",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
... ...
```

> 说明4：对于有人工挂载的容器，则通过docker inspect xgl-tomcat就可以查询到，如下：


```
docker inspect xgl-tomcat

... ...
 "HostConfig": {
            "Binds": [
                "/mvdb/webapps:/usr/local/tomcat/webapps"
            ],
... ...
"Mounts": [
            {
                "Source": "/mvdb/webapps",
                "Destination": "/usr/local/tomcat/webapps",
                "Mode": "",
                "RW": true,
                "Propagation": "rprivate"
            }
        ],
... ...
```





