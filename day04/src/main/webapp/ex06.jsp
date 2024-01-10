<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>ex06 대문 페이지</h1>
<hr>
<%
	MemberDTO login = (MemberDTO) session.getAttribute("login");
	String welcome = String.format("안녕~ %s !!",login ==null ? "친구" :login.getName());
%>
<div>
	<img src="<%=login.getImgPath() %>" height= "300">	
</div>
<h3><%=welcome %></h3>

<a href="ex.form.jsp"> <button>로그인</button> </a>
</body>
</html>