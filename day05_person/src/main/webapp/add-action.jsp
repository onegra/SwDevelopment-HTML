<%@page import="java.net.URLEncoder"%>
<%@page import="person.PersonDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="paramDTO" class="person.PersonDTO"/>
<jsp:setProperty property="*" name="paramDTO"/>

${personList.add(paramDTO) }

<% 
//	ArrayList<PersonDTO> personList = (ArrayList<PersonDTO>)application.getAttribute("personList");
//	personList.add(param);
	
	//response.sendRedirect("list.jsp");
	String name = URLEncoder.encode(paramDTO.getName(), "UTF-8");
	response.sendRedirect("view.jsp?name=" + name);
%>