<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.xml.soap.Node"%>
<%@page import="org.w3c.dom.NodeList"%>
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
		DocumentBuilder db = DocumentBuilderFactory.newInstance().newDocumentBuilder();

		Document dm = db.parse(
				request.getServletContext().getResourceAsStream("/UsersConfingure/965783535/965783535config.xml"));

		dm.normalize();

		NodeList imIdnodeList = dm.getElementsByTagName("imId");

		String imIdValue = imIdnodeList.item(0).getFirstChild().getNodeValue();

		NodeList imSexnodeList = dm.getElementsByTagName("imSex");

		String imSexValue = imSexnodeList.item(0).getFirstChild().getNodeValue();

		NodeList imNickNamenodeList = dm.getElementsByTagName("imNickName");

		String imNickNameValue = imNickNamenodeList.item(0).getFirstChild().getNodeValue();

		NodeList imVipnodeList = dm.getElementsByTagName("imVip");

		String imVipValue = imVipnodeList.item(0).getFirstChild().getNodeValue();

		NodeList imBuddyListnodeList = dm.getElementsByTagName("imBuddyList");

		String imBuddyListValue = imBuddyListnodeList.item(0).getFirstChild().getNodeValue();

		NodeList imHeadPortraitnodeList = dm.getElementsByTagName("imHeadPortrait");

		String imHeadPortraitValue = imHeadPortraitnodeList.item(0).getFirstChild().getNodeValue();

		NodeList imChatHistorynodeList = dm.getElementsByTagName("imChatHistory");

		String imChatHistoryValue = imChatHistorynodeList.item(0).getFirstChild().getNodeValue();
	%>
	<center>
	
		
	
		<h3>账号信息</h3>
		<small>ID:</small>
		<%
			out.print(imIdValue);
		%>
		<br> <br> <small>Sex:</small>
		<%
			out.print(imSexValue);
		%>
		<br> <br> <small>NickName:</small>
		<%
			out.print(imNickNameValue);
		%>
		<br> <br> <small>VipValue:</small>
		<%
			out.print(imVipValue);
		%>
		<br> <br> <small>BuddyListValue:</small>
		<%
			out.print(imBuddyListValue);
		%>
		<br> <br> <small>HeadPortraitValue:</small>
		<%
			out.print(imHeadPortraitValue);
		%>

		<br> <br> <small>ChatHistoryValue:</small>
		<%
			out.print(imChatHistoryValue);
		%>
		<br> <br>
		<img src="<%=request.getServletContext().getContextPath()+"/"+imHeadPortraitValue %>">
		<br> <br>
		
	</center>
</body>
</html>