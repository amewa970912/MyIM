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
		request.setAttribute("imgsrc", "image/bg.jpg");
	%>

	<img src="<%=request.getAttribute("imgsrc")%>" />
</body>
</html>


<%-- <div id="chatwindowcenter">

		<c:set var="messagehistory" value="${sessionScope.messagehistory}"></c:set>
		
		<c:if test="${messagehistory!=null}">   
		
		<br>
		
		<c:set var="splitmessage" value="${fn:split(messagehistory,',')}"></c:set>
		
		<c:forEach items="${splitmessage}" var="message">
		
			<img src="image/img1.jpg" class="newsimg">
			
			<span class="news"><c:out value="${message}"></c:out></span>
		
		<br>
		
		<br>
		
		<br>
		
		</c:forEach>
		
		</c:if>
		
		</div> --%>