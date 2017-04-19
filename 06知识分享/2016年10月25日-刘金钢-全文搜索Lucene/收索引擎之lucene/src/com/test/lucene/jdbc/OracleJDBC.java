package com.test.lucene.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleJDBC {

	// orcl为oracle数据库中的数据库名，localhost表示连接本机的oracle数据库
	// 1521为连接的端口号
	private static String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	// system为登陆oracle数据库的用户名
	private static String user = "system";
	// manager为用户名system的密码
	private static String password = "manager";
	public static Connection conn;
	public static PreparedStatement ps;
	public static ResultSet rs;
	public static Statement st;

	// 连接数据库的方法
	public void getConnection() {
		try {
			// 初始化驱动包
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 根据数据库连接字符，名称，密码给conn赋值
			conn = DriverManager.getConnection(url, user, password);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// 测试能否与oracle数据库连接成功
	public static void main(String[] args) {
		OracleJDBC basedao = new OracleJDBC();
		basedao.getConnection();
		if (conn == null) {
			System.out.println("与oracle数据库连接失败！");
			//insert();   //插入添加记录     
	        //update();   //更新记录数据     
	        //delete();   //删除记录     
	        query();    //查询记录并显示  
		} else {
			System.out.println("与oracle数据库连接成功！");
		}
	}
	
	/* 插入数据记录，并输出插入的数据记录数*/    
    public static void insert() {    
            
        //conn = getConnection(); // 首先要获取连接，即连接到数据库     
    
        try {    
            String sql = "INSERT INTO staff(name, age, sex,address, depart, worklen,wage)"    
                    + " VALUES ('Tom1', 32, 'M', 'china','Personnel','3','3000')";  // 插入数据的sql语句     
                
            st = (Statement) conn.createStatement();    // 创建用于执行静态sql语句的Statement对象     
                
            int count = st.executeUpdate(sql);  // 执行插入操作的sql语句，并返回插入数据的个数     
                
            System.out.println("向staff表中插入 " + count + " 条数据"); //输出插入操作的处理结果     
                
            conn.close();   //关闭数据库连接     
                
        } catch (SQLException e) {    
            System.out.println("插入数据失败" + e.getMessage());    
        }    
    }    
        
    /* 更新符合要求的记录，并返回更新的记录数目*/    
    public static void update() {    
        //conn = getConnection(); //同样先要获取连接，即连接到数据库     
        try {    
            String sql = "update staff set wage='2200' where name = 'lucy'";// 更新数据的sql语句     
                
            st = (Statement) conn.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量     
                
            int count = st.executeUpdate(sql);// 执行更新操作的sql语句，返回更新数据的个数     
                
            System.out.println("staff表中更新 " + count + " 条数据");      //输出更新操作的处理结果     
                
            conn.close();   //关闭数据库连接     
                
        } catch (SQLException e) {    
            System.out.println("更新数据失败");    
        }    
    }    
    
    /* 查询数据库，输出符合要求的记录的情况*/    
    public static void query() {    
            
        //conn = getConnection(); //同样先要获取连接，即连接到数据库     
        try {    
            String sql = "select * from staff";     // 查询数据的sql语句     
            st = (Statement) conn.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量     
                
            ResultSet rs = st.executeQuery(sql);    //执行sql查询语句，返回查询数据的结果集     
            System.out.println("最后的查询结果为：");    
            while (rs.next()) { // 判断是否还有下一个数据     
                    
                // 根据字段名获取相应的值     
                String name = rs.getString("name");    
                int age = rs.getInt("age");    
                String sex = rs.getString("sex");    
                String address = rs.getString("address");    
                String depart = rs.getString("depart");    
                String worklen = rs.getString("worklen");    
                String wage = rs.getString("wage");    
                    
                //输出查到的记录的各个字段的值     
                System.out.println(name + " " + age + " " + sex + " " + address    
                        + " " + depart + " " + worklen + " " + wage);    
                
            }    
            conn.close();   //关闭数据库连接     
                
        } catch (SQLException e) {    
            System.out.println("查询数据失败");    
        }    
    }    
    
    /* 删除符合要求的记录，输出情况*/    
    public static void delete() {    
    
        //conn = getConnection(); //同样先要获取连接，即连接到数据库     
        try {    
            String sql = "delete from staff  where name = 'lili'";// 删除数据的sql语句     
            st = (Statement) conn.createStatement();    //创建用于执行静态sql语句的Statement对象，st属局部变量     
                
            int count = st.executeUpdate(sql);// 执行sql删除语句，返回删除数据的数量     
                
            System.out.println("staff表中删除 " + count + " 条数据\n");    //输出删除操作的处理结果     
                
            conn.close();   //关闭数据库连接     
                
        } catch (SQLException e) {    
            System.out.println("删除数据失败");    
        }    
            
    }    
    
    
}
