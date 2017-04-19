function buildIndexes (arr) {
    print("\n----------BEGIN building indexes!----------\n");
    print("Current time is " + new Date());
    for (var i = arr.length - 1; i >= 0; i--) {
        print("Building indexes for [\""+arr[i]+"\"]");
        db[arr[i]].createIndex({'timestamp':-1},{name:'idx_timestamp'});
    }

}

function buildIndexexOnSpecifiedCol (arr) {
    print("\n----------CONTINUE building indexes!----------\n");
    print("Current time is " + new Date());
    for (var i = arr.length - 1; i >= 0; i--) {
        print("Building indexes for [\""+arr[i]+"\"]");
        if(arr[i]=='ecmc.monitor.alarm.item' || arr[i]=='monitor.alarm.item'){
            db[arr[i]].createIndex({'time':-1},{name:'idx_time'});
        }else if(arr[i]=='log.money.failed' || arr[i]=='log.money.success'){
            db[arr[i]].createIndex({'monTime':-1},{name:'idx_monTime'});
        }else if(arr[i]=='log.ecmc'){
            db[arr[i]].createIndex({'operDate':-1},{name:'idx_operDate'});
        }else if(arr[i]=='log.ecsc'){
            db[arr[i]].createIndex({'actTime':-1},{name:'idx_actTime'});
        }else if(arr[i]=='schedule.lost.job'){
            db[arr[i]].createIndex({'jobDate':-1},{name:'idx_jobDate'});
        }else if(arr[i]=='log.schedule'){
        	db[arr[i]].createIndex({'jobStartTime':-1},{name:'idx_jobstarttime'});
        }
        //db[arr[i]].createIndex({'timestamp':-1},{name:'idx_timestamp'});
    }

}

var col_specified = [
    "ecmc.monitor.alarm.item",
    "log.ecmc",
    "log.ecsc",
    "log.money.failed",
    "log.money.success",
    "log.schedule",
    "monitor.alarm.item",
    "schedule.lost.job"];
var col_timestamp = [
    "bandwidth.network.incoming.detail",
    "bandwidth.network.incoming.summary",
    "bandwidth.network.outgoing.detail",
    "bandwidth.network.outgoing.summary",
    "cdn.backsource.1d",
    "cdn.backsource.1h",
    "cdn.backsource.1month",
    "cdn.backsource.api.details",
    "cdn.refresh.bucket",
    "cdn.refresh.object",
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
    "log.api.cdn",
    "log.api.dns",
    "log.charge.failed",
    "log.chargeRecord.op.fail",
    "log.obs.notice",
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
    "obs.cdn.1d",
    "obs.cdn.1h",
    "obs.cdn.1mon",
    "obs.storageUsed.1h",
    "obs.storageUsed.1month",
    "obs.storageUsed.24h",
    "obs.used.1h",
    "obs.used.1month",
    "obs.used.24h"];

buildIndexes(col_timestamp);
buildIndexexOnSpecifiedCol(col_specified);

print("\n----------DONE building indexes!----------\n");