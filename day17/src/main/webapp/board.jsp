<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h3>게시판</h3>
<table border="1" cellpadding="10" cellspacing="0" width="1200" align="center">
	<c:set var="list" value="${boardDAO.selectList() }"/>
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.idx }</td>
		<td width="500">
		<a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.title }</a>
		</td>
		<td>${dto.writer }</td>
		<td>${dto.writeDate }</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>