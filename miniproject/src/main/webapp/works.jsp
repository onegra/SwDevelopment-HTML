<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>

</style>

<h3>뮤지컬</h3>
<img src="board.png">

<table border="1" cellpadding="10" cellspacing="0" width="800" align="center">
	<c:set var="list" value="${worksDAO.selectList() }" />
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.id }</td>
		<td width="500">
			<a href="${cpath }/view.jsp?idx=${dto.id}">${dto.title }</a>
		</td>
		<td>${dto.writer }</td>
		<td>${dto.writeDate }</td>
	</tr>
	</c:forEach>
</table>

<div style="display: flex; width: 800px; margin: 20px auto; justify-content: space-between;">
	<div>
	
	</div>
	<div>
		<a href="${cpath }/write.jsp"><button>작성</button></a>
	</div>
</div>

</body>
</html>