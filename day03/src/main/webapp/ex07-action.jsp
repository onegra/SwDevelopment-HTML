<%@page import="ex07.FoodService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-action.jsp</title>
</head>
<body>
<%
	FoodService service = (FoodService) application.getAttribute("service");
	if(service == null) {
		service = new FoodService();
		application.setAttribute("service",service);
	} 
%>

<jsp:useBean id="dto" class="ex07.FoodDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%
	int row = service.add(dto);

	if (row != 0){
		session.setAttribute("list", service.getList());
	}
	response.sendRedirect("ex07-form.jsp");
%>
</body>
</html>
