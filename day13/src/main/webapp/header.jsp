<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {
	border: 1px solid black;
	border-collapse: collapse;
	width: 100%
	}
	tr{
	border-bottom: 1px solid black;
	}
	th, td {
	padding: 10px;
	}
</style>
</head>
<body>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<c:set var="dto" value=""/>
<div>
	<a href="login.jsp">로그인</a>
	<a href="join.jsp">회원가입</a>
	<a href="modify.jsp">정보수정</a>
	<a href="delete.jsp">회원 탈퇴</a>
</div>
</body>
</html>