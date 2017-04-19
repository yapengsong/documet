function EayunPrice () {
	var dataCenter = [{
		name:'北京',
		code:'bj'
	}];

	var purchaseMessage = [{
			name:'包年包月',
			code:'bnby',
			value:'monthly'
		},{
			name:'按需付费',
			code:'axff',
			value:'needed'
	}];

	var progressInput = [{
		name: 'input',
		code:'input'
	}];


	var OS = {
		bj:[{
				type:'windows',
				image:[{
						name:'Windows sever2012 R2标准版 64位中文版',
						code:'widowsStandard2012'
					},{
						name:'Windows sever2012 R2 数据中心版 64位中文版',
						code:'windowsEnterprise2012'
					},{
						name:'Windows sever2008 R2 标准版 64位中文版',
						code:'widowsStandard2008'
					},{
						name:'Windows sever2008 R2 数据中心版64位 中文版',
						code:'windowsEnterprise2008'
					}]
			},{
				type:'centos',
				image:[{
						name:'Centos7.1 64位',
						code:'centos5'
					},{
						name:'Centos6.5 32位',
						code:'centos6'
					},{
						name:'Centos6.5 64位',
						code:'centos7'
					}]
			},{
				type:'ubuntu',
				image:[{
						name:'Ubuntu14.04 32位',
						code:'ubuntu1432'
					},{
						name:'Ubuntu14.04 64位',
						code:'ubuntu1464'
					},{
						name:'Ubuntu12.04 32位',
						code:'ubuntu1232'
					},{
						name:'Ubuntu12.04 64位',
						code:'ubuntu1264'
					}]
			},{
				type:'debian',
				image:[{
						name:'Debian7.5.0 32位',
						code:'debian732'
					},{
						name:'Debian7.5.0 64位',
						code:'debian764'
					}]
			}]
	};

	var cpu = {
		bj:[{
				type:'1',
				mem:[{
						name:'1',
						code:'mem11'
					},{
						name:'2',
						code:'mem12'
					},{
						name:'4',
						code:'mem14'
					},{
						name:'8',
						code:'mem18'
				}]
			},{
				type:'2',
				mem:[{
						name:'2',
						code:'mem22'
					},{
						name:'4',
						code:'mem24'
					},{
						name:'8',
						code:'mem28'
					},{
						name:'16',
						code:'mem216'
				}]
						},{
				type:'4',
				mem:[{
						name:'4',
						code:'mem44'
					},{
						name:'8',
						code:'mem48'
					},{
						name:'16',
						code:'mem416'
					},{
						name:'32',
						code:'mem432'
				}]
			},{
				type:'8',
				mem:[{
						name:'8',
						code:'mem88'
					},{
						name:'16',
						code:'mem816'
					},{
						name:'32',
						code:'mem832'
				}]
			},{
				type:'16',
				mem:[{
						name:'32',
						code:'mem1632'
					},{
						name:'64',
						code:'mem1664'
				}]
			},{
				type:'32',
				mem:[{
						name:'64',
						code:'mem3264'
					},{
						name:'128',
						code:'mem32128'
				}]

		}]
	}

	var images = {
		widowsStandard2012:{
			type:'windows',
			name:'Windows sever2012 R2标准版 64位中文版'
		},
		windowsEnterprise2012:{
			type:'windows',
			name:'Windows sever2012 R2 数据中心版 64位中文版'	
		},
		widowsStandard2008:{
			type:'windows',
			name:'Windows sever2008 R2 标准版 64位中文版'
		},
		windowsEnterprise2008:{
			type:'windows',
			name:'Windows sever2008 R2 数据中心版64位 中文版'
		},
		centos5:{
			type:'centos',
			name:'Centos7.1 64位'
		},
		centos6:{
			type:'centos',
			name:'Centos6.5 32位'
		},
		centos7:{
			type:'centos',
			name:'Centos6.5 64位',
		},
		ubuntu1432:{
			type:'ubuntu',
			name:'Ubuntu14.04 32位'
		},
		ubuntu1464:{
			type:'ubuntu',
			name:'Ubuntu14.04 64位'
		},
		ubuntu1232:{
			type:'ubuntu',
			name:'Ubuntu12.04 32位'
		},
		ubuntu1264:{
			type:'ubuntu',
			name:'Ubuntu12.04 64位'
		},
		debian732:{
			type:'debian',
			name:'Debian7.5.0 32位'
		},
		debian764:{
			type:'debian',
			name:'Debian7.5.0 64位'
		}
	};

	var mems = {
		mem11:{
			type:'1',
			name:'1'
		},
		mem12:{
			type:'1',
			name:'2'		
		},
		mem14:{
			type:'1',
			name:'4'
		},
		mem18:{
			type:'1',
			name:'8'
		},
		mem22:{
			type:'2',
			name:'2'
		},
		mem24:{
			type:'2',
			name:'4'
		},
		mem28:{
			type:'2',
			name:'8'
		},
		mem216:{
			type:'2',
			name:'16'
		},
		mem44:{
			type:'4',
			name:'4'
		},
		mem48:{
			type:'4',
			name:'8'
		},
		mem416:{
			type:'4',
			name:'16'
		},
		mem432:{
			type:'4',
			name:'32'
		},
		mem88:{
			type:'8',
			name:'8'
		},
		mem816:{
			type:'8',
			name:'16'
		},
		mem832:{
			type:'8',
			name:'32'
		},
		mem1632:{
			type:'16',
			name:'32'
		},
		mem1664:{
			type:'16',
			name:'64'
		},
		mem3264:{
			type:'32',
			name:'64'
		},
		mem32128:{
			type:'32',
			name:'128'
		}
	};

	var monthly = {
		bj:{
			publicNet:function(){
				return 30;
			},
			mem:function (code) {
				return mems[code].type * 30 + mems[code].name * 28;
			},
			cloudType:function(){
				return 0.30;
			},
            bandwidth:function(bandwidth){
            	if(bandwidth < 6){
	            	return  bandwidth * 25 ;
	            }else{
	            	return 125 + (bandwidth-5) * 80;
	            }
            },
            ip:function(){
            	return 30;
            }
		}
	};

	var needed = {
		bj:{
			publicNet:function(){
				return 0.042;
			},
			mem:function (code) {
				return mems[code].type * 0.042 + mems[code].name * 0.039;
			},
			cloudType:function(){
				return 0.001;
			},
            snapshot:function(sizeSna){
            	return sizeSna * 0.001;
            },
            bandwidth:function(bandwidth){
            	if(bandwidth < 6){
	            	return  bandwidth * 0.035 ;
	            }else{
	            	return (125 + ( bandwidth - 5 ) * 80 ) / 30 / 24;
	            }
            },
            ip:function(){
            	return 0.042;
            }
		}
	};

	var eos = {
		bj:{		
			spaceSelect:function(value,timesS){
				if(value == 'GB'){
					if(timesS<=1){
						return timesS * 0;
					}else if(timesS > 1 & timesS <= 1024){
						return (timesS - 1) * 0.158;
					}else if(timesS > 1024 & timesS <= 51200){
						return (1024 - 1) * 0.158 + (timesS - 1024) * 0.156;
					}else if(timesS > 51200){
						return (1024 -1) * 0.158 + ( 51200 - 1024 ) * 0.156 + ( timesS - 51200 ) * 0.153;
					}
				}else{
					if(timesS<=1){
						return timesS * 0.158 * ( 1024 - 1 );
					}else if(timesS > 1 & timesS <= 50){
						return (timesS * 1024 - 1 * 1024) * 0.156   +  0.158 * ( 1024 - 1 );
					}else if(timesS > 50){
						return 0.156 * 49 * 1024 + ( timesS * 1024 - 50 * 1024 ) * 0.153  +  0.158 * (1024 -1 ) ;
					}
				}
			},				
			flowSelect:function(value,timesF){
				if(value == 'GB'){
					if(timesF<=1){
						return timesF * 0;
					}else if(timesF > 1 & timesF <= 1024){
						return ( timesF - 1 )  * 0.64;
					}else if(timesF > 1024 & timesF <= 10240){
						return (1024 -1) * 0.64 + ( timesF - 1024 ) * 0.58;
					}else if(timesF > 10240){
						return (1024-1) * 0.64 +  ( 10240 - 1024 ) * 0.58 + ( timesF - 10240 ) * 0.56;
					}
				}else{
					if(timesF<=1){
						return timesF * 0.64 * (1024 - 1);
					}else if(timesF > 1 & timesF <= 10){
						return ( timesF * 1024 -1*1024 ) * 0.58  + 0.64 * ( 1024-1 );
					}else if(timesF > 10){
						return 0.58 * 9 * 1024 + ( timesF * 1024 - 10 *1024)  * 0.56  +  0.64 * (1024 -1);
					}
				}
			},	
            request:function(timeR){
            	if( timeR <= 10 ){
					return 0;
				}else{
					return (timeR -10 )* 0.01;
				}
            },
            download:function(timesD){
				return timesD * 0.32;
            },
            downloadSelect:function(value){
				if(value == 'GB'){
					return 1;
				}else{
					return 1024;
				}
			}
		}
	}



	var price = {
		monthly: monthly,
		needed: needed,
		eos: eos
	};

	this.getDataCenter = function(){
		return dataCenter;
	};

	this.getDataCenterByCode = function(code){
		var _dataCenter;
		$.each(dataCenter,function (index, element) {
			if(element.code == code){
				_dataCenter = element;
			}
		});
		return _dataCenter;
	};

	this.getPurchaseMessage = function(){
		return purchaseMessage;
	};

	this.getPurchaseMessageByCode = function(code){
		var _purchaseMessage;
		$.each(purchaseMessage,function (index, element) {
			if(element.code == code){
				_purchaseMessage = element;
			}
		});
		return _purchaseMessage;
	};

	this.getProgressInput = function(){
		return progressInput;
	};


	this.getOS = function(){
		return OS;
	};
	this.getOSByDataCenterCode = function(code){
		return OS[code];
	};

	this.getImages = function () {
		return images;
	};
	this.getImageByCode = function (code) {
		return images[code];
	};

	this.getCpu = function(){
		return cpu;
	};
	this.getCpuByDataCenterCode = function(code){
		return cpu[code];
	};

	this.getMems = function () {
		return mems;
	};
	this.getMemByCode = function (code) {
		return mems[code];
	};


	this.getPrice = function (data) {
		var priceFn = price[data.purchase][data.dataCenter],
			totle = 0;
		totle += data.publicNet ? priceFn.publicNet() : 0;
		totle += priceFn.mem(data.mem);
		return totle;
	};
	this.getPriceEcd = function (data) {
		var priceFn = price[data.purchase][data.dataCenter],
			totle = 0;
		totle += priceFn.cloudType(data.cloudType);
		totle = totle * data.capacity;
		return totle;
	};
	this.getPriceSna = function (data) {
		var priceFn = price[data.purchase][data.dataCenter],
			totle = 0;
		totle += priceFn.snapshot(data.snapshot);
		return totle;
	};
	this.getPriceVpc = function (data) {
		var priceFn = price[data.purchase][data.dataCenter],
			totle = 0;
		totle += priceFn.bandwidth(data.bandwidth);
		return totle;
	};
	this.getPriceEip = function (data) {
		var priceFn = price[data.purchase][data.dataCenter],
			totle = 0;
		totle += priceFn.ip(data.ip);
		return totle;
	};
	this.getPriceEos = function (data) {
		var priceFn = price[data.purchase][data.dataCenter],
			totle = 0;
		totle += priceFn.spaceSelect(data.spaceSelect,data.space) ;
		totle += priceFn.flowSelect(data.flowSelect,data.flow);
		totle += priceFn.request(data.request);
		totle += priceFn.download(data.download * data.days) * priceFn.downloadSelect(data.downloadSelect);	
		return totle;
	};
}