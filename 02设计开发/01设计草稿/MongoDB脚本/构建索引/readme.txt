Ҫ����MongoDBָ�����ݿ������м��ϵ����������ȣ�����mongo shell���л���ָ�����ݿ��£�������Ȩ��������Ҫͳ��dev���ݿ������е�������
> use dev
> db.auth("<username>","<password>")

Ȼ��ִ�����
> db.getCollectionNames().forEach(function(collection) {
     indexes = db[collection].getIndexes();
     print("Indexes for " + collection + ":");
     printjson(indexes);
});

����ȡ�����м����е�������¼��������������������