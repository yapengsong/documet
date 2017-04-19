要整理MongoDB指定数据库下所有集合的索引，首先，进入mongo shell，切换到指定数据库下，进行授权，如我们要统计dev数据库下所有的索引：
> use dev
> db.auth("<username>","<password>")

然后执行命令：
> db.getCollectionNames().forEach(function(collection) {
     indexes = db[collection].getIndexes();
     print("Indexes for " + collection + ":");
     printjson(indexes);
});

即可取得所有集合中的索引记录。拷贝出来，分析整理。