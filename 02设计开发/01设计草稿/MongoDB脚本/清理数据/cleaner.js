Date.prototype.format = function(format)
{
    var o =
    {
        "M+" : this.getMonth()+1, //month
        "d+" : this.getDate(),    //day
        "h+" : this.getHours(),   //hour
        "m+" : this.getMinutes(), //minute
        "s+" : this.getSeconds(), //second
        "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
        "S" : this.getMilliseconds() //millisecond
    }
    if(/(y+)/.test(format))
        format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(format))
            format = format.replace(RegExp.$1,RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
    return format;
}

function getDay(day){      
    var today = new Date();         
    var targetday_milliseconds=today.getTime() + 1000*60*60*24*day;             
    today.setTime(targetday_milliseconds); //core code         
    var tYear = today.getFullYear();    
    var tMonth = today.getMonth();      
    var tDate = today.getDate();    
    tMonth = doHandleMonth(tMonth + 1);     
    tDate = doHandleMonth(tDate);       
    return tYear+"-"+tMonth+"-"+tDate+" 00:00:00";
    }

function doHandleMonth(month){ 
    var m = month;      
    if(month.toString().length == 1){ 
        m = "0" + month;     
        }       
    return m;
    }

function doDeleteStaleData (arr, colName, preDay) {
    if(colName=='time'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'time':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'time':{'$lt':preDay}});
        }
    }else if(colName=='date'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'date':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'date':{'$lt':preDay}});
        }
    }else if(colName=='timestamp'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'timestamp':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'timestamp':{'$lt':preDay}});
        }
    }

}

function doDeleteSpecificColDate (arr, preDay) {
    if(arr[i]=='log.ecmc'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'operDate':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'operDate':{'$lt':preDay}});
        }
    }else if(arr[i]=='log.ecsc'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'actTime':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'actTime':{'$lt':preDay}});
        }
    }else if(arr[i]=='log.schedule'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'jobStartTime':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'jobStartTime':{'$lt':preDay}});
        }
    }
    else if(arr[i]=='schedule.lost.job'){
        for (var i = arr.length - 1; i >= 0; i--) {
            var count=db[arr[i]].find({'jobDate':{'$lt':preDay}}).count();
            print("Stale data in [\""+arr[i]+"\"] counts " + count);
            db[arr[i]].remove({'jobDate':{'$lt':preDay}});
        }
    }

}

var myDate = new Date();
var datetime = myDate.format("yyyy-MM-dd 00:00:00");

var daysAgo = -90;
var preDay = getDay(daysAgo);
print("\n--------------------BEGIN--------------------\n");
print("Today is "+datetime+"\nBegin deleting stale data before "+preDay+" ...\n");
datetime= new Date(datetime);
preDay = new Date(preDay);

var col_time = ["ecmc.monitor.alarm.item","monitor.alarm.item"];
var col_date = ["bandwidth.network.incoming.summary","bandwidth.network.outgoing.summary"];
var col_timestamp = [
    "cpu_util.10min",
    "cpu_util.1d",
    "cpu_util.1h",
    "cpu_util.2h",
    "cpu_util.30min",
    "cpu_util.3min",
    "cpu_util.5min",
    "cpu_util.detail",
    "disk.read.bytes.rate.10min",
    "disk.read.bytes.rate.12h",
    "disk.read.bytes.rate.1d",
    "disk.read.bytes.rate.1h",
    "disk.read.bytes.rate.2h",
    "disk.read.bytes.rate.30min",
    "disk.read.bytes.rate.3min",
    "disk.read.bytes.rate.5min",
    "disk.read.bytes.rate.detail",
    "disk.write.bytes.rate.10min",
    "disk.write.bytes.rate.12h",
    "disk.write.bytes.rate.1d",
    "disk.write.bytes.rate.1h",
    "disk.write.bytes.rate.2h",
    "disk.write.bytes.rate.30min",
    "disk.write.bytes.rate.3min",
    "disk.write.bytes.rate.5min",
    "disk.write.bytes.rate.detail",
    "memory.usage.10min",
    "memory.usage.12h",
    "memory.usage.1h",
    "memory.usage.2h",
    "memory.usage.30min",
    "memory.usage.3min",
    "memory.usage.5min",
    "memory.usage.detail",
    "network.incoming.bytes.rate.10min",
    "network.incoming.bytes.rate.12h",
    "network.incoming.bytes.rate.1d",
    "network.incoming.bytes.rate.1h",
    "network.incoming.bytes.rate.2h",
    "network.incoming.bytes.rate.30min",
    "network.incoming.bytes.rate.3min",
    "network.incoming.bytes.rate.5min",
    "network.incoming.bytes.rate.detail",
    "network.outgoing.bytes.rate.10min",
    "network.outgoing.bytes.rate.12h",
    "network.outgoing.bytes.rate.1d",
    "network.outgoing.bytes.rate.1h",
    "network.outgoing.bytes.rate.2h",
    "network.outgoing.bytes.rate.30min",
    "network.outgoing.bytes.rate.3min",
    "network.outgoing.bytes.rate.5min",
    "network.outgoing.bytes.rate.detail",
    "obs.storageUsed.1h",
    "obs.storageUsed.1month",
    "obs.storageUsed.24h",
    "obs.used.1h",
    "obs.used.1month",
    "obs.used.24h",
    "bandwidth.network.incoming.detail",
    "bandwidth.network.outgoing.detail",
    "cdn.backsource.1d",
    "cdn.backsource.1h",
    "cdn.backsource.1month",
    "cdn.backsource.api.details",
    "cdn.refresh.bucket",
    "cdn.refresh.object",
    "log.api.cdn",
    "log.api.dns",
    "log.charge.failed",
    "log.chargeRecord.op.fail",
    "log.obs.notice",
    "obs.cdn.1d",
    "obs.cdn.1h",
    "obs.cdn.1mon",
    "memory.usage.detail",
    "obs.used.1month",
    "obs.used.24h",
    "log.money.failed",
    "log.money.success",
    "volume.used.detail",
    "volume.used.3min",
    "volume.used.5min",
    "volume.used.10min",
    "volume.used.1h",
    "volume.used.1d",
    "ldpool.monitor.detail",
    "ldpool.monitor.member.exp"
    ];

var col_specific = ["log.ecmc","log.ecsc","log.schedule","schedule.lost.job"];

doDeleteStaleData(col_time, 'time', preDay);
doDeleteStaleData(col_date, 'date', preDay);
doDeleteStaleData(col_timestamp, 'timestamp', preDay);
doDeleteSpecificColDate(col_specific, preDay);

print("\n----------DONE deleting stale data!----------\n");

