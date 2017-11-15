package com.zhangyue.action;

import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.zhangyue.dao.DAO;

import freemarker.template.utility.Execute;

public class LoginAction {

	public String execute() throws Exception {

		DAO dao = new DAO();

		HttpServletRequest request = (HttpServletRequest) ServletActionContext.getContext().get(StrutsStatics.HTTP_REQUEST);

		String username = request.getParameter("username");

		String password = request.getParameter("password");

		ResultSet rs = dao.selectInfo(username, password);	
		
		if (rs!=null&&rs.next()) {

			return "success";

		} else {

			return "error";

		}
	}

}
