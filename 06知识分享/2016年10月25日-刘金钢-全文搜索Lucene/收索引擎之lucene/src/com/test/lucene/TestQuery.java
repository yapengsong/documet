package com.test.lucene;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.InvalidTokenOffsetsException;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;

/**
 * 娴嬭瘯鏀剁储寮曟搸
 * @author liujingang
 *
 */
public class TestQuery {

	public static void main(String[] args) throws IOException {   
		TopDocs topdocs = null ;   
        String queryString = "武胜";   
        Query query = null ;   
        //IndexSearcher searcher = new IndexSearcher("F:\\jkb\\鏀剁储寮曟搸涔媗ucene\\word\\index");   
        Path path = Paths.get(System.getProperty("user.dir")+"\\word\\index");
        Directory dir = new SimpleFSDirectory(path);
        //IndexReader reader = IndexReader.open(FSDirectory.open(path), true);
        IndexReader reader = DirectoryReader.open(dir);
        IndexSearcher searcher = new IndexSearcher(reader);
        Analyzer analyzer = new StandardAnalyzer();   
        try {   
            QueryParser qp = new QueryParser("body", analyzer);   
            query = qp.parse(queryString);   
        } catch (org.apache.lucene.queryparser.classic.ParseException e){ 
        	e.printStackTrace();
        }   
        if(searcher != null ) {   
        	topdocs = searcher.search(query, Integer.MAX_VALUE);  
        	// 鐢ㄨ繖涓繘琛岄珮浜樉绀猴紝榛樿鏄�<b>..</b>  
            SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<span style=color:red>", "</span>");  
            // 鏋勯�犻珮浜�:鎸囧畾楂樹寒鐨勬牸寮�,鎸囧畾鏌ヨ璇勫垎  
            Highlighter highlighter = new Highlighter(simpleHTMLFormatter,new QueryScorer(query));
            highlighter.setTextFragmenter(new SimpleFragmenter(Integer.MAX_VALUE));
            // 鑾峰彇鍖归厤鍒扮殑缁撴灉闆�  
        	ScoreDoc[] scores = topdocs.scoreDocs;
            int length = scores.length;
            if(length > 0 ){   
                System.out.println(" 鎵惧埌: " + length + " 涓粨鏋�! " );  
                for(int i=0;i<length;i++){
                	Document doc = searcher.doc(scores[i].doc);
                	String connous = doc.getField("body").stringValue();  
                	String connous2=null;
                	try {
						connous2 = highlighter.getBestFragment(analyzer,"body", connous);
					} catch (InvalidTokenOffsetsException e) {
						//e.printStackTrace();
					}
                	if(connous2!=null)connous=connous2;
                	System.out.println("鍦細"+doc.getField("path").stringValue());
                	System.out.println("Name:"+doc.getField("name").stringValue());
                	System.out.println("鎵惧埌鐨勭浉鍏冲唴瀹�:"+connous);
                }
            }else{
            	System.out.println("娌℃湁鎵惧埌鎮ㄩ渶瑕佺殑缁撴灉锛�");
            }   
        }   
    }  
	
}
