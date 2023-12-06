<%@page import="food.FoodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex06-action.jsp</title>
</head>
<body>
<%!
	private FoodService service = new FoodService();
%>

<jsp:useBean id="dto" class="food.FoodDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	int row = service.add(dto);
	if (row != 0){
		session.setAttribute("list", service.getList());
	}
	response.sendRedirect("ex06-form.jsp");
%>
</body>
</html>
