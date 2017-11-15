<%@page import="org.w3c.dom.Document"%>
<%@page import="java.io.File"%>
<%@page import="javax.xml.parsers.DocumentBuilderFactory"%>
<%@page import="javax.xml.parsers.DocumentBuilder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%


	DocumentBuilder db=DocumentBuilderFactory.newInstance().newDocumentBuilder();

	String xmlPath="/UsersConfingure/965783535/965783535confing.xml";
	
	Document dm=db.parse(request.getServletContext().getResourceAsStream(xmlPath));
	
	System.out.print("123");
	




%>

</body>
</html>