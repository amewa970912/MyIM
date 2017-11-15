package com.zhangyue.servlet;

import java.io.FileWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/SendMessage")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
    	
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String message=request.getParameter("messagebox");
		
		String sendtime=request.getParameter("sendtime");
		
		String messagehistory=(String) request.getSession().getAttribute("messagehistory");
		
		if(messagehistory==null)
		{
			messagehistory="";
		}
		
		if(message!=null&&message!="") {
		
			messagehistory+=message+",";
		
		}
		
		FileWriter fW=new FileWriter("f:\\chatrecord.txt");
		
		fW.write(messagehistory);
		
		fW.flush();
		
		request.getSession().setAttribute("messagehistory", messagehistory);
		
		request.getRequestDispatcher("chatroom.jsp").forward(request, response);
		
	}
	
	
	

}
