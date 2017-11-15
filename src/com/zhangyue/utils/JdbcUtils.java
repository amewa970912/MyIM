package com.zhangyue.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	
	public void releaseConnection(Connection conn) {
		
		if(conn!=null)
			
			try {
				
				conn.close();
				
			} catch (Exception e) {
				
				e.printStackTrace();
				
			}		
	}

	
	private static DataSource dataSource =null;
	
	static {
		
		dataSource=new ComboPooledDataSource("chatroom");
		
	}
	
	public static Connection getConnection() throws SQLException {
		
		return dataSource.getConnection();
		
	}
	

}
