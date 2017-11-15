package com.zhangyue.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.zhangyue.utils.JdbcUtils;

public class DAO {

	public Connection connection = null;

	public DAO() {

		try {

			connection = JdbcUtils.getConnection();

		} catch (SQLException e) {

			e.printStackTrace();

		}

	}

	public ResultSet selectInfo(String IMNumber,String IMPasswd) {

		String sql = "select * from imusers where imID=? and imPW=?";

		ResultSet rs = null;

		try {

			PreparedStatement ps = connection.prepareStatement(sql);

			ps.setInt(1, Integer.parseInt(IMNumber));
			
			ps.setString(2, IMPasswd);

			rs = ps.executeQuery();

		} catch (SQLException e) {

			e.printStackTrace();

		}

		return rs;

	}

	public void updateInfo(String IMNumber) {

	}

	public void deleteInfo(String IMNumber) {

	}

	public void insertInfo(String IMNumber) {

	}
}
