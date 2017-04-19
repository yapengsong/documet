## 1.升级说明

<p>本次升级涉及服务为schedule-res的配置文件，需要替换配置文件，并重启服务。</p>
<p>升级原因为：</p>
云硬盘备份时长最长为18小时，因此需要修改quotz配置的时间。

## 2.升级步骤

<p>登录`schedule-res-1（25.0.3.51）`，上传`schedule-res.tar`文件到`/home`目录下，查看并杀死服务进程：</p>

```
# ps -ef | grep java
# kill -15 <PID>
```
<p>将`schedule-res`备份：</p>

```
# cp -R /home/schedule-res /home/schedule-res_20170221
```
<p>在`/home`目录下解压`schedule-res.tar`：</p>

```
# cd /home
# tar xvf schedule-res.tar
```
<p>启动服务，查看日志：</p>

```
# cd /home/schedule-res
# nohup sh startup.sh &
# tail -f /home/schedulereslog/scheduleres.log 
```
<p>服务正常启动之后，可以登录`schedule-res-2(25.0.3.61)`，然后重复上述步骤。</p>

## 3.正确性验证

* schedule-res服务正常运行；
* 验证以上升级原因。

## 4.回退

<p>在`schedule-res-1（25.0.3.51）`上杀死服务进程</p>

```
# ps -ef | grep java
# kill -15 <PID>
```
<p>将`schedule-res_20170221`替换原程序文件。</p>

```
# cp -R /home/schedule-res_20170221 /home/schedule-res
```
<p>重启`schedule-res`服务(可参看升级步骤中的重启方式)，然后登陆`schedule-res-2(25.0.3.61)`，重复上述步骤。</p>
