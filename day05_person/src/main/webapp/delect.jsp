<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
	String name = request.getParameter("name");
	
	personList.removeIf(dto->dto.getName().equals(name));
	response.sendRedirect("list.jsp");
%>
</body>
</html>