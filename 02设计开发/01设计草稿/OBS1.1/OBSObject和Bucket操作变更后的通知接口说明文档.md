## 概述

为了满足EOS的CDN需求，需要底层在操作Object和Bucket之后，调用EayunCloud提供的变更通知接口告知Cloud层面，由我们针对变更的Object和Bucket，去调用第三方CDN厂商，执行缓存文件清除等操作，以保证用户总能请求到最新的文件。

## 公共请求头

目前提供的接口，仅包含`POST`、`DELETE`两种请求方法，交互过程请求和响应均使用`JSON`。编码格式统一为`UTF-8`。下面仅描述了**必选的**公共请求头:

| Request Header | Description   | 
| -------------  | ------------- |
| Accept 		 | application/json |
| Authorization  | 授权信息，详见授权认证章节 |
| x-date     		 | 日期，用于标识请求时间及Authorization字段信息校验。<br/>格式需要符合RFC1123规范，如"Tue, 07 Jun 2016 10:00:31 GMT"      |
| Customer 		 | 客户ID，用于鉴权。|

## 错误信息及响应码描述

>Tips
>请求成功，Http状态码为200。但不表示所有操作实时执行完毕。

以下是请求接口的错误信息及响应描述：

| Keyword | Message | Description   | Http Status Code |
| -------------  | ------------- | --------------|---------|
| Unauthorized | Access is denied due to invalid credentials | 授权失败 | 401 |
| Unauthorized | No such customer id | 没有找到该客户导致的授权失败 | 401 |
| BadRequest | Invalid Date Period | 无效的日期时间，请求时间不能<br/>超过当前服务器时间前后30min| 400 |
| BadRequest | The bucket specified is invalid | 指定的bucket name无效| 400 |
| BadRequest | The objects array specified is invalid | 指定的objects数组无效| 400 |
| InternalServerError | Oops, we encountered an internal error. | 如果是程序内部异常等导致的内部错误，会给出这里描述的Message;<br/>如果不可控因素导致的服务器内部错误，则Message可能不同，请注意。| 500 |

比如填写不存在的customer id(user id)，则得到的响应如下：
```json
HTTP/1.1 401 Unauthorized
...
{
	"keyword": "Unauthorized",
    "message": "No such customer id"
}
```

## 授权认证

该接口，使用EayunCloud平台的`customerId`（即OBS底层存储的`userId`）、该用户的一对`AK`和`SK`及`RequestHeader`中`RFC1123`规范的Date，对用户的请求进行认证。

在请求头中，认证信息格式如下：
```
Authorization:Basic <auth password>
```

其中**`<auth password> = Base64(AK + ":" + HMAC-SHA1(Date,SK));`**。下面针对Linux和Java代码中生成认证信息分别做一下示例。我们这里使用的示例数据为：
* AK : 5BV7QK81S06Q2178P4SR
* SK : h9F7U0e7t8uzCJkC80VTtsUUrrWo244Kr34WC9nl
* customerId(userId) : 40289092523f1cd301523faab5910068

（一）在Linux中构造认证信息

一般在curl工具中，通过指定`-u AK:Signature`，在请求头中会自动生成`Authorization`信息。而这里的`Signature`生成需要以下步骤：

①获取日期
```shell
[root@localhost ~]# date -R -u | awk '{print $1" "$2" "$3" "$4" "$5" GMT"}'

返回：Tue, 07 Jun 2016 10:00:31 GMT
```

②计算得到`<Signature>`
```shell
[root@localhost ~]# echo -en "Tue, 07 Jun 2016 10:00:31 GMT" | openssl dgst -sha1 -hmac
 h9F7U0e7t8uzCJkC80VTtsUUrrWo244Kr34WC9nl -binary | openssl enc -base64

返回：c8ICOqp+mnAuyhG3Xy25UNY3vOE=
```

得到日期和Signature之后，就可以构造`-u AK:Signature`，记得在Header中写入`-H 'Customer: {customerId}'`等鉴权所需要的信息。

（二）在Java中构造认证信息

