<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
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


	File parent=new File(request.getServletContext().getRealPath("/")+"/UsersConfingure/965783535");

	parent.mkdirs();
	
	File file= new File(parent,"chathistory.txt");

	Boolean bl= file.createNewFile();
	
	System.out.print(file.exists());
	
	FileWriter fw=new FileWriter(file);
	
	fw.write("123");
	
	fw.flush();
	
	System.out.print(file.getAbsolutePath()+"\n");

%>
</body>
</html>
