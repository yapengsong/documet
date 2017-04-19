package com.test.lucene;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.SimpleFSDirectory;

/**
 * 把文档增加到索引里面去
 * @author liujingang
 *
 */
public class TextFileIndexer {

	public static void main(String[] args) throws Exception {   
        /***  指明要索引文件夹的位置 */   
        File fileDir = new File(System.getProperty("user.dir")+"\\word\\txt");   
  
        /***  这里放索引文件的位置  */   
        File indexDir = new File(System.getProperty("user.dir")+"/word/index"); //5.0后用java7新特性 Path
        /***  这里放索引文件的位置  */   
        Path path = Paths.get(System.getProperty("user.dir")+"\\word\\index");
        //创建Directory  
        Directory dir = new SimpleFSDirectory(path);
        //分词
        Analyzer luceneAnalyzer = new StandardAnalyzer();   
        IndexWriter indexWriter = new IndexWriter(dir, new IndexWriterConfig(luceneAnalyzer));   
        File[] textFiles = fileDir.listFiles();   
        long startTime = new Date().getTime();   
           
        // 增加document到索引去   
        for  ( int  i  =   0 ; i  < textFiles.length; i ++ )  {   
            if  (textFiles[i].isFile() &&  textFiles[i].getName().endsWith( ".txt" ))  {   
                System.out.println("File " + textFiles[i].getCanonicalPath() + "正在被索引." );   
                String temp =  FileReaderAll(textFiles[i].getCanonicalPath(), "GBK" );   
                System.out.println(temp);   
                Document document = new Document();   
                //Field FieldName = new Field( "name", textFiles[i].getName(), Field.Store.YES, Field.Index.NO); 4.0以前的写法
                Field FieldPath = new Field( "path", textFiles[i].getPath(), TextField.TYPE_STORED); //4.0以后的写法
                Field FieldName = new Field( "name", textFiles[i].getName(), TextField.TYPE_STORED); 
                Field FieldBody = new Field( "body", temp, TextField.TYPE_STORED);   
                
                document.add(FieldPath);   
                document.add(FieldBody);   
                document.add(FieldName);
                indexWriter.addDocument(document); //添加索引
                //indexWriter.updateDocument(new Term("name"), document);//修改索引
            }   
        }   
        // optimize()方法是对索引进行优化    5.0后取消了这个方法
        //indexWriter.optimize();   
        indexWriter.close();   //indexWriter
        dir.close();//关闭索引目录   
        dir = null;//销毁索引目录
        // 测试一下索引的时间   
        long endTime = new Date().getTime();   
        System.out.println(" 这花费了" + (endTime  -  startTime) + "  毫秒来把文档增加到索引里面去! " + fileDir.getPath());   
    }    
  
     public static String FileReaderAll(String FileName, String charset) throws  IOException  {   
        BufferedReader reader = new BufferedReader(new InputStreamReader( new FileInputStream(FileName), charset));   
        String line =  new String();   
        String temp =  new String();   
           
        while((line = reader.readLine()) != null){   
            temp +=  line;   
        }   
        reader.close();   
        return  temp;   
    }    
	
}
