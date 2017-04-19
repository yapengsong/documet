
- [x] 环境要求：CentOS7或内核3.1以上
- [x] 学习地址：https://docs.docker.com/
- [x] 本文环境：CentOS 7.1
- [x] 参考文档：https://docs.docker.com/engine/installation/linux/centos/

### 安装Docker引擎
查看内核版本
```
[root@b-70 ~]# uname -r
3.10.0-327.22.2.el7.x86_64
```
更新yum
```
yum update
```
编写yum源
```
cd /etc/yum.repos.d/
ls
tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF
```
安装Docker引擎
```
yum install docker-engine
systemctl start docker
systemctl status docker

#自动启动
systemctl enable docker.service
```
### 测试hello-world
```
docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker Hub account:
 https://hub.docker.com

For more examples and ideas, visit:
 https://docs.docker.com/engine/userguide/
```
### 创建Docker组和用户

The docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is owned by the user root and other users can access it with sudo. For this reason, docker daemon always runs as the root user.

To avoid having to use sudo when you use the docker command, create a Unix group called docker and add users to it. When the docker daemon starts, it makes the ownership of the Unix socket read/writable by the docker group.

    Warning: The docker group is equivalent to the root user; For details on how this impacts security in your system, see Docker Daemon Attack Surface for details.

To create the docker group and add your user:

Log into Centos as a user with sudo privileges.

Create the docker group.
 
```
sudo groupadd docker
```
Add your user to docker group.

```
sudo usermod -aG docker your_username
```
Log out and log back in.
This ensures your user is running with the correct permissions.
Verify your work by running docker without sudo.
```
$ docker run hello-world
```
### Docker卸载

ou can uninstall the Docker software with yum.
List the package you have installed.
```
$ yum list installed | grep docker
    yum list installed | grep docker
    docker-engine.x86_64   1.7.1-1.el7 @/docker-engine-1.7.1-1.el7.x86_64.rpm
```
Remove the package.

```
$ sudo yum -y remove docker-engine.x86_64
```
This command does not remove images, containers, volumes, or user-created configuration files on your host.
To delete all images, containers, and volumes, run the following command:

```
$ rm -rf /var/lib/docker
```
Locate and delete any user-created configuration files.










