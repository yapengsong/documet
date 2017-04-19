package DownLoadFileWeb;

import java.io.DataOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.apache.commons.io.IOUtils;





public class DownLoacFile {
	//根据URl和类型生成需要保存的网页的文件名，去除非文件名的字符
	
	public String getFileNameByUrl(String url,String type){
		
		//移除http:
		url=url.substring(7);
		//text/html类型
		if(type.indexOf("html")!=-1){
			url=url.replaceAll("[\\?//:*|<>\"]", "_")+".html";
			return url;
		}else //applicat/pdf
			return url.replaceAll("[\\?//:*|<>\"]", "_")+"."+type.substring(type.lastIndexOf("/")+1);
	}

	//保存网页字节数组到本地文件
	private void saveToLocal(byte[] data,String path){
		DataOutputStream out=null;
		try {
			String str="D:\\web\\temp\\";
			File file=new File(str+path);
			file.createNewFile();
			 out=new DataOutputStream(new FileOutputStream(file));
			for(int i=0;i<data.length;i++){
				out.write(data[i]);
			}
			out.flush();
			out.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	//下载url指向的网页
	public String downfile(String url){
		String filepath=null;
		HttpClient httpct=new HttpClient();
		httpct.getHttpConnectionManager().getParams().setConnectionTimeout(5000);
		GetMethod get=new GetMethod(url);
		get.getParams().setParameter(HttpMethodParams.RETRY_HANDLER, new DefaultHttpMethodRetryHandler());
		try {
			
			int statusCode=httpct.executeMethod(get);
			if(statusCode!=HttpStatus.SC_OK){
				System.out.println("请求返回失败："+get.getStatusLine());
				filepath =null;
			}
			
			byte[] responseBody=IOUtils.toByteArray(get.getResponseBodyAsStream());//读取字节数组
			String type=get.getResponseHeader("Content-Type").toString();
			System.out.println(type);
			//根据网页url生成文件名
			filepath=getFileNameByUrl(url, type);
			saveToLocal(responseBody, filepath);
		} catch (HttpException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			get.releaseConnection();
		}
		return filepath;
	}
	
}
