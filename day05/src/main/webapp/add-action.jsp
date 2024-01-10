<%@page import="book.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dto" class="book.BookDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>
${dao.insert(dto) }
<%
//	response.sendRedirect("list.jsp");
	int lastIdx = BookDTO.getSeq();
	response.sendRedirect("view.jsp?idx=" + lastIdx);
%>