<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<table>
	<thead>
		<tr>
    		<th>userid</th>
    		<th>userpw</th>
    		<th>username</th>
    		<th>gender</th>
    		<th>email</th>
  		</tr>
	</thead>
	<tbody>
	<c:set var="list" value="${dao.selectAll() }"/>
	<c:forEach var="dto" items="${list }">
		<tr>
    		<td>${dto.userid }</td>
    		<td>${dto.userpw }</td>
    		<td>${dto.username }</td>
    		<td>${dto.gender }</td>
    		<td>${dto.email }</td>
  		</tr>
	</tbody>
  	</c:forEach>
</table>

</body>
</html>