package DownLoadFileWeb;

import java.util.Set;

import javax.swing.text.html.HTML;

import LinkFilter.LinkFilter;
import eayun.webs.HtmlParserTool;
import eayun.webs.bean.LinkQueue;

public class MyCrawler {
	
	/*
	 * 使用种子初始化队列
	 * */
	public void initCrawlerWithSeeds(String [] seeds){
		
		
		for(int i=0;i<seeds.length;i++){
			
			LinkQueue.addunvisitedUrl(seeds[i]);
		}
	}
	
	
	
	/**
	 * 抓取过程
	 * */

	public void crawlering(String [] seeds){
		LinkFilter linkfiter=new LinkFilter() {
			public Boolean accept(String url){
				if(url.startsWith("http://www.hao123.com/")){
					return true;
				}else return false;
			}
		};
		
		//初始化队列
		initCrawlerWithSeeds(seeds);
		//循环条件
		while(!LinkQueue.unvisitedUrlIsEmpty()){
		
			String visiturl=(String) LinkQueue.UnvisitedUrlDeQueue();
			if(visiturl==null)continue;
			
			DownLoacFile df=new DownLoacFile();
			System.out.println("开始请求:"+visiturl);
			try{
				df.downfile(visiturl);
				System.out.println("网页下载完成");
			}
			catch(Exception e){
				System.out.println("网页下载失败");
			}
			
		
			LinkQueue.addVisitedUrl(visiturl);
		
			Set<String> links=HtmlParserTool.extracLinks(visiturl, linkfiter);
			for(String link:links){
				LinkQueue.addunvisitedUrl(link);
			}
		
			
			
		}
		
	}
}
