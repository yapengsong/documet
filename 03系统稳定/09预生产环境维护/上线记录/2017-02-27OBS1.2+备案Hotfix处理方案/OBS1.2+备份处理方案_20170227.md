## 1.升级说明

<p>本次更新涉及服务为api, ecsc, ecmc, schedule, schedule-res, mail和sms服务，需要替换配置文件，并重启服务。</p>
<p>升级原因：</p>
* 防止通过api域名跳过session验证直接调用后台接口
* 按压力测试结果修改mysql配置

## 2.升级步骤

### 2.1 api服务

登录`api-1(25.0.3.19)`，上传`api.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -9 <PID>
```

将`api`备份：

```
cp -R /home/api /home/api_20172027
```

在`/home`目录下解压`api.tar`：

```
tar xvf api.tar
```

提取线上文件`/home/api/WEB-INF/classes/db.properties`

将其中的`jdbc`部分调整如下：

```
jdbc.pool.initialSize=30
jdbc.pool.minIdle=30
jdbc.pool.maxActive=100
```

启动服务，查看日志：

```
/home/apache-tomcat-7.0.67/bin/startup.sh
tail -f /home/apache-tomcat-7.0.67/logs/catalina.out
```

启动完毕之后，登录`api-2(25.0.3.29)`，重复以上步骤。

### 2.2 ecsc服务

登录`ecsc-1(25.0.3.17)`，上传`ecsc.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -9 <PID>
```

将`ecsc`备份：

```
cp -R /home/ecsc /home/ecsc_20170227
```

在`/home`目录下解压`ecsc.tar`:

```
tar xvf ecsc.tar
```

提取线上文件`/home/ecsc/WEB-INF/classes/db.properties`

将其中的`jdbc`部分调整如下：

```
jdbc.pool.initialSize=30
jdbc.pool.minIdle=30
jdbc.pool.maxActive=100
```

启动服务，查看日志：

```
/home/apache-tomcat-7.0.67/bin/startup.sh
tail -f /home/apache-tomcat-7.0.67/logs/catalina.out 
tail -f /home/ecsclog/ecsc.log 
```

启动完毕之后，登录`ecsc-2（25.0.3.39）`，重复以上步骤。

### 2.3 ecmc服务

登录`ecmc-1(25.0.3.27)`，上传`ecmc.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -9 <PID>
```

将`ecmc`备份：

```
cp -R /home/ecmc /home/ecmc_20170227
```

在`/home`目录下解压`ecmc.tar`:

```
tar xvf ecmc.tar
```

提取线上文件`/home/ecmc/WEB-INF/classes/db.properties`

将其中的`jdbc`部分调整如下：

```
jdbc.pool.initialSize=30
jdbc.pool.minIdle=30
jdbc.pool.maxActive=100
```

启动服务，查看日志：

```
/home/apache-tomcat-7.0.67/bin/startup.sh
tail -f /home/apache-tomcat-7.0.67/logs/catalina.out 
tail -f /home/ecmclog/ecmc.log 
```

启动完毕之后，登录`ecmc-2(25.0.3.40)`，重复以上步骤。

### 2.4 schedule服务

登录`schedule-1（25.0.3.26）`，上传`schedule.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -15 <PID>
```

将`schedule`备份：

```
cp -R /home/schedule /home/shedule_20170227
```

在`/home`目录下解压`schedule.tar`：

```
tar xvf schedule.tar
```

提取线上文件`/home/schedule/conf/db.properties`

将其中的`jdbc`部分调整如下：

```
jdbc.pool.initialSize=30
jdbc.pool.minIdle=30
jdbc.pool.maxActive=100
```

启动服务，查看日志：

```
cd /home/schedule
nohup sh startup.sh &
tail -f /home/schedulelog/schedule.log
```

启动完毕之后，登录`schedule-2（25.0.3.38）`，重复以上步骤。

### 2.5 schedule-res服务

登录`schedule-res-1（25.0.3.51）`，上传`schedule-res.tar`文件到`/home`目录下，查看并杀死服务进程：

```
ps -ef | grep java
kill -15 <PID>
```

将`schedule-res`备份：

```
cp -R /home/schedule-res /home/shedule-res_20170227
```

在`/home`目录下解压`schedule-res.tar`：

```
tar xvf schedule-res.tar
```

提取线上文件`/home/schedule-res/conf/db.properties`

将其中的`jdbc`部分调整如下：

```
jdbc.pool.initialSize=30
jdbc.pool.minIdle=30
jdbc.pool.maxActive=100
```

启动服务，查看日志：

```
cd /home/schedule-res
nohup sh startup.sh &
tail -f /home/schedulereslog/scheduleres.log
```

启动完毕之后，登录`schedule-res-2（25.0.3.61）`，重复以上步骤。

### 2.6 mail-sms服务

登录`mail-sms-1（25.0.3.16）`，上传`mail.tar`和`sms.tar`文件到`/home`目录下，查看并杀死两个服务进程：

```
ps -ef | grep java
kill -9 <PID>
```

将`mail`和`sms`备份：

```
cp -R /home/mail /home/mail_20170227
cp -R /home/sms /home/sms_20170227
```

在`/home`目录下解压`mail.tar`和`sms.tar`：

```
tar xvf mail.tar
tar xvf sms.tar
```

提取线上文件`/home/mail/conf/db.properties`和`/home/sms/conf/db.properties`

将其中的`jdbc`部分调整如下：

```
jdbc.pool.initialSize=30
jdbc.pool.minIdle=30
jdbc.pool.maxActive=30
```

启动mail服务，查看日志：

```
cd /home/mail
nohup sh startup.sh &
tail -f /home/maillog/mail.log
```

启动sms服务，查看日志：

```
cd /home/sms
nohup sh startup.sh &
tail -f /home/smslog/sms.log
```

启动完毕之后，登录`mail-sms-2（25.0.3.37）`，重复以上步骤。

## 3.正确验证

* api、ecsc、ecmc、schedule、schedule-res、mail和sms服务正常启动
* 验证第一章节升级原因

## 4.回滚

将七个服务备份文件替换原文件，重启服务即可。

### 4.1 api服务

```
cp -R /home/api_20170227 /home/api
```

### 4.2 ecsc服务

```
cp -R /home/ecsc_20170227 /home/ecsc
```

### 4.3 ecmc服务

```
cp -R /home/ecmc_20170227 /home/ecmc
```

### 4.4 schedule服务

```
cp -R /home/schedule_20170227 /home/schedule
```

### 4.5 schedule-res服务

```
cp -R /home/schedule-res_20170227 /home/schedule-res
```

### 4.6 mail-sms服务

```
cp -R /home/mail_20170227 /home/mail
cp -R /home/sms_20170227 /home/sms
```
