<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03-form.jsp</title>
</head>
<body>
<h1>ex04-form.jsp</h1>
<hr>
<form action="ex03-action.jsp">
	<p><input type="text" name="storeName" placeholder="식당이름" required></p>
	<p><input type="text" name="menuName" placeholder="메뉴이름" required></p>
	<p>
		<select name="category" required></select>
	</p>
	<p><input type="number" name="menuPrice" placeholder="주문금액" min="0" step="100" required></p>
	<p><input type="submit"></p>
	
</form>
<h3><%=request.getParameter("msg") %></h3>
</body>
</html>