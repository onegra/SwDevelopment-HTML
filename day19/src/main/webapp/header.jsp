<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board2.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }"></c:set>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day19-board</title>
<style>
	h1 {
	text-align: center;
	}
	ul {
	display: flex; 
	list-style: none; 
	justify-content: space-around;
	margin: 20px auto;
	width: 900px;
	}
	h3 {
	display: flex;
	margin: 20px auto;
	width: 900px;
	justify-content: space-between;
	}
	table#boardList {
	border-collapse: collapse;
	border: 1px solid black;
	margin: 20px auto;
	width: 900px;
	}
	table#boardList  > thead {
	background-color: black;
	color: white;
	}
	table#boardList > tbody > tr {
	border-bottom: 1px solid gray;
	transition-duration: 1s;
	}
	table#boardList > tbody > tr:hover {
	background-color: lightpink;
	transition-duration: 1s;
	}
	table#boardList td,
	table#boardList th {
	padding: 10px;
	text-align: center;
	}
	table#boardList > thead > tr > th:nth-child(1) {width: 10%; }
	table#boardList > thead > tr > th:nth-child(2) {width: 50%; }
	table#boardList > thead > tr > th:nth-child(3) {width: 10%; }
	table#boardList > thead > tr > th:nth-child(4) {width: 10%; }
	table#boardList > thead > tr > th:nth-child(5) {width: 20%; }
	
	table#boardList > tbody > tr > th:nth-child(2) {text-align: left; }
	
	.sb {
	width: 900px;
	margin: 20px auto;
	display: flex;
	justify-content: space-between;
	}
	
	a {
	text-decoration: none;
	color: inherit;
	}
	
	a:hover {
	text-decoration: underline;
	}
	
	table#boardList a {
	display: inline-block;
	width: 90%;
	}
	table#boardList a:hover {
	text-decoration: none;
	}
	.id {
	margin: 20px auto; 
	width: 900px; 
	text-align: right
	}
	header, main {
	margin: 20px auto; 
	width: 900px; 
	}
</style>
</head>
<body>
<header>
	<h1><a href="${cpath }">1G</a></h1>
</header>
<nav>
	<c:if test="${empty login }"/>
	<form method="POST" action="login-action.jsp"></form>
	<ul>
		<li><a href="${cpath }/login.jsp">로그인</a></li>
		<li><a href="${cpath }/logout.jsp">로그아웃</a></li>
		<li><a href="${cpath }/join.jsp">회원가입</a></li>
	</ul>
</nav>
<div class="id">
		${login.userid }
</div>