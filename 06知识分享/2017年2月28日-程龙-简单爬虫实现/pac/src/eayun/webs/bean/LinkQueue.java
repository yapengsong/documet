package eayun.webs.bean;

import java.util.HashSet;
import java.util.Set;

public class LinkQueue {

	//已访问rul集合
	private static Set visitedUrl=new HashSet();
	//待访问的url集合
	private static QueryWebs unvisitedUrl=new QueryWebs() ;
	
	
	//获得URL队列
	public static QueryWebs getUnvisitedUrl(){
		return unvisitedUrl;
	}
	
	//添加到访问过的队列中
	public static void addVisitedUrl(String url){
		visitedUrl.add(url);
	}
	
	//移除访问队列
	
	public static void removeVisitedUrl(String url){
		visitedUrl.remove(url);
	}
	
	//未访问的队列出队列
	public static Object UnvisitedUrlDeQueue(){
		return unvisitedUrl.deQueue();
	}
	
	//保证每个url只被访问一次
	
	public static void addunvisitedUrl(String url){
		if(url!=null&&!url.trim().equals("")&&!visitedUrl.contains(url)&&!unvisitedUrl.contians(url)){
			unvisitedUrl.addQueue(url);
		}
	}
	
	//获取已经访问的url数目
	public static int getVisitedRulNum(){
		return visitedUrl.size();
	}
	
	//判断未访问的队列是否为空
	public static boolean unvisitedUrlIsEmpty(){
		return unvisitedUrl.empty();
	}
}
