package eayun.webs;

import java.util.HashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.filters.LinkStringFilter;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.filters.OrFilter;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import LinkFilter.LinkFilter;

/**
 * 抓取网页内容内的URL
 * 
 * */
public class HtmlParserTool {
	private static String patterns(String str){
		Pattern pattern=Pattern.compile("(http://|https://){1}[\\w\\.\\-/:]+");
		Matcher ma=pattern.matcher(str);
		if(ma.find()){
			return ma.group();
		}else
		return null;
	}

	//获取一个网站上的链接，filter用来过滤
	public static Set<String> extracLinks(String url,LinkFilter filter){
		
		Set<String> links=new HashSet<String>();
		
		try {
			Parser parser=new Parser(url);
			parser.setEncoding("UTF-8");
			NodeFilter frameFilter=new NodeFilter(){
				public boolean accept(Node node){
					if(node.getText().startsWith("frame src=")){
						return true;
					}else return false;
				}
			};
			
			
			
			
			//orFilter 来设置过滤<a> <frame>
			OrFilter linkFilter =new OrFilter(new NodeClassFilter(LinkTag.class),frameFilter);
			//得到所有经过过滤的标签
			NodeList list=parser.extractAllNodesThatMatch(linkFilter);
			
			for(int i=0 ;i<list.size();i++){
				Node tag=list.elementAt(i);
				if(tag instanceof LinkTag){
					LinkTag link=(LinkTag) tag;
					
					if(filter.accept(link.getText())){
						links.add(link.getLink());
					}else{//<frame>
						
						String frame=link.getText();
						String addurl=patterns(frame);//利用正则来获取url
						if(null!=addurl)
						links.add(addurl);

					}
				}
				
			}
			
		} catch (ParserException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return links;
	}
	
	

}
