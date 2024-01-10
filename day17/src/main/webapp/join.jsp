<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<c:if test="${pageContext.request.method == 'GET' }">
	<h3>회원가입</h3>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="ID" required autofocus></p>
		<p><input type="password" name="userpw" placeholder="Password" required></p>
		<p><input type="text" name="username" placeholder="이름" required></p>
		<p><input type="text" name="email" placeholder="이메일" required></p>
		<p>	
		<input type="radio" name="gender" value="남성" required>남
		<input type="radio" name="gender" value="여성" required>여
		</p>
		<p><input type="submit" value="회원가입"></p>
	</form>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }">
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="join" value="${memberDAO.insert() }"/>
</c:if>

</body>
</html>