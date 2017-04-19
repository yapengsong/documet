 如果各位看官熟悉 Git 和 GitHub ，可与 Docker 做个类比，可更加容易理解 Docker 和 Docker Hub 及两者关系。
 
### 帮助命令

```
docker --help //针对docker命令帮助

#Run 'docker COMMAND --help' for more information on a command.

docker search --help //针对docker search命令帮助


#Run 'docker volume COMMAND --help' for more information on a command

docker volume inspect --help //针对docker volume inspect命令帮助

```

### 显示 Docker 版本信息。
```
docker version
```
### 显示 Docker 系统信息，包括镜像和容器数。
```
docker info
```
### 从 Docker Hub 中搜索符合条件的镜像。

```
docker search
docker search [options "o">] term
docker search -s  django
```
--automated 只列出 automated build
类型的镜像；

--no-trunc 可显示完整的镜像描述；

-s 40 列出收藏数不小于40的镜像。


### 从 Docker Hub 中拉取或者更新指定镜像。
```
docker pull
docker pull [-a "o">] [user/ "o">]name[:tag "o">]
docker pull laozhu/telescope:latest
```
-a 拉取所有 tagged 镜像 。
```
### docker login
root@moon:~# docker login
Username: username
Password: ****
Email: user@domain.com
Login Succeeded
```

按步骤输入在 Docker Hub 注册的用户名、密码和邮箱即可完成登录。
### docker logout

运行后从指定服务器登出，默认为官方服务器。
### docker images

```
docker images [options "o">] [name]
```
列出本地所有镜像。其中 [name] 对镜像名称进行关键词查询。

-a 列出所有镜像（含过程镜像）；

-f 过滤镜像，如： -f ['dangling=true'] 只列出满足
dangling=true 条件的镜像；

--no-trunc 可显示完整的镜像ID；

-q 仅列出镜像ID。

--tree 以树状结构列出镜像的所有提交历史。

### docker ps

列出所有运行中容器。

-a 列出所有容器（含沉睡镜像）；

--before="nginx" 列出在某一容器之前创建的容器，接受容器名称和ID作为参数；

--since="nginx" 列出在某一容器之后创建的容器，接受容器名称和ID作为参数；

-f [exited=<int>] 列出满足
exited=<int> 条件的容器；

-l 仅列出最新创建的一个容器；

--no-trunc 显示完整的容器ID；

-n=4 列出最近创建的4个容器；

-q 仅列出容器ID；

-s 显示容器大小。

### docker rmi

```
docker rmi [options "o">] <image>  "o">[image...]
docker rmi nginx:latest postgres:latest python:latest
```
从本地移除一个或多个指定的镜像。

-f 强行移除该镜像，即使其正被使用；

--no-prune 不移除该镜像的过程镜像，默认移除。

### docker rm

```
docker rm [options "o">] <container>  "o">[container...]
docker rm nginx-01 nginx-02 db-01 db-02
sudo docker rm -l /webapp/redis
```
-f 强行移除该容器，即使其正在运行；

-l 移除容器间的网络连接，而非容器本身；

-v 移除与容器关联的空间。

### docker history

```
docker history  "o">[options] <image>
```
查看指定镜像的创建历史。

--no-trunc 显示完整的提交记录；

-q 仅列出提交记录ID。

### docker start|stop|restart

```
docker start|stop "p">|restart [options "o">] <container>  "o">[container...]
```
启动、停止和重启一个或多个指定容器。

-a 待完成

-i 启动一个容器并进入交互模式；

-t 10 停止或者重启容器的超时时间（秒），超时后系统将杀死进程。

### docker kill

```
docker kill  "o">[options "o">] <container>  "o">[container...]
```
杀死一个或多个指定容器进程。

-s "KILL" 自定义发送至容器的信号。

### docker events

```
docker events [options "o">]
docker events --since= "s2">"20141020"
docker events --until= "s2">"20120310"
```
从服务器拉取个人动态，可选择时间区间。
### docker save

```
docker save -i "debian.tar"
docker save > "debian.tar"
```
将指定镜像保存成 tar 归档文件， docker load 的逆操作。保存后再加载（saved-loaded）的镜像不会丢失提交历史和层，可以回滚。

-o "debian.tar" 指定保存的镜像归档。
### docker load

```
docker load [options]
docker load < debian.tar
docker load -i "debian.tar"
```
从 tar 镜像归档中载入镜像， docker save 的逆操作。保存后再加载（saved-loaded）的镜像不会丢失提交历史和层，可以回滚。

-i "debian.tar" 指定载入的镜像归档。

### docker export

```
docker export <container>
docker export nginx-01 > export.tar
```
将指定的容器保存成 tar 归档文件， docker import 的逆操作。导出后导入（exported-imported)）的容器会丢失所有的提交历史，无法回滚。
### docker import

```
docker import url|-  "o">[repository[:tag "o">]]
cat export.tar  "p">| docker import - imported-nginx:latest
docker import http://example.com/export.tar
```
从归档文件（支持远程文件）创建一个镜像， export 的逆操作，可为导入镜像打上标签。导出后导入（exported-imported)）的容器会丢失所有的提交历史，无法回滚。
### docker top

```
docker top <running_container>  "o">[ps options]
```
查看一个正在运行容器进程，支持 ps 命令参数。
### docker inspect

```
docker instpect nginx:latest
docker inspect nginx-container
```
检查镜像或者容器的详细参数，默认返回 JSON 格式。

-f 指定返回值的模板文件。

```
docker pause
```
暂停某一容器的所有进程。

### docker unpause

```
docker unpause <container>
```
恢复某一容器的所有进程。
### docker tag

```
docker tag [options "o">] <image>[:tag "o">] [repository/ "o">][username/]name "o">[:tag]
```
标记本地镜像，将其归入某一仓库。

-f 覆盖已有标记。

### docker push

```
docker push name[:tag "o">]
docker push laozhu/nginx:latest
```
将镜像推送至远程仓库，默认为 Docker Hub 。
### docker logs

```
docker logs [options "o">] <container>
docker logs -f -t --tail= "s2">"10" insane_babbage
```
获取容器运行时的输出日志。

-f 跟踪容器日志的最近更新；

-t 显示容器日志的时间戳；

--tail="10" 仅列出最新10条容器日志。

### docker run

```
docker run [options "o">] <image> [ "nb">command]  "o">[arg...]
```
启动一个容器，在其中运行指定命令。

-a stdin 指定标准输入输出内容类型，可选 STDIN/
STDOUT / STDERR 三项；

-d 后台运行容器，并返回容器ID；

-i 以交互模式运行容器，通常与 -t 同时使用；

-t 为容器重新分配一个伪输入终端，通常与 -i 同时使用；

--name="nginx-lb" 为容器指定一个名称；

--dns 8.8.8.8 指定容器使用的DNS服务器，默认和宿主一致；

--dns-search example.com 指定容器DNS搜索域名，默认和宿主一致；

-h "mars" 指定容器的hostname；

-e username="ritchie" 设置环境变量；

--env-file=[] 从指定文件读入环境变量；

--cpuset="0-2" or --cpuset="0,1,2"
绑定容器到指定CPU运行；

-c 待完成

-m 待完成

--net="bridge" 指定容器的网络连接类型，支持 bridge /
host / none
container:<name|id> 四种类型；

--link=[] 待完成

--expose=[] 待完成 