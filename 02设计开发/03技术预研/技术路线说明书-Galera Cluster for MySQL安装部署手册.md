## 一、目标

基于Galera Cluster为MySQL部署实现真正多主和同步两大特性的数据库集群。

## 二、服务器准备工作

目前拿到的服务器环境为：
* node-1: 192.168.8.86
* node-2: 192.168.8.88
* node-3: 192.168.8.90

### 1. 关闭SELinux

```
# vim /etc/selinux/config
SELINUX=permissive
```
修改配置文件永久将`SELinux`置为`Permissive`，但是重启有效，所以我们还要临时关闭一下`SELinux`：
```
# setenforce 0
# getenforce
Permissive
```
### 2. 配置防火墙

在任一节点上，要能够接受另外两个节点的tcp链接，这里以node-1作为示例，node-2和node-3同理：
```
# iptables --insert INPUT --protocol tcp --source 192.168.8.88 --jump ACCEPT
# iptables --insert INPUT --protocol tcp --source 192.168.8.90 --jump ACCEPT
# service iptables save
```

打开防火墙3306端口
```
# vim /etc/sysconfi/iptables
...
-A INPUT -p tcp -m state --state NEW -m tcp --dport 3306 -j ACCEPT
...
```

注意：防火墙配置工作，需要在三个节点上都进行操作，注意IP地址的修改。

## 三、安装程序包

将所需要的程序包上传到服务器指定目录下，如这里将rpm软件包上传到了`/root/mysql-galera`下，所需要的程序列表为：
* galera-3-25.3.18-2.el6.x86_64.rpm
* mysql-wsrep-5.6-5.6.33-25.17.el6.x86_64.rpm
* mysql-wsrep-client-5.6-5.6.33-25.17.el6.x86_64.rpm 
* mysql-wsrep-devel-5.6-5.6.33-25.17.el6.x86_64.rpm
* mysql-wsrep-libs-compat-5.6-5.6.33-25.17.el6.x86_64.rpm  
* mysql-wsrep-server-5.6-5.6.33-25.17.el6.x86_64.rpm  
* mysql-wsrep-shared-5.6-5.6.33-25.17.el6.x86_64.rpm  
* mysql-wsrep-test-5.6-5.6.33-25.17.el6.x86_64.rpm

则安装程序需要执行下面的命令：
```
# cd /root/mysql-galera
# yum install -y galera-3-25.3.18-2.el6.x86_64.rpm \
mysql-wsrep-5.6-5.6.33-25.17.el6.x86_64.rpm \
mysql-wsrep-client-5.6-5.6.33-25.17.el6.x86_64.rpm \
mysql-wsrep-devel-5.6-5.6.33-25.17.el6.x86_64.rpm \
mysql-wsrep-libs-compat-5.6-5.6.33-25.17.el6.x86_64.rpm \
mysql-wsrep-server-5.6-5.6.33-25.17.el6.x86_64.rpm \
mysql-wsrep-shared-5.6-5.6.33-25.17.el6.x86_64.rpm \
mysql-wsrep-test-5.6-5.6.33-25.17.el6.x86_64.rpm
```

安装完毕后，启动验证服务正常
```
# service mysql start
Starting MySQL....                                         [  OK  ]
# service mysql stop
Shutting down MySQL..                                      [  OK  ]
```


## 四、数据目录迁移和配置文件更改

### 0. 公共部分

默认安装的目录在`/var/lib/mysql`，而我们需要把数据目录设置为`/home/mysql`，所以首先把数据目录拷贝：
```
# cp -rap /var/lib/mysql /home/
```

数据目录迁移后，我们还需要增加和修改配置文件。首先，增加`wsrep.cnf`文件，放在`/etc/my.cnf.d/`下即可：
```
# touch /etc/my.cnf.d/wsrep.cnf
# vim /etc/my.cnf.d/wsrep.cnf
```

### 1. node-1 操作

node-1节点上的`wsrep.cnf`内容如下：
```
[mysqld]
wsrep_provider=/usr/lib64/galera-3/libgalera_smm.so
wsrep_provider_options="gcache.size=300M; gcache.page_size=300M"
wsrep_cluster_name="f_cluster"
wsrep_cluster_address="gcomm://"     
wsrep_node_name="f-1"
wsrep_node_address="192.168.8.86"
wsrep_sst_method=rsync
```
修改node-1节点上的`/etc/my.cnf`文件，内容如下：
```
[mysqld]
datadir=/home/mysql
socket=/home/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

binlog_format=ROW
bind-address=192.168.8.86
default_storage_engine=innodb
innodb_autoinc_lock_mode=2
innodb_flush_log_at_trx_commit=0
innodb_buffer_pool_size=122M

!includedir /etc/my.cnf.d/
[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

[client]
socket=/home/mysql/mysql.sock
```

