<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>聊天室</title>
<style>
* {
	padding: 0;
	margin: 0;
	overflow-y: hidden;
}

.left {
	width: 60px;
	float: left;
	height: 800px;
	background: #12b7f5;
}

.headportrait {
	position: absolute;
	top: 12px;
	left: 30px;
	margin-left: -20px;
	height: 40px;
	width: 40px;
	border-radius: 20px;
}

.state {
	width: 10px;
	height: 10px;
	position: absolute;
	top: 62px;
	left: 30px;
	margin-left: -5px;
	border-radius: 5px;
	background: #79F22F;
}

.center {
	background: #F8F9FA;
	width: 420px;
	float: left;
}

.center #historylist {
	display: default;
}

.center #friendlist {
	display: none;
	width: 400px;
	margin-left: 10px;
	margin-right: 10px;
}

.center .top {
	width: 420px;
	height: 40px;
	background: #F8F9FA;
}

.center .search {
	margin-top: 12px;
	width: 400px;
	border-radius: 5px;
	background-color: #EEEFF3;
	position: absolute;
	left: 70px;
	z-index: 9999;
}

.center .search:hover {
	margin-top: 11px;
	left: 69px;
	border: #18bfed 1px solid;
	background-color: #FFFFFF;
}

.center .bgsearch {
	width: 30px;
	height: 30px;
	border: none;
	background: url(image/search.png) no-repeat center center;
	border-radius: 5px;
	background-color: #EEEFF3;
}

.center .inputsearch {
	width: 350px;
	height: 30px;
	border: none;
	background-color: #EEEFF3;
	border-radius: 5px;
	font-size: 14px;
	outline: none;
}

.center .chatlist {
	margin-top: 16px;
	height: 741px;
	overflow-y: auto;
	overflow-x: hidden;
}

.center .chatli {
	width: 420px;
	height: 58px;
}

.center .chatli:hover {
	background: #F1F5FA;
}

.center .chatli:last-child {
	margin-bottom: 8px;
}

.center .chatli img {
	width: 40px;
	height: 40px;
	background: #F8F9FB;
	float: left;
	margin-left: 7px;
	border-radius: 20px;
	margin-right: 11px;
	margin-top: 7px;
}

.center .chatli div {
	width: 362px;
	height: 57px;
	border-bottom: 1px solid #EAEAEA;
	float: left;
	vertical-align: middle;
}

.center .chatli div p {
	font-size: 13px;
	color: #c7c7c7;
}

.center .chatli div p:first-child {
	font-size: 16px;
	margin-top: 11px;
	color: #000000;
	font-weight: 1000;
}

.center .chatli div span {
	font-size: 11px;
	color: #c7c7c7;
	float: right;
	margin-top: -22px;
	margin-right: 16px;
	cursor: pointer;
}

.center .chatli p {
	cursor: pointer;
}

.right {
	background: white;
	width: 68%;
	max-width: 960px;
	float: left;
	height: 800px;
	background: url(image/messagelogo.png) no-repeat center center;
}

::-webkit-scrollbar {
	width: 12px;
	height: 12px;
}

::-webkit-scrollbar-track {
	background-color: #F2F2F2;
}

::-webkit-scrollbar-thumb {
	background-color: #C2C2C2;
}

#message {
	background: url(image/messagechecked.png);
	background-size: cover;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-top: 100px;
	margin-left: 16px;
}

#contacts {
	background: url(image/contacts.png);
	background-size: cover;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-top: 20px;
	margin-left: 16px;
}

#collections {
	background: url(image/collection.png);
	background-size: cover;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-top: 20px;
	margin-left: 16px;
}

.switch {
	position: absolute;
	width: 120px;
	height: 120px;
	background: white;
	z-index: 9999999;
	top: 80px;
	left: 10px;
	text-align: left;
	border-radius: 8px;
	border: 0.5px solid #C2C2C2;
	visibility: hidden;
	user-select: none;
}

.switch ul li {
	border: none;
	height: 40px;
	background: white;
	text-align: left;
	outline: none;
	font-size: 16px;
	padding-left: 16px;
	cursor: default;
	line-height: 40px;
}

.switch ul li:hover {
	background: #f1f5fa;
}

