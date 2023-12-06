<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>quiz01.jsp</title>
</head>
<body>
<h1>quiz01.jsp - 두 수의 덧셈 결과</h1>
<hr>
<h3>HTML과 JAVA 코드가 하나의 페이지에 작성되어 있고, 순서가 섞여도 항상 자바부터 수행된다</h3>
<h3>JAVA코드는 웹 서버에서 실행되고, HTML코드는 클라이언트의 브라우저에서 실행된다</h3>
<form>
	<input type="number" name="n1" placeholder="n1" min="0" max="99">
	+
	<input type="number" name="n2" placeholder="n2" min="0" max="99">
	<input type="submit" value="=">
</form>
	<%
	String n1 = request.getParameter("n1");
	String n2 = request.getParameter("n2");
	if (n1 != null && n2 != null) {
		out.print(Integer.parseInt(n1)+Integer.parseInt(n2));
	}
	%>
</body>
</html>