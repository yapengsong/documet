## 1.升级说明 ##

<p>本次升级涉及到修改替换的服务为ECMC前台服务。</p>
<p>主要是原因是修复ECMC一个前端页面的跳转逻辑问题，替换文件原因为：<p>
<li>ecmc前台云硬盘详情页中删除云硬盘后没有跳转云硬盘列表</li>

## 2.升级步骤 ##

### ECMC前台服务的升级 ###

登录`ecmc-1(25.0.3.27)`，备份前台服务目录`/home/web-ecmc/dist`：

```
# cd /home
# mkdir web-ecmc_20170217
# mv /home/web-ecmc/dist /home/web-ecmc_20170217/
```

上传新的前台程序包`web-ecmc.tar.gz`到`/home/`目录下，解压文件，并直接将解压后的dist移动到`/home/web-ecmc/`目录之下：

```
# cd /home
# tar zxvf web-ecmc.tar.gz
```

完成以上步骤之后，登录`ecmc-2(25.0.3.40)`,重复以上步骤。

## 3.正确性验证 ##

登录服务，在云硬盘详情页中操作删除云硬盘，页面跳转云硬盘列表页。

## 4.升级回退 ##

将`/home/web-ecmc_20170217/dist`直接替换`/home/web-ecmc/`下的dist文件夹即可。
