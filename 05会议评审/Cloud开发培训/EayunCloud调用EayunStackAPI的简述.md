## EayunCloud调用EayunStack API的流程
### 一、前台开发流程
前端平台使用了AngularJS和Bootstrap

#### 1.路由

	.state('app.cloud.cloudhost.hostdetail',{
    	url: '/hostdetail/:vmId',
        templateUrl: 'views/cloudhost/host/vmdetail.html',
        controller: 'VmDetailController'
    })

#### 2.Controller
	.controller('CloudhostHostCtrl', function ($rootScope,$scope,$state
		$timeout,eayunHttp,eayunModal,powerService,eayunStorage,VmService,$http) {
	  var list=[];
	  $rootScope.navList(list,'云主机');
	  
	  /**
	   * 
	   * 新增按钮权限控制
	   */
	  powerService.powerRoutesList().then(function(powerList){
			$scope.vmListPermissions = {
					isAddHost : powerService.isPower('host_add'),	//创建云主机
					renewHost : powerService.isPower('host_renew')	//续费
			};
		});
	  
	    $scope.myTable = {
	      source: 'cloud/vm/listVm.do',
	      api : {},
	      getParams: function () {
	        return {
	        	prjId :  $scope.model.projectvoe ? $scope.model.projectvoe.projectId : '',
	        	dcId :   $scope.model.projectvoe ? $scope.model.projectvoe.dcId : '',
				queryType : $scope.search ? $scope.search.key :'',
	        	title :  $scope.search ? $scope.search.value:'',
	    		status : $scope.query ? $scope.query.status :'',
	    		system : $scope.query ?$scope.query.system :''
	        };
	      }
	    };

		/**
	     * 创建云主机
	     */
	    
	    $scope.buyVm = function (){
	    	$state.go('buy.host',{orderNo:'000000'})
	    };
	    
	    /**
	     * 云主机--续费
	     */
	    $scope.renewVm = function(item){
	    	var result = eayunModal.open({
		        templateUrl: 'views/cloudhost/host/vmrenew.html',
		        controller: 'cloudhostRenewCtrl',
		        resolve: {
		            item:function (){
	            		return item;
	            	},
	    	        volume:function(){
	    	        	return eayunHttp.post('cloud/volume/getSysVolumeByVmId.do',item.vmId).then(function(response){
	    	       		   return response.data;
	    	       	    });
	    	        }
		        }
		      });
	    	result.result.then(function (value) {
	    		VmService.checkIfOrderExist(item.vmId).then(function(response){
	                eayunModal.warning("资源正在调整中或您有未完成的订单，请稍后再试。");
	            },function(){
	                $state.go('renew.renewhost');
	
	            });
		    	  
		      }, function () {
		      });
	    };
	}

#### 3.调用Cloud后台

使用eayunHttp发起http请求，eayunHttp是我们基于AngularJS本身的`$http`扩展的一个service,其中包含对request的header中信息的封装和response返回中异常的统一处理。

例如：

	eayunHttp.post('cloud/vm/modifyPwd.do',cloudVm).then(function(response){
		  if(null!=response.data&&response.data.respCode == '400000'){
			  toast.success('密码修改成功',2000); 
			  $scope.checkToken = false;
			  $scope.cancel();
		  }
		  else {
			  $scope.checkToken = false;
			  $scope.cancel();
		  }
	  },function (){
		  $scope.checkToken = false;
	  });

由于Cloud后台使用的是SpringMVC，所以这个请求`cloud/vm/modifyPwd.do` 会调用后台的`VmController`中`modifyPwd`方法

	/**
	 * 云主机操作
	 * @author zhouhaitao
	 *
	 */
	@Controller
	@RequestMapping("/cloud/vm")
	@Scope("prototype")
	public class VmController {
	    private static final Logger log = LoggerFactory.getLogger(VmController.class);
	    @Autowired
	    private VmService vmService;  
	    @Autowired
	    private LogService logService;


		/**
	     * 
	     * <p>修改云主机密码</p>
	     * ----------------------------
	     * @author zhouhaitao
	     * 
	     * @param request
	     * @param cloudVm
	     * @return
	     */
	    @RequestMapping(value="modifyPwd" , method = RequestMethod.POST)
	    @ResponseBody
	    public String modifyPwd (HttpServletRequest request,@RequestBody CloudVm cloudVm){
	    	JSONObject json = new JSONObject();
	    	try{
	    		vmService.modifyPwd(cloudVm);
	    		json.put("respCode", ConstantClazz.SUCCESS_CODE_OP);
				logService.addLog("修改密码",  ConstantClazz.LOG_TYPE_HOST, 
					cloudVm.getVmName(), cloudVm.getPrjId(),  ConstantClazz.LOG_STATU_SUCCESS,null);
	    	}catch(Exception e ){
				logService.addLog("修改密码",  ConstantClazz.LOG_TYPE_HOST, 
					cloudVm.getVmName(), cloudVm.getPrjId(),  ConstantClazz.LOG_STATU_ERROR,e);
	    		json.put("respCode", ConstantClazz.ERROR_CODE);
	    		throw e;
	    	}
	    	return json.toJSONString();
	    }
	
	}
### 二、调用Stack API的流程

 
* 需要先去调用keystone服务的认证API，获取 tokenId

请求的url

	post http://192.168.11.3:35357/v2.0/tokens 

请求参数：

	{
		"auth": {
			"tenantId": "8e67a5cf4e7f45a6b7778333c9fb6292",
			"passwordCredentials": {
				"username": "admin",
				"password": "admin"
			}
		}
	}

返回参数：

    {
    	"access": {
    		"token": {
    			"id": "2e85673195fe4b7c92ec9d8935ee9c6c",
    			"issued_at": "2017-04-13T06:59:16.547764",
    			"expires": "2017-04-13T07:59:16Z",
    			"tenant": {
    				"id": "8e67a5cf4e7f45a6b7778333c9fb6292",
    				"enabled": true,
    				"description": "",
    				"name": "YSY_01"
    			},
    			"audit_ids": ["2EiWnSRXQRSseMH5SYz2Dw"]
    		},

    		"serviceCatalog": [{
    			"endpoints_links": [],
    			"name": "nova",
    			"endpoints": [{
    				"id": "10409d2333a74b559979a16a45068b0b",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8774/v2/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"adminURL": "http://20.0.0.2:8774/v2/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"internalURL": "http://20.0.0.2:8774/v2/8e67a5cf4e7f45a6b7778333c9fb6292"
    			}],
    			"type": "compute"
    		},
    		{
    			"endpoints_links": [],
    			"name": "neutron",
    			"endpoints": [{
    				"id": "c527be075d474dbfbaa6f42d3c343a99",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:9696/",
    				"adminURL": "http://20.0.0.2:9696/",
    				"internalURL": "http://20.0.0.2:9696/"
    			}],
    			"type": "network"
    		},
    		{
    			"endpoints_links": [],
    			"name": "cinderv2",
    			"endpoints": [{
    				"id": "0037d0285cc047738ee252abd1c65799",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8776/v2/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"adminURL": "http://20.0.0.2:8776/v2/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"internalURL": "http://20.0.0.2:8776/v2/8e67a5cf4e7f45a6b7778333c9fb6292"
    			}],
    			"type": "volumev2"
    		},
    		{
    			"endpoints_links": [],
    			"name": "trove",
    			"endpoints": [{
    				"id": "9fcb6e6c95134bbe98b556b6f86fa66d",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.77:8779/v1.0/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"adminURL": "http://192.168.11.77:8779/v1.0/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"internalURL": "http://192.168.11.77:8779/v1.0/8e67a5cf4e7f45a6b7778333c9fb6292"
    			}],
    			"type": "database"
    		},
    		{
    			"endpoints_links": [],
    			"name": "glance",
    			"endpoints": [{
    				"id": "1adfab275c1448a7a75a7c75c0c8bbc7",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:9292",
    				"adminURL": "http://20.0.0.2:9292",
    				"internalURL": "http://20.0.0.2:9292"
    			}],
    			"type": "image"
    		},
    		{
    			"endpoints_links": [],
    			"name": "ceilometer",
    			"endpoints": [{
    				"id": "12aa1af1e1d043ffb2429618b601bba6",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8777",
    				"adminURL": "http://20.0.0.2:8777",
    				"internalURL": "http://20.0.0.2:8777"
    			}],
    			"type": "metering"
    		},
    		{
    			"endpoints_links": [],
    			"name": "heat-cfn",
    			"endpoints": [{
    				"id": "6ed7ba4f809c4f58a46dc351c4149b33",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8000/v1/",
    				"adminURL": "http://20.0.0.2:8000/v1/",
    				"internalURL": "http://20.0.0.2:8000/v1/"
    			}],
    			"type": "cloudformation"
    		},
    		{
    			"endpoints_links": [],
    			"name": "cinder",
    			"endpoints": [{
    				"id": "2a32a643dc3543ba9b011c246713ec59",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8776/v1/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"adminURL": "http://20.0.0.2:8776/v1/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"internalURL": "http://20.0.0.2:8776/v1/8e67a5cf4e7f45a6b7778333c9fb6292"
    			}],
    			"type": "volume"
    		},
    		{
    			"endpoints_links": [],
    			"name": "nova_ec2",
    			"endpoints": [{
    				"id": "5f351063dd34475eb5e1bcd27c7214b0",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8773/services/Cloud",
    				"adminURL": "http://20.0.0.2:8773/services/Admin",
    				"internalURL": "http://20.0.0.2:8773/services/Cloud"
    			}],
    			"type": "ec2"
    		},
    		{
    			"endpoints_links": [],
    			"name": "heat",
    			"endpoints": [{
    				"id": "2fbc825752834755905b37c88575acb1",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:8004/v1/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"adminURL": "http://20.0.0.2:8004/v1/8e67a5cf4e7f45a6b7778333c9fb6292",
    				"internalURL": "http://20.0.0.2:8004/v1/8e67a5cf4e7f45a6b7778333c9fb6292"
    			}],
    			"type": "orchestration"
    		},
    		{
    			"endpoints_links": [],
    			"name": "swift",
    			"endpoints": [{
    				"id": "a5f513dd94a74ac3b1c86eba220a0675",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.8.80/swift/v1",
    				"adminURL": "http://192.168.8.80/swift/v1",
    				"internalURL": "http://192.168.8.80/swift/v1"
    			}],
    			"type": "object-store"
    		},
    		{
    			"endpoints_links": [],
    			"name": "keystone",
    			"endpoints": [{
    				"id": "4631a65787424e359058da5b6b7f24ec",
    				"region": "RegionPub",
    				"publicURL": "http://192.168.11.3:5000/v2.0",
    				"adminURL": "http://192.168.11.3:35357/v2.0",
    				"internalURL": "http://20.0.0.2:5000/v2.0"
    			},
    			{
    				"id": "70ae541e72704d09bf1ee550993d4f9a",
    				"region": "RegionOne",
    				"publicURL": "http://192.168.11.3:5000/v2.0",
    				"adminURL": "http://20.0.0.2:35357/v2.0",
    				"internalURL": "http://20.0.0.2:5000/v2.0"
    			}],
    			"type": "identity"
    		}],
    		"user": {
    			"id": "77620e83283d453086a9c8bfbf91c55b",
    			"username": "admin",
    			"name": "admin",
    			"roles": [{
    				"name": "admin"
    			}],
    			"roles_links": []
    		},
    		"metadata": {
    			"is_admin": 0,
    			"roles": ["14040785c868422baede4865d9448a71"]
    		}
    	}
    }
 
以上的返回数据中  
包含4部分数据：token 、service、user、metadata

其中token 中id 就是调用其他API中用到的tokenid
service中 是底层所包含的各个服务的endpoint，一般使用 publicURL；

根据API文档，查询需要调用API的 属于哪个服务，调用对应的publicURL+api信息。
一般调用API 的 请求类型包括：post、put、get、delete、patch
### 三、后台代码结构
> RestService
 
> OpenstackBaseServiceImpl
  
> OpenstackxxxService stack业务service 继承于 OpenstackBaseServiceImpl 组装参数  调用RestService的底层公共方法

> xxxService xxx业务Service 处理与xxx业务相关的service  调用OpenstackxxxService 操作stack的api

> xxxController xxx业务Controller,接口xxx业务的入口