```java
String ak = "5BV7QK81S06Q2178P4SR";
String sk = "h9F7U0e7t8uzCJkC80VTtsUUrrWo244Kr34WC9nl";
String customerId = "40289092523f1cd301523faab5910068";

Date date = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
String RFC1123_DATE_STRING = sdf.format(date);

String signature = HmacSHA1Util.getEncrypt(RFC1123_DATE_STRING, sk);
String authStr = ak + ":" + signature;
String authPwd =  Base64.encodeBase64String(authStr.getBytes());

HttpPost post = new HttpPost(url);
post.setHeader("Accept", "application/json");
post.setHeader("Authorization", "Basic "+ authPwd);
post.setHeader("x-date", RFC1123_DATE_STRING);
post.setHeader("Customer", customerId);
...
```

## Object操作通知

### 描述

底层对Object进行操作变更后（上传、删除），需要调用该接口通知EayunCloud。

### 请求语法

```shell

curl -i --url http://xxx.xxx/api/v1/obs/notice
-X POST  
-u {AK}:{Signature}
-H 'Customer:{customerId}'
-H 'x-date: Tue, 07 Jun 2016 10:00:31 GMT'
-H 'Accept: application/json'
-d '
{
     "bucket":{bucketName}, //bucketName
     "objects":[
          {
               "type": "upload", //枚举项，表示对资源进行了上传或者删除操作：Enum<"upload", "delete">
               "object":"images/1.jpg" //这里是object的相对路径，即http://xxx.eos.eayun.com/images/1.jpg
          },
          {
               "type": "delete",
               "object":"the-do-over.mp4 "
          },
		  ...
     ]
}'
```
> Tips:
> 对于这里的AK和生成Signature的SK，需要是指定customer id的一对可用的AK和SK。


### 响应

参见[错误信息及响应码描述]()。

### 示例

客户`40289092523f1cd301523faab5910068`在Bucket`999`中删除了文件`123.jpg`。请求如下：

```shell

curl -i --url http://xxx.xxx/api/v1/obs/notice
-X POST  
-u 5BV7QK81S06Q2178P4SR:c8ICOqp+mnAuyhG3Xy25UNY3vOE=
-H 'Customer: 40289092523f1cd301523faab5910068'
-H 'x-date: Tue, 07 Jun 2016 10:00:31 GMT'
-H 'Accept: application/json'
-d '
{
     "bucket":"999",
     "objects":[
          {
               "type": "delete",
               "object":"123.jpg" 
          }
     ]
}'
```

提交成功，得到的响应如下：
```json
HTTP/1.1 200 OK
...
{
	"keyword": "Success",
    "message": "Task submitted successfully"
}
```

## Bucket操作通知

### 描述

底层对删除Bucket后，需要调用该接口通知EayunCloud。


### 请求语法

```shell
curl -i --url http://xxx.xxx/api/v1/obs/notice/{bucket_name}
-X DELETE
-u {AK}:{Signature}
-H 'Customer: {customerId}'
-H 'x-date: Tue, 07 Jun 2016 10:00:31 GMT'
-H 'Accept: application/json'
```

### 响应

参见[错误信息及响应码描述]()。

### 示例

客户`40289092523f1cd301523faab5910068`在删除了Bucket`999`，但是使用了平台上不存在的一对AK和SK（或随意指定的AK和SK）。请求如下：

```shell

curl -i --url http://xxx.xxx/api/v1/obs/notice/999
-X DELETE  
-u myAK:mySK
-H 'Customer: 40289092523f1cd301523faab5910068'
-H 'x-date: Tue, 07 Jun 2016 10:00:31 GMT'
-H 'Accept: application/json'
```

鉴权失败，得到的响应如下：
```json
HTTP/1.1 401 Unauthorized
...
{
	"keyword": "Unauthorized",
    "message": "Access is denied due to invalid credentials"
}
```

## 备注

目前接口并未完成，所以具体部署方式和接口地址待议。有疑问、建议和意见欢迎邮件沟通：[fan.zhang@eayun.com](mailTo:fan.zhang@eayun.com)






















