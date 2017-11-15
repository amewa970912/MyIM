package com.zhangyue.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Test;

import com.zhangyue.utils.*;

public class testJbdcUtils {

	@Test
	public void test() {
		try {
			Connection connection=com.zhangyue.utils.JdbcUtils.getConnection();
			System.out.println(connection);	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
