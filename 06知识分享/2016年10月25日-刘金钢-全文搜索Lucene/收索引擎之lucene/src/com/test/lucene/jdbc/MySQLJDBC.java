package com.test.lucene.jdbc;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFrame;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class MySQLJDBC extends JFrame{

	public static final String url = "jdbc:mysql://127.0.0.1:3306/exam";  
    public static final String name = "com.mysql.jdbc.Driver";  
    public static final String user = "root";  
    public static final String password = "root";  
  
    public Connection conn = null;  
    public PreparedStatement pst = null;  
  
    public MySQLJDBC(String sql) {  
        try {  
            Class.forName(name);//指定连接类型  
            conn = (Connection) DriverManager.getConnection(url, user, password);//获取连接
            pst = (PreparedStatement) conn.prepareStatement(sql);//准备执行语句  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
  
    public void close() {  
        try {  
            this.conn.close();  
            this.pst.close();  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
    public static void main(String[] args) {  
        String sql = "select * from sys_manager";//SQL语句  
        MySQLJDBC db1 = new MySQLJDBC(sql);//创建DBHelper对象  
  
        try {  
        	ResultSet ret = db1.pst.executeQuery();//执行语句，得到结果集  
            while (ret.next()) {  
                String uid = ret.getString(1);  
                String ufname = ret.getString(2);  
                String ulname = ret.getString(3);  
                String udate = ret.getString(4);  
                System.out.println(uid + "\t" + ufname + "\t" + ulname + "\t" + udate );  
            }//显示数据  
            ret.close(); //关闭结果集 
            db1.close();//关闭连接  
        } catch (SQLException e) {  
            e.printStackTrace();  
        }  
    }  
}
