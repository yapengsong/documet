## 一、前言

本文主要介绍EayunCloud开发中计划任务的使用及意义、对象存储的业务简介和标签管理的介绍。

目标：了解基本业务，代码工程。具体实现及流程可以参考代码。

## 二、计划任务

计划任务，我们使用了[Quartz的计划任务框架](http://www.quartz-scheduler.org/)，并在Spring中整合使用，可以参考[这个实例](https://www.mkyong.com/spring/spring-quartz-scheduler-example/)。

如果是按照服务部署和工程拆分，主要分为了`schedule`和`schedule-res`两个服务。

### schedule

Schedule工程中包含计费、监控报警（ECSC、ECMC）、工单、订单、支付、站内信通知等计划任务。

### schedule-res

Schedule-res工程中包含资源相关的计划任务，如数据中心同步、CDN回源统计、CDN用量统计、云主机指标统计、OBS用量统计、回收站自动过期处理、预付费资源过期处理等。

Schedule-res中的数据中心同步注册到Dubbo上作为服务的Provider，因为数据中心的代码写在了schedule-res工程中，但是eayun-virtualization不能依赖schedule-res（防止产生循环以来——schedule-res中一定是依赖了virtualization），所以注册到dubbo中做成了一个服务的Provider。

#### 示例实战

我们以计费的计划任务做个说明，代码——`com.eayun.charge.job.ChargeJob`，配置文件——`applicationContext-quartz-charge.xml`。

首先来看配置文件：
```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.springframework.org/schema/beans 
	http://www.springframework.org/schema/beans/spring-beans.xsd">
	
	<bean id="statusCalculateJob"
		class="org.springframework.scheduling.quartz.JobDetailFactoryBean">
		<property name="jobClass"
			value="com.eayun.monitor.job.StatusCalculateJob"></property>
		<property name="durability" value="true"></property>
		<property name="jobDataAsMap">
			<map>
				<entry key="dbConfig" value="classpath:db.properties" />
				<entry key="htmlConfig" value="classpath:alarmmsg.html" />
			</map>
		</property>
	</bean>
	
	<bean id="statusCalculateTrigger"
		class="org.springframework.scheduling.quartz.CronTriggerFactoryBean">
		<property name="jobDetail" ref="statusCalculateJob"></property>
		<property name="cronExpression" value="0 0/1 * * * ? *"></property>
	</bean>

	<!-- 定时任务调度器 -->
	<bean class="com.eayun.common.job.EayunSchedulerFactoryBean" id="AlarmSchedulerFactory">
		<property name="dataSource">
			<ref bean="dataSource" />
		</property>
		<property name="applicationContextSchedulerContextKey" value="applicationContextKey" />
		<property name="configLocation" value="classpath:quartz.properties" />
		<property name="triggers">
			<list>
				<ref bean="statusCalculateTrigger" />
			</list>
		</property>
	</bean>
</beans>
```
在配置文件中，首先需要定义任务调度器`statusCalculateTrigger`，在trigger中定义`statusCalculateJob`和对应的调度频率——使用[cron表达式](https://en.wikipedia.org/wiki/Cron#CRON_expression)定义。
在每个Job中，首先定义一个线程池，然后设计好开线程的粒度，提交线程池管理，线程中执行功能操作。
```java
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class ChargeJob extends BaseQuartzJobBean{

    private static final Logger log = LoggerFactory.getLogger(ChargeJob.class);
    private CustomerService customerService;
    private ChargeRecordService chargeRecordService;
    private AccountOverviewService accountOverviewService;
    private EayunRabbitTemplate rabbitTemplate;
    private ChargeService chargeService;
    private MessageCenterService msgCenterService;
    private SysDataTreeService sysDataTreeService;
    private MongoTemplate mongoTemplate;

    @SuppressWarnings("rawtypes")
    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        log.info("后付费资源（除OBS外）计费计划任务开始");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH");
        //1.获取客户列表
        ApplicationContext applicationContext = getApplicationContext(context);
        customerService = applicationContext.getBean(CustomerService.class);
        chargeRecordService =  applicationContext.getBean(ChargeRecordService.class);
        accountOverviewService =  applicationContext.getBean(AccountOverviewService.class);
        rabbitTemplate = applicationContext.getBean(EayunRabbitTemplate.class);
        chargeService = applicationContext.getBean(ChargeService.class);
        msgCenterService = applicationContext.getBean(MessageCenterService.class);
        sysDataTreeService = applicationContext.getBean(SysDataTreeService.class);
        mongoTemplate = applicationContext.getBean(MongoTemplate.class);

        List<BaseCustomer> customerList = customerService.getAllCustomerList();
        //2.针对每个客户，起一个线程，执行客户的后付费资源计费任务
        Date currentTime = null;
        try {
            currentTime = format.parse(format.format(new Date()));
        } catch (ParseException e) {
            log.error("日期格式化失败", e);
        }
        List<Future> futureList = new ArrayList<>();
        for (BaseCustomer customer: customerList) {
            String cusId = customer.getCusId();
            ChargeThread thread = new ChargeThread(rabbitTemplate, accountOverviewService, 
		customerService, chargeRecordService, chargeService,
		msgCenterService,sysDataTreeService, mongoTemplate, cusId, currentTime);
            Future f = ChargeThreadPool.pool.submit(thread);
            futureList.add(f);
        }

        log.info(new Date() + "线程提交线程池完毕，开始监控异步任务完成情况");
        while(true){
            for(Future f: new ArrayList<>(futureList)){
                if(f.isDone()){
                    //isDone返回true的场景：正常结束、异常、线程被取消
                    futureList.remove(f);
                }
            }

            if(futureList.isEmpty()){
                break;
            }
            try {
                Thread.sleep(50);//sleep a while，give cpu a break
            } catch (InterruptedException e) {
                log.error("线程休眠50ms异常",e);
            }
        }
        log.info("后付费资源（除OBS外）计费计划任务结束");
    }
}

```

## 三、其他功能业务

### 云监控

云监控有三个主要功能模块：资源监控数据展示，基于监控数据、报警规则、制定报警对象的报警触发判断，和报警联系人/组的管理。

其中，资源监控数据来自于很多计划任务的统计。

报警触发的思路是针对报警对象所关联的报警规则和触发条件，讲触发条件落实到每个报警对象上，每分钟基于统计数据判断当前对象当前这一分钟是否满足触发条件，接着再按照触发条件中的持续时长，做最终的是否触发报警的判断。

### 对象存储

存储局域网(SAN)和网络附加存储(NAS)是我们比较熟悉的两种主流网络存储架构，而[对象存储(Object-based Storage)](https://en.wikipedia.org/wiki/Object_storage))是一种新的网络存储架构，基于对象存储技术的设备就是对象存储设备(Object-based Storage Device)简称OSD。

在OpenStack中对象存储的选择有Ceph和Swift两种，二者对比可以参考这篇博文[《Openstack 对象存储服务之争：Ceph或者Swift》](http://blog.csdn.net/cloudresearch/article/details/22752155)

### 资源统计

资源统计是对采集来的资源监控/用量数据进行查询展现，值得一提的是，这些采集来的数据存储在MongoDB中，且用到了[MongoDB的聚合操作（Aggregate）](https://docs.mongodb.com/manual/aggregation/)方法。

### 标签管理

类似微信的标签功能，ECSC平台的标签管理可以提供客户对资源打标签，方便进行管理查找标注等。有区分标签组和标签两个概念，因为操作频繁，所以结合[Redis](https://redis.io/)使用，分析出标签组和标签的对应关系，结合根据标签查资源和查看资源的标签业务要求，结合合理设计Key-Value，进行实现。

### 按需资源计费

本质也是个计划任务，只不过按需资源涉及很多类型，很多状态——正常、余额不足、欠费超保留时长被限制服务等等，所以业务上有一些复杂，设计了“计费清单”这个概念，来简化计费的处理。其中与各个资源的交互通过[RabbitMQ](http://www.rabbitmq.com/)，即消息队列进行。









