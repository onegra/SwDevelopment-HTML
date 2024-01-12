<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:if test="${pageContext.request.method == 'GET' }">
<div class="frame">
	<h3>회원가입</h3>
	<form method="POST">
		<p><input type="text" name="userid" placeholder="아이디" required></p>
		<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
		<p><input type="text" name="username" placeholder="이름" required></p>
		<p><input type="text" name="email" placeholder="이메일" required></p>
		<p>
			<label><input type="radio" name="gender" value="남" required>남</label>
			<label><input type="radio" name="gender" value="여" required>여</label>
		</p>
		<p><input type="text" name="pNum" placeholder="휴대폰번호" required></p>
		<p><input type="text" name="age" placeholder="나이" required></p>
		<p><input type="submit" value="제출"></p>
	</form>
</div>
</c:if>

<c:if test="${pageContext.request.method == 'POST' }" >
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />
	<c:set var="row" value="${memberDAO.join(dto) }" />
	<c:if test="${row > 0 }">
		<c:redirect url="/login.jsp" />
	</c:if>
	<c:if test="${row == -2 }">
		<script>
			alert('중복된 아이디가 있습니다')
			location.href = '${cpath}/join.jsp'
		</script>
	</c:if>
	<script>
		alert('회원 가입 실패')
		history.go(-1)
	</script>
</c:if>

</body>
</html>