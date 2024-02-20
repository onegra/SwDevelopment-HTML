<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>서블릿 활용 로그인 테스트</h1>
<hr>
<c:if test="${empty login }">
<form method="POST">
	<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
	<p><input type="password" name="userpw" placeholder="userpw" required></p>
	<p><input type="submit"></p>
</form>
</c:if>
<c:if test="${not empty login }">
<h3>${login }님 안녕하세요!!</h3>
<c:set var="cpath" value=""></c:set>
</c:if>
</body>
</html>