node-1配置文件更改之后，就可以将node-1作为Primary Componet启动了：
```
service mysql start --wsrep-new-cluster
Starting MySQL....                                         [  OK  ]

```
启动后，登录mysql-shell，因为是安装后首次登录，初始随机密码在`/root/.mysql-secret`下：
```
[root@localhost ~]# cat .mysql_secret
# The random password set for the root user at Tue Nov 15 17:29:48 2016 (local time): 3utOwIW2vQkb0gDw
[root@localhost ~]# mysql -uroot -p3utOwIW2vQkb0gDw

```
第一次进入mysql-shell，需要set password
```
mysql> set password = password("E4yun.cn123");
```
顺便把所有的root密码都修改一次
```
mysql> use mysql
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'E4yun.cn123' WITH GRANT OPTION;
Query OK, 0 rows affected (0.02 sec)

mysql> update user set password=password("E4yun.cn123") where user="root";
Query OK, 3 rows affected (0.00 sec)
Rows matched: 5  Changed: 3  Warnings: 0

mysql> flush privileges;
Query OK, 0 rows affected (0.02 sec)

mysql> 
```

至此node-1 galera服务已经搭建好了，在msql-shell中查看集群状态：
```
mysql> show status like 'wsrep_%';
...
| wsrep_incoming_addresses     | 192.168.8.86:3306									   |
...
| wsrep_cluster_size           | 1                                                     |
| wsrep_cluster_state_uuid     | 2ec4d28f-ab1b-11e6-90f2-8aac2a6fbfd8                  |
| wsrep_cluster_status         | Primary                                               |
| wsrep_connected              | ON                                                    |
| wsrep_local_bf_aborts        | 0                                                     |
| wsrep_local_index            | 2                                                     |
| wsrep_provider_name          | Galera                                                |
| wsrep_provider_vendor        | Codership Oy <info@codership.com>                     |
| wsrep_provider_version       | 3.18(r3b41103)                                        |
| wsrep_ready                  | ON                                                    |
+------------------------------+-------------------------------------------------------+

mysql> show variables like 'wsrep_%'; //variables展示的内容更多更详细
```
此时，集群只有一台机器，即node-1本身，可以在`wsrep_incoming_addresses`和`wsrep_cluster_size`中看出来。另外，通过`wsrep_cluster_status`看到当前节点是`Primary`，通过`wsrep_ready`为`ON`即表名当前集群状态正常。


### 2. node-2 操作

node-2节点上的`wsrep.cnf`内容如下：
```
[mysqld]
wsrep_provider=/usr/lib64/galera-3/libgalera_smm.so
wsrep_provider_options="gcache.size=300M; gcache.page_size=300M"
wsrep_cluster_name="f_cluster"
wsrep_cluster_address="gcomm://192.168.8.86"     
wsrep_node_name="f-2"
wsrep_node_address="192.168.8.88"
wsrep_sst_method=rsync
```
修改node-2节点上的`/etc/my.cnf`文件，内容如下：
```
[mysqld]
datadir=/home/mysql
socket=/home/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

binlog_format=ROW
bind-address=192.168.8.88
default_storage_engine=innodb
innodb_autoinc_lock_mode=2
innodb_flush_log_at_trx_commit=0
innodb_buffer_pool_size=122M

!includedir /etc/my.cnf.d/
[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

[client]
socket=/home/mysql/mysql.sock
```
修改完配置文件后，即可启动node-2节点：
```
# service mysql start
```

启动后，如果添加节点到集群中正常，则mysql-shell用户密码等信息会自动同步，只需要登录msql-shell查看集群状态即可，预期结果：
* `wsrep_incoming_addresses`包含node-1和node-2节点IP
* `wsrep_cluster_size`为**2**
* `wsrep_cluster_status`看到当前节点是`Primary`

### 3. node-3 操作

node-3节点上的`wsrep.cnf`内容如下：
```
[mysqld]
wsrep_provider=/usr/lib64/galera-3/libgalera_smm.so
wsrep_provider_options="gcache.size=300M; gcache.page_size=300M"
wsrep_cluster_name="f_cluster"
wsrep_cluster_address="gcomm://192.168.8.86，192.168.8.88"     
wsrep_node_name="f-3"
wsrep_node_address="192.168.8.90"
wsrep_sst_method=rsync
```
修改node-3节点上的`/etc/my.cnf`文件，内容如下：
```
[mysqld]
datadir=/home/mysql
socket=/home/mysql/mysql.sock
user=mysql
# Disabling symbolic-links is recommended to prevent assorted security risks
symbolic-links=0

binlog_format=ROW
bind-address=192.168.8.90
default_storage_engine=innodb
innodb_autoinc_lock_mode=2
innodb_flush_log_at_trx_commit=0
innodb_buffer_pool_size=122M

!includedir /etc/my.cnf.d/
[mysqld_safe]
log-error=/var/log/mysqld.log
pid-file=/var/run/mysqld/mysqld.pid

[client]
socket=/home/mysql/mysql.sock
```
修改完配置文件后，即可启动node-3节点：
```
# service mysql start
```

启动后，如果添加节点到集群中正常，则mysql-shell用户密码等信息会自动同步，只需要登录msql-shell查看集群状态即可，预期结果：
* `wsrep_incoming_addresses`包含node-1、node-2和node-3节点IP
* `wsrep_cluster_size`为**3**
* `wsrep_cluster_status`看到当前节点是`Primary`

## 五、验证

分别在node-1、node-2和node-3上做插入操作，每次插入操作之后，在三个节点上查看结果。预期结果是三个节点均和做insert操作，同时，插入完毕后，三台节点数据一致。