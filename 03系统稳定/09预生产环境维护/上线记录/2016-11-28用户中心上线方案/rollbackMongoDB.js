function dropCollections (arr) {
    print("\n----------BEGIN droping new collections!----------\n");
    print("Current time is " + new Date());
    for (var i = arr.length - 1; i >= 0; i--) {
        print("Droping new collection [\""+arr[i]+"\"]");
        db[arr[i]].drop();
    }
	print("\n----------END droping new collections!----------\n");
}
function removeSpecifiedDocument (arr) {
    print("\n----------BEGIN processing modified colllections!----------\n");
    print("Current time is " + new Date());
    for (var i = arr.length - 1; i >= 0; i--) {
		if(arr[i]=='memory.usage.detail'){
			print("Removing modified documents of [\""+arr[i]+"\"]");
			db[arr[i]].remove({'counter_type':'gauge'});
		}else if(arr[i]=='obs.used.1month' || arr[i]=='obs.used.24h'){
			print("Removing modified fields of [\""+arr[i]+"\"]");
			db[arr[i]].update({'final_data':{'$exists':true}}, {'$unset':{'final_data':true}}, {'multi':true});
		}
    }
	print("\n----------END processing modified colllections!----------\n");
}

var col_remove_doc = [
    "memory.usage.detail",
    "obs.used.1month",
	"obs.used.24h"
    ];
var col_need_drop = [
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
	"log.ecmc",
    "log.ecsc",
    "log.money.failed",
    "log.money.success",
    "log.schedule",
	"schedule.lost.job"];

dropCollections(col_need_drop);
removeSpecifiedDocument(col_remove_doc);