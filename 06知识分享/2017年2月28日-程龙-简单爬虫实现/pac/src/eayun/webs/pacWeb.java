package eayun.webs;




import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;



public class pacWeb {
	
	/*
	 * 爬虫请求
	 * */
	public String getpacWebs(){
		
		HttpClient http=new HttpClient();
		GetMethod	postmethod=new GetMethod("http://www.eayun.com/");
		NameValuePair[] postdata=new NameValuePair[2];
		postdata[0]=new NameValuePair("武器","枪");
		postdata[1]=new NameValuePair("什么枪","玩具枪");
		postmethod.setQueryString(postdata);
		try {
			int code=http.executeMethod(postmethod);
			
			if(code==200){
				System.out.println(postmethod.getResponseBodyAsStream());//获取到输入流
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	
	
	
}
