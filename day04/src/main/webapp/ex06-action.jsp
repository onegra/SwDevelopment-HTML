<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="login" class="ex06.MemberDTO" scope="session" />
<jsp:setProperty property="name" name="login"/>
<jsp:setProperty property="img" name="login"/>
<%
	response.sendRedirect("ex06.jsp");
%>
</body>
</html>