.switch ul span {
	background: #f0a626;
	width: 10px;
	height: 10px;
	border-radius: 5px;
	float: left;
	margin-left: 16px;
	margin-top: 15px;
	position: absolute;
}

.switch ul div:hover {
	background: #f1f5fa;
}

#hidden {
	padding-left: 36px;
}

#triglang {
	width: 0;
	height: 0;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-bottom: 6px solid white;
	position: absolute;
	top: 75px;
	left: 32px;
	visibility: hidden;
}

.chatwindow {
	width: 968px;
	height: 800px;
	position: absolute;
	top: 0px;
	left: 480px;
}

.chatwindow #chatwindowtop {
	width: 968px;
	height: 40px;
	background: #e9eef4;
}

.chatwindow #chatwindowcenter {
	width: 968px;
	height: 560px;
	background: #e9eef4;
	overflow-y: scroll;
}

.chatwindow #chatwindowbottominputbar {
	width: 968px;
	height: 40px;
	background: #e9eef4;
	border-top: 0.5px solid #d1d6db;
}

.chatwindow #chatwindowtop img {
	width: 24px;
	height: 24px;
	border: none;
	outline: none;
	margin-left: 10px;
	margin-top: 8px;
	background-image: url(image/return.png) no-repeat center center cover;
	float: left;
}

.chatwindow #chatwindowtop span {
	height: 40px;
	font-size: 18px;
	display: inline-block;
	float: left;
	margin-top: 8px;
	margin-left: 10px;
}

.chatwindow #chatwindowtop .icontype1 {
	width: 24px;
	height: 24px;
	position: absolute;
	right: 80px;
}

.chatwindow #chatwindowtop .icontype2 {
	width: 24px;
	height: 24px;
	position: absolute;
	right: 47px;
}

.chatwindow #chatwindowtop .icontype3 {
	width: 24px;
	height: 24px;
	position: absolute;
	right: 15px;
}

.chatwindow textarea {
	resize: none;
	outline: none;
	font-size: 16px;
	height: 110px;
	width: 946px;
	border: none;
	overflow-y: scroll;
	margin-left: 10px;
	margin-right: 10px;
	background: #e9eef4;
}

.chatwindow input[type="submit"] {
	border: none;
	color: white;
	background: #18b4ed;
	width: 60px;
	height: 30px;
	text-align: center;
	border-radius: 4px;
	float: right;
	margin: 0 auto;
	margin-right: 10px;
}

.chatwindow #chatwindowbottominputbar #expression {
	background: url(image/expression.png) no-repeat center center;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-left: 10px;
	margin-top: 6px;
}

.chatwindow #chatwindowbottominputbar #photoimg {
	background: url(image/photo.png) no-repeat center center;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-top: 6px;
	margin-left: 5px;
}

.chatwindow #chatwindowbottominputbar #folder {
	background: url(image/folder.png) no-repeat center center;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-top: 6px;
	margin-left: 5px;
}

.chatwindow #chatwindowbottominputbar #voice {
	background: url(image/voice.png) no-repeat center center;
	width: 28px;
	height: 28px;
	border: none;
	outline: none;
	margin-top: 6px;
}

.chatwindow #chatwindowbottom {
	background: #e9eef4;
	height: 210px;
}

.chatwindow #chatwindowcenter .news {
	display: inline;
	height: 32px;
	border-radius: 6px;
	background-color: #12b7f5;
	line-height: 32px;
	padding: 0px 5px;
	color: white;
	float: right;
}

.chatwindow #chatwindowcenter .newsimg {
	height: 32px;
	width: 32px;
	border-radius: 16px;
	background-image: url(image/img1.jpg) center center;
	float: right;
	margin-left: 10px;
	margin-right: 20px;
}

.center #friendlist {
	height: 741px;
	background-color: #F8F9FA;
	display: none;
	overflow: auto;
}

.center #friendlist .sublitems {
	margin-top: 6px;
	padding-left: 8px;
	border-bottom: 1px solid #EAEAEA;
	font-size: 16px;
	user-select: none;
	background-color: #F8F9FA;
}

.center #adddiv {
	margin-top: 12px;
}

.center #friendlist .sublitems img {
	width: 24px;
	height: 24px;
	margin: 12px 0px;
}

