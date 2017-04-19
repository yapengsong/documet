## 1.升级说明 ##

<p>本次升级主要是原因是修复ECSC两个前端页面的展示问题，以及一个后台弹性公网IP手动释放后的计费消息发送错误的问题。</p>
<p>涉及到修改替换的服务为ECSC服务,替换文件原因为：<p>
<li>bug ID 9431：ecsc备案中心查看图片‘主体负责人’和‘前置专项审批’图片展示时未做长度限制</li>
<li>bug ID 9435：ecsc备案中心图片删除失败</li>
<li>bug ID 9437：【ecsc弹性公网ip】在ecsc中释放一个按需的弹性公网ip，整点没有扣除当前小时的费用</li>
<li>js，css加版本号</li>
<li>提交提示语统一</li>

## 2.升级步骤 ##

### ECSC服务的升级 ###

登录服务器ecsc-1(25.0.3.17),查看ECSC进程，停止服务：

```
# ps -ef | grep java
# kill -9 <PID>
```

将`/home/ecsc`备份：

```
# cp -R /home/ecsc /home/ecsc_20170216
```

上传`ecsc.tar`到`/home/`目录下，解压tar包，替换ecsc中8个需要替换的前台文件:

```
# cd /home
# tar xvf ecsc.tar
```

启动服务，同时查看启动日志：

```
# /home/apache-tomcat-7.0.67/bin/startup.sh
# tail -f /home/apache-tomcat-7.0.67/logs/catalina.out
# tail -f /home/ecsclog/ecsc.log
```

<p>ecsc-1（25.0.3.17）启动完毕后，查看服务是否可以正常访问。</p>

<p>登陆ecsc-2(25.0.3.39)，做与ecsc-1相同的升级步骤，完成升级操作。</p>

## 3.正确性验证 ##

<li>ECSC服务正常访问；</li>
<li>验证第一章节关于升级说明解决的问题。</li>

## 4.升级回退 ##

### ECSC服务回退 ###

将备份的ECSC程序`/home/ecsc_20170216/`目录恢复为`/home/ecsc/`,重启服务即可。