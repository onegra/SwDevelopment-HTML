<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ex03.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="fileUtil" value="${FileUtil.getInstance() }"/>
<c:set var="dto" value="${fileUtil.getDTO(pageContext.request) }"/>

<c:set var="reviewDAO" value="${ReviewDAO.getInstance() }"/>
<c:set var="row" value="${reviewDAO.insert(dto) }"/>

<script>
	const row = '${row }'
	alert('영향받은 줄 수 : '+ row)
	location.href = '${cpath}/ex03-form.jsp'
</script>
</body>
</html>