.center #friendlist .sublitems span {
	display: block;
	line-height: 48px;
	height: 48px;
	display: inline-block;
	cursor: default;
	width: 350px;
}

.center #friendlist #grouplitems .sublitems:first-child {
	border-bottom: none;
	margin-bottom: -8px;
}

.center #friendlist #friendlitems .sublitems {
	border-bottom: none;
	margin-bottom: -8px;
	overflow: visible;
}

.center ul li {
	padding-top: 5px;
	padding-bottom: 5px;
	margin-bottom: 5px;
	font-size: 16px;
	color: black;
	user-select: none;
	cursor: default;
}

.center ul li span {
	height: 40px;
	line-height: 40px;
	margin-left: 10px;
	border-bottom: 1px solid #e9eef4;
}

ul li img {
	width: 32px !important;
	height: 32px !important;
	margin: 4px 0px !important;
	float: left;
	overflow: visible;
}

#discussiongroup span {
	border-bottom: 1px solid #e9eef4;
}

#discussiongroup li:last-child span {
	border-bottom: none;
}

#device li img {
	width: 24px !important;
	height: 24px !important;
	margin-top: 12px !important;
}

#group li img {
	border-radius: 16px !important;
}

#discussiongroup li img {
	border-radius: 16px !important;
}

#friends li img {
	border-radius: 16px !important;
}

#personalspace {
	height: 800px;
	position: absolute;
	margin-left: 60px;
	background-color: #F1F5FA;
	visibility: hidden;
}

#personalspace span {
	display: inline-block;
	margin-top: 10px;
	margin-left: 15px;
	font-size: 18px;
}

#personalspace img {
	margin-top: 10px;
	float: right;
	margin-right: 5px;
	width: 28px;
	height: 28px;
}

#personalspace img:nth-child(2) {
	margin-right: 15px !important;
}

#personalspace .space {
	width: 480px;
	margin: 0 auto;
	background-color: white;
	margin-top: 20px;
	border: 2px #Ebeff4 solid;
}

#personalspace .space img {
	width: 32px;
	height: 32px;
	border-radius: 16px;
	float: none;
	margin-left: 30px;
	margin-top: 20px;
	margin-bottom: 10px;
	margin-right: 10px;
	float: left;
}

#personalspace .space span {
	margin-left: 10px;
	margin-top: 12px;
	font-size: 18px;
	float: left;
}

#personalspace .space small {
	display: inline-block;
	font-size: 12px;
	color: #b2b2b2;
	margin-top: 38px;
	margin-left: -36px;
	margin-bottom: 10px;
}

#personalspace .space div span {
	margin-left: 30px;
	margin-right: 30px;
	font-size: 14px;
	margin-bottom: 10px;
}

#personalspace .space div .img1 {
	margin: 10px 30px 12px 30px;
	width: 420px;
	height: auto;
}

#personalspace .space div .browse {
	margin-top: 10px;
	width: 24px;
	height: 24px;
}

#personalspace .space div .browsertimes {
	font-size: 12px;
	margin-left: 0px;
	margin-top: 14px;
	color: #6d9fd1;
}

#personalspace .space div .fabulous {
	width: 24px;
	height: 24px;
	margin-top: 10px;
	float: right;
	margin-right: -24px;
}

#personalspace .space div .fabuloustimes {
	margin-top: 14px;
	font-size: 12px;
	color: #c8c8c8;
	float: right;
	margin-right: -10px;
}

#personalspace .space div .comment {
	width: 20px;
	height: 20px;
	margin-top: 12px;
	float: right;
	margin-right: -24px;
}

#personalspace .space div .commenttimes {
	margin-top: 14px;
	font-size: 12px;
	color: #c8c8c8;
	float: right;
}
</style>
<script type="text/javascript" src="script/jquery-1.8.3.min.js"></script>
</head>
<body>
	<div class="left">
		<img src="image/bg.jpg" class="headportrait" onClick="changestate1()"
			id="headimg">
		<div class="state" onClick="changstate2()" id="stateout"></div>
		<div id="triglang"></div>
		<div class="switch" id="switchdiv">
			<ul>
				<div onClick="switchoverstate()">
					<span id="statein"></span>
					<li id="hidden">隐身</li>
				</div>
				<li>我的资料</li>
				<li>切换和注销</li>
			</ul>
		</div>
		<button id="message" onClick="switchmessage()"></button>
		<button id="contacts" onClick="switchcontact()"></button>
		<button id="collections" onClick="switchcollection()"></button>
	</div>
	<div class="center">
		<div class="top">
			<div class="search" onMouseOver="searchover()"
				onMouseOut="searchout()">
				<input readonly class="bgsearch" id="bgsearch"
					onMouseOver="searchover()" onMouseOut="searchout()"><input
					type="text" class="inputsearch" name="search" id="inputsearch"
					onMouseOver="searchover()" onMouseOut="searchout()"
					placeholder="搜索" align="bottom">
			</div>
		</div>
		<div id="historylist">
			<div class="chatlist">
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img1.jpg">
					<div>
						<p>阿狸</p>
						<span>01:59</span>
						<p>在嘛?</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
				<div class="chatli">
					<img src="image/img2.jpg">
					<div>
						<p>龙猫</p>
						<span>01:59</span>
						<p>我是大龙猫。</p>
					</div>
				</div>
			</div>
		</div>
		<div id="friendlist">

			<div id="functionalitems" class="litems">

				<div class="sublitems" id="adddiv">

					<img src="image/addfriends.png"> <span>添加</span>

				</div>

			</div>

			<div id="grouplitems" class="litems">

				<div class="sublitems">

					<img src="image/triangle.png" onClick="visibleorhiddengroup()"
						id="groupimg"> <span onClick="visibleorhiddengroup()">群</span>

					<ul id="group">

						<li><img src="image/cno2g74w.jpg"><span>第一个</span></li>

						<li><img src="image/cno2g74w.jpg"><span>第二个</span></li>

					</ul>

				</div>

				<div class="sublitems">

					<img src="image/triangle.png"
						onClick="visibleorhiddendiscussiongroup()" id="discussiongroupimg">

					<span onClick="visibleorhiddendiscussiongroup()">讨论组</span>

					<ul id="discussiongroup">

						<li><img src="image/cno2g74w.jpg"><span>第一个</span></li>

						<li><img src="image/cno2g74w.jpg"><span>第二个</span></li>

					</ul>

				</div>


			</div>

			<div id="friendlitems" class="litems">

				<div class="sublitems">

					<img src="image/triangle.png" onClick="visibleorhiddendevice()"
						id="deviceimg"> <span onClick="visibleorhiddendevice()">我的设备</span>

					<ul id="device">

						<li><img src="image/computer.png"><span>我的电脑</span></li>

						<li><img src="image/iphone.png"><span>我的手机</span></li>
					</ul>

				</div>

				<div class="sublitems">

					<img src="image/triangle.png" onClick="visibleorhiddenfriends()"
						id="friendsimg"> <span onClick="visibleorhiddenfriends()">朋友</span>

					<ul id="friends">

						<li><img src="image/cno2g74w.jpg"><span>第一个</span></li>

						<li><img src="image/cno2g74w.jpg"><span>第二个</span></li>

					</ul>

				</div>


			</div>

		</div>
	</div>
	<div class="right"></div>
	<div class="chatwindow" id="chatwindow">

		<div id="chatwindowtop">

			<img src="image/return.png" onClick="hiddenchatwindow()"
				id="chatwindowimg"> <span>阿狸</span> <img src="image/mine.png"
				class="icontype3"> <img src="image/camera.png"
				class="icontype2"> <img src="image/phone.png"
				class="icontype1">

		</div>

		<div id="chatwindowcenter">

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

		</div>

		<div id="chatwindowbottom">

			<div id="chatwindowbottominputbar">

				<button id="expression"></button>

				<button id="photoimg"></button>

				<button id="folder"></button>

				<button id="voice"></button>

			</div>

			<div id="chatwindowbottominputarea">

				<form method="post" action="SendMessage">

					<textarea id="messagetextarea" name="messagebox"></textarea>

					<input type="submit" value="发送" id="sendform">

				</form>

			</div>

		</div>
	</div>

	<div id="personalspace">

		<span>好友动态</span> <img src="image/addfriends.png"> <img
			src="image/mine.png"> <img src="image/at.png">

		<div class="space">

			<img src="image/kwtn454m.jpg"> <span>阿狸</span> <small>今天
				23:12</small>

			<div>

				<span class="character">新的一天，新的开始！</span> <img src="image/timg1.jpg"
					class="img1"> <img src="image/browse.png" class="browse">

				<span class="browsertimes">浏览 234次</span> <span class="commenttimes"
					id="commenttimes">5</span> <img src="image/comment.png"
					class="comment"> <span class="fabuloustimes"
					id="fabuloustimes">5</span> <img src="image/fabulous.png"
					class="fabulous" onclick="switchfabulous()" id="fabulous">

			</div>

		</div>

	</div>
</body>
<script>

	message=document.getElementById("message");		

	message.style="background: url(image/messagechecked.png);background-size: cover;";	

	cwc=document.getElementById("chatwindowcenter");

	cwc.scrollTop = cwc.scrollHeight;  

	document.getElementById("messagetextarea").focus();	

	group=document.getElementById("group");

	group.style.cssText="display:none";

	friends=document.getElementById("friends");

	friends.style.cssText="display:none";

	discussiongroup=document.getElementById("discussiongroup");

	discussiongroup.style.cssText="display:none";

	device=document.getElementById("device");

	device.style.cssText="display:none";

	fabulous=document.getElementById("fabulous");

	isture="true";

	function switchfabulous()
	{

		fabulous=document.getElementById("fabulous");	

		fabuloustimes=document.getElementById("fabuloustimes");	

		fabuloustimesvalue=document.getElementById("fabuloustimes").innerHTML-0;	

		if (isture=="true") {

			fabulous.src="image/fabuloused.png";	

			isture="false";		

			fabuloustimes.innerHTML=fabuloustimesvalue+1;		

		}
		else{

			fabulous.src="image/fabulous.png";

			isture="true";

			fabuloustimes.innerHTML=fabuloustimesvalue-1;		
		}
		
	}

	function visibleorhiddengroup(){

		groupimg=document.getElementById("groupimg");

		group=document.getElementById("group");

		if(group.style.display!="none"){

			groupimg.src="image/triangle.png";

			group.style.cssText="display:none";

		}
		else
		{

			groupimg.src="image/intriangle.png";

			group.style.cssText="display:block";

		}

	}

	function visibleorhiddenfriends(){

		friends=document.getElementById("friends");

		friendsimg=document.getElementById("friendsimg");

		if(friends.style.display!="none"){

			friendsimg.src="image/triangle.png";

			friends.style.cssText="display:none";

		}
		else
		{

			friendsimg.src="image/intriangle.png";

			friends.style.cssText="display:block";

		}

	}

	function visibleorhiddendevice(){

		device=document.getElementById("device");

		deviceimg=document.getElementById("deviceimg");

		if(device.style.display!="none"){

			deviceimg.src="image/triangle.png";

			device.style.cssText="display:none";

		}
		else
		{

			deviceimg.src="image/intriangle.png";

			device.style.cssText="display:block";

		}

	}

	function visibleorhiddendiscussiongroup(){

		discussiongroup=document.getElementById("discussiongroup");

		discussiongroupimg=document.getElementById("discussiongroupimg");

		if(discussiongroup.style.display!="none"){

			discussiongroupimg.src="image/triangle.png";

			discussiongroup.style.cssText="display:none";

		}
		else
		{

			discussiongroupimg.src="image/intriangle.png";

			discussiongroup.style.cssText="display:block";

		}

	}

	document.onkeydown=function(e){

		if(e.keyCode==13)
		{

			document.getElementById("sendform").click();

		}

	}

	$(".chatli").click(function(){

		document.getElementById("chatwindow").style.visibility="visible";

	} 
	)

	$("#friends li").click(function(){

		alert(this.innerHTML);

		document.getElementById("chatwindow").style.visibility="visible";

	} 
	)

	function searchover()
	{

		document.getElementById("bgsearch").style="background-color: #FFFFFF;";

		document.getElementById("inputsearch").style="background-color: #FFFFFF;";

	}

	function searchout()
	{
		document.getElementById("bgsearch").style="background-color: #EEEFF3;";

		document.getElementById("inputsearch").style="background-color: #EEEFF3;";
	}

	function switchmessage()
	{
		message=document.getElementById("message");

		if(message.style.backgroundImage!='url("image/messagechecked.png")'){

			message.style="background: url(image/messagechecked.png);background-size: cover;";

			contacts=document.getElementById("contacts");	

			if(contacts.style.backgroundImage=='url("image/contactschecked.png")'){					

				contacts.style="background: url(image/contacts.png);background-size: cover;";

			}				

			collections=document.getElementById("collections");				

			if(collections.style.backgroundImage=='url("image/collectionchecked.png")'){


				collections.style="background: url(image/collection.png);background-size: cover;";			

			}

		}

		document.getElementById("friendlist").style.visibility="hidden";

		document.getElementById("historylist").style.display="block";

		document.getElementById("historylist").style.visibility="visible";

		document.getElementById("personalspace").style.cssText="visibility:hidden";

	}

	function switchcontact()
	{

		contacts=document.getElementById("contacts");

		if(contacts.style.backgroundImage!='url("image/contactschecked.png")'){

			contacts.style="background: url(image/contactschecked.png);background-size: cover;";

			message=document.getElementById("message");

			if(message.style.backgroundImage=='url("image/messagechecked.png")')
			{

				message.style="background: url(image/message.png);background-size: cover;";

			}

			collections=document.getElementById("collections");

			if(collections.style.backgroundImage=='url("image/collectionchecked.png")'){

				collections.style="background: url(image/collection.png);background-size: cover;";	

			}

		}

		document.getElementById("historylist").style.visibility="hidden";

		document.getElementById("historylist").style.display="none";

		document.getElementById("friendlist").style.display="block";

		document.getElementById("friendlist").style.visibility="visible";

		document.getElementById("personalspace").style.cssText="visibility:hidden";

	}

	function switchcollection()
	{

		collections=document.getElementById("collections");

		if(collections.style.backgroundImage!='url("image/collectionchecked.png")'){

			collections.style="background: url(image/collectionchecked.png);background-size: cover;";

			contacts=document.getElementById("contacts");	

			if(contacts.style.backgroundImage=='url("image/contactschecked.png")'){

				contacts.style="background: url(image/contacts.png);background-size: cover;";

			}

			message=document.getElementById("message");

			if(message.style.backgroundImage=='url("image/messagechecked.png")')
			{

				message.style="background: url(image/message.png);background-size: cover;";

			}
		}

		document.getElementById("personalspace").style.cssText="z-index:99999;visibility:visible";

		$("#personalspace").width($(document).width()-60);

	}

	function changestate1()
	{
		headimg=document.getElementById("headimg");

		triglang=document.getElementById("triglang");

		headimg.style="width:38px;height:38px;margin-left: -19px;top:13px;";

		setTimeout(function(){headimg.style="width:40px;height:40px;margin-left: -20px;top:12px;";},40);	

		switchdiv=document.getElementById("switchdiv");

		if(switchdiv.style.visibility!="visible"){

			switchdiv.style="visibility: visible;"

			triglang.style="visibility:visible;";

		}
		else
		{
			switchdiv.style="visibility: hidden;"
			triglang.style="visibility:hidden;"
		}

	}

	function changstate2()
	{

		switchdiv=document.getElementById("switchdiv");

		triglang=document.getElementById("triglang");

		if(switchdiv.style.visibility!="visible"){

			switchdiv.style="visibility: visible;"

			triglang.style="visibility: visible;";

		}
		else
		{
			switchdiv.style="visibility: hidden;";

			triglang.style="visibility: hidden;";
		}

	}	

	function switchoverstate()
	{

		stateout=document.getElementById("stateout");

		statein=document.getElementById("statein");

		hidden=document.getElementById("hidden");

		if(hidden.innerHTML=="在线")
		{

			stateout.style="background:#79f22f;";

			statein.style="background:#f0a626;";

			hidden.innerHTML="隐身";

		}
		else
		{

			stateout.style="background:#f0a626;";

			statein.style="background:#79f22f;";

			hidden.innerHTML="在线";

		}

	}	

	function hiddenchatwindow()
	{

		chatwindow=document.getElementById("chatwindow");

		chatwindow.style="visibility:hidden;";

	}
</script>
</html>