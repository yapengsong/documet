## 1.升级说明

本次升级针对的服务为ecsc,ecmc,schdule和schedule-res服务。

替换jar文件原因为处理两个问题：

* #9427：ecmc客户管理列表中的账户余额第三位进行四舍五入了
* log.money.success 与 log.money.failed 增加timestamp

## 2.升级步骤

### 2.1 ecsc服务

登录`ecsc-1（25.0.3.17）`，上传`ecsc.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -9 <PID>
```

将`/home/ecsc`备份：

```
cp -R /home/ecsc /home/ecsc_20170220
```

在`/home`目录下解压`ecsc.tar`：

```
cd /home
tar xvf ecsc.tar
```

启动服务，查看日志：

```
/home/apache-tomcat-7.0.67/bin/startup.sh
tail -f /home/apache-tomcat-7.0.67/logs/catalina.out 
tail -f /home/ecsclog/ecsc.log 
```

服务正常启动之后，可以登录`ecsc-2（25.0.3.39）`，然后重复以上步骤。

### 2.2 ecmc服务

登录`ecmc-1（25.0.3.27）`，上传`ecmc.tar`文件到`/home`目录下，查看并杀死服务进程：

```
# ps -ef | grep java
# kill -9 <PID>
```

将`/home/ecmc`备份：

```
# cp -R /home/ecmc /home/ecmc_20170220
```

在`/home`目录下解压`ecmc.tar`：

```
# cd /home
# tar xvf ecmc.tar
```

启动服务，查看日志：

```
/home/apache-tomcat-7.0.67/bin/startup.sh
tail -f /home/apache-tomcat-7.0.67/logs/catalina.out 
tail -f /home/ecmclog/ecmc.log 
```

服务正常启动之后，可以登录`ecmc-2（25.0.3.40）`，然后重复以上步骤。

### 2.3 schedule服务

登录`schedule-1（25.0.3.26）`，上传`schedule.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -15 <PID>
```

将`/home/schedule`备份：

```
cp -R /home/schedule /home/schedule_20170220
```

在`/home`目录下解压`schedule.tar`：

```
cd /home
tar xvf schedule.tar
```

启动服务，查看日志：

```
cd /home/schedule
nohup sh startup.sh &
tail -f /home/schedulelog/schedule.log 
```

服务正常启动之后，可以登录`schedule-2（25.0.3.38）`，然后重复以上步骤。

### 2.4 schedule-res服务

登录`schedule-res-1（25.0.3.51）`，上传`schedule-res.tar`文件到`/home`目录下，查看并杀死服务进程：

```
# ps -ef | grep java
# kill -15 <PID>
```

将`/home/schedule-res`备份：

```
cp -R /home/schedule-res /home/schedule-res_20170220
```

在`/home`目录下解压`schedule-res.tar`：
```
cd /home
tar xvf schedule-res.tar
```

启动服务，查看日志：

```
cd /home/schedule-res
nohup sh startup.sh &
tail -f /home/schedulereslog/scheduleres.log 
```

服务正常启动之后，可以登录`schedule-res-2(25.0.3.61)`，然后重复上述步骤。

## 3.正确性验证

* 正常访问；
* 验证升级说明中的问题。

## 4.回退

将四个服务，八台虚拟机备份的程序目录恢复，重启四个服务即可（重启方式可以参照以上步骤）。

