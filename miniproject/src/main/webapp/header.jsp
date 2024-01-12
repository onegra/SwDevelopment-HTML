<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="works" value="${WorksDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />
<c:set var="reply" value="${ReplyDAO.getInstance() }" />
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	html{
		margin: 0;
		padding: 0;
	}
	body{
		margin: 0;
		padding: 0;
	}
	.frame{
		width: 85%;
		margin: 0 auto;
	}
	.frame1{
		width: 100%;
		position: fixed;
		background-color: white;
	}
	.login{
		display: flex;
	}
	.sb{
		display: flex;
		justify-content: space-between;
	}
	.flex{
		display: flex;
	}
	.top{
		margin-top: 25px;
		margin-left: 15%;
	}
	a{
		text-decoration: none;
	}
	a:hover {
		cursor: pointer;
	}
	nav > .menu{
		display: flex;
	}
	ul{
		display: flex;
		list-style: none;
	}
	.login{
		padding-left: 330px;
	}
	.login > ul > li{
		flex: 1;
		width: 75px;
	}
	.login > ul > li > a{
		color: grey;
		font-weight: bold;
		font-size: 14px;
	}
	.logo > div.search{
		margin-left: 50px;
		border: 1px solid lightgrey;
		display: flex;
		align-items: center;
		width: 450px;
		height: 50px;
		border-radius: 50px;
	}
	.logo > div.search > form > input{
		margin-left: 10px;
		width: 390px;
		height: 20px;
		border: 0;
	}
	.logo > div.search > form > button{
		border: 0;
  		background-color: inherit;
  		cursor: pointer;
	}
	.navtop{
		padding-top: 80px;
		margin-left: 7.7%;
	}
	.menu ul{
		padding-left: 0;
	}
	.menu ul > li{
		flex: 1;
		white-space: nowrap;
		padding: 10px;
		border-bottom: 2px solid white;
	}
	.menu ul > li:hover{
		border-bottom: 2px solid #8e43e7;
	}
	.menu ul > li > a{
		font-size: 15px;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="frame1">
	<div class="top flex">
		<div class="logo flex">
			<a href="#"><img src="${cpath }/image/logo.svg"></a>
			<div class="search">
				<form>
					<input type="search" placeholder="검색">
					<button><img src="${cpath }/image/search.svg"></button>
				</form>
			</div>
		</div>
		<div class="login">
			<ul>
				<li><a href="${cpath }/login.jsp">로그인</a></li>
				<li><a href="${cpath }/join.jsp">회원가입</a></li>
				<li><a href="${cpath }/myPage.jsp">마이페이지</a></li>
			</ul>
		</div>
	</div>
</div>

<div class="frame">
	<nav class="navtop">
		<div class="menu">
			<div class="menu-left">
			<ul>
				<li><a href="#">뮤지컬</a></li>
				<li><a href="#">콘서트</a></li>
				<li><a href="#">연극</a></li>
				<li><a href="#">클래식/무용</a></li>
				<li><a href="#">스포츠</a></li>
				<li><a href="#">레저/캠핑</a></li>
				<li><a href="#">전시/행사</a></li>
				<li><a href="#">아동/가족</a></li>
				<li><a href="#">랭킹</a></li>
			</ul>
			</div>
		</div>
	</nav>
</div>

