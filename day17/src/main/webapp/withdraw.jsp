<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h3>회원 탈퇴</h3>
<c:if test="${pageContext.request.method == 'GET' }">
	<c:set var="row" value="${dao.delete(param.id) }" />
</c:if>
<c:if test="${pageContext.request.method == 'POST' }">
	<c:if test="${row != 0 }">
		<c:redirect url="index.jsp"/>
	</c:if>
</c:if>
</body>
</html>