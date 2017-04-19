Docker与MySql

根据上一篇blog的经验，来创建一个mysql的容器：

```
# docker pull mysql
# docker create --name dev_mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql
```

// 这第二个command多了一个指定环境变量的，-e，设定root帐号的初始密码

```
# docker start dev_mysql
```
不出意外，现在已经可以通过mysql客户端，比如workbench来登录了。

Docker的数据卷

在测试阶段，我的项目，每一天，甚至每一次小的修改，都会有新的war包要部署，而我又不想每次都打包一个镜像，这样我就要将webapps的目录，也就是/usr/local/tomcat/webapps暴露出来，方便在host中，随时更新里面的war包。

```
# docker create --name dev_mila_tomcat -v /root/test/webapps:/usr/local/tomcat/webapps tomcat
```

上面的命令，可以将镜像中的/usr/local/tomcat/webapps目录映射到host的/root/webapps/test目录下，这样，我每次只需要将war包放到/root/webapps/test中，docker中的tomcat就能自动检测到了！

运行环境的统一，有了这么一个docker image，我可以拿到任意一部服务器上跑。由于容器的封装，保证了运行环境的统一！

既然可以暴露webapps目录了，那不仿再多暴露几个，现在我的test项目会保留一些图片和音乐文件，所以我想把这两个目录暴露出来，以便在host上面，可以方便的做备份

```
# docker create --name dev_mila_tomcat \ 
    -v /root/test/webapps:/usr/local/tomcat/webapps \
    -v /root/test/data/image:/testdata/image \
    -v /root/test/data/audio:/testdata/audio \
    tomcat
```

好了，这样我可以在host上面，直接跑一个tar打包备份文件咯！