<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>登陆</title>
<style>
	
	*{
		
		margin: 0;
		padding: 0;
	}
	
	body{
		
		background: url(image/register.jpg);
		background-attachment: fixed;
		background-repeat: no-repeat;
		background-size: cover;
		
	}
	
	.register{
		
		height: 90px;
		
		width: 100%;
		
		top: 42%;
		
		position: absolute;		
		
		z-index: 999;
		
		
	}
	
	.register .registerinput{		
		
		width: 500px;
		height:90px;			
		border-radius: 3px;
		margin:0 auto;
		
	}
	
	.register .registerinput input[name="password"]{
		
		border: none;
		width: 286px;
		height: 45px;
		outline: none;
		padding-left: 14px;		
		border-bottom-left-radius: 3px;
		border-bottom-right-radius: 3px;
		font-size: 16px;
	}
	
	.register .registerinput input[name="username"]{
		
		border: none;
		width: 286px;
		height: 44px;
		outline: none;
		padding-left: 14px;
		border-bottom: 1px solid #e9e9e9;
		border-top-left-radius: 3px;
		border-top-right-radius: 3px;
		font-size: 16px;		
	}	
	
	.register .headportrait{		
		
		position: absolute;		
		
		margin-top: 2px;
		
		margin-right: 80px;
		
		width: 86px;
		
		height: 86px;		
		
	
	}
	
	.register .loginimg{
		
		position: absolute;
		
		top:0px;
		
		left: 50%;
		
		margin-left: 170px;
		
		margin-top: 17px;
		
		z-index: 1000;
		
		cursor: pointer;
		
		background: url(image/nextstep.png);
		
		background-repeat: no-repeat;
		
		background-size: cover;
		
		width: 56px;
		
		height: 56px;	
		
		border: none;
		
		outline: none;
	}
	
	.registerdiv{
		
		background: white;
		
		width: 300px;
		
		height: 90px;
		
		margin: 0 auto;
		
		border-radius: 5px;
	}
	
	.registerbottom{		
		
		
		position: absolute;
		
		bottom: 90px;
		
		text-align: center;
		
		width: 140px;
		
		left: 50%;
		
		margin-left: -70px;
		
	}
	
	.registerbottom span{
		
		
		width: 60px;
		
		color: #87d6f4;
		
		cursor: pointer;
	}
	
	.registerbottom span:first-child{
		
		margin-right: 20px;
		
	}

	</style>
</head>
<%


%>
<body>
<div class="register">
<div  class="registerinput">
<form method="post" action="<%=request.getServletContext().getContextPath()%>/defalut_1/login">
	<img src="image/headportrait.png" class="headportrait">
	<div class="registerdiv">
	<input type="text" name="username" autocomplete="off" placeholder="账号">	
	<input type="password" name="password" placeholder="密码">
	</div>
	<input type="submit"  class="loginimg" id="nextstep" value=" ">
</form>
</div>
</div>
<div class="registerbottom">
	<span>无法登陆</span>
	<span>新用户</span>
</div>
</body>
</html>