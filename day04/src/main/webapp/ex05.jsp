<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#root {
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background-color: #f5f6f7;
		align-items: center;
		}
	.flex {
	display: flex;
		}
	.left{
	width: 200%;
	height: 100%; 
		}
	.right {
	border-right: 1px soild black; 
	}
	.right img {
	height: 300px;
	}
</style>
</head>
<body>
<div id="root">
	<h1>리다이렉트를 활용하여 새로 요청하기</h1>
	<hr>
	<div class = "flex">
		<div class = "left">
		 	<form>
		 	<select name="name">
		 	<option>짱구</option>
		 	<option>짱구</option>
		 	<option>짱구</option>
		 	<option>짱구</option>
		 	<option>짱구</option>
		 	</select>
		 	</form>
		</div> 
		
	
	</div>
	<%
	String name = request.getParameter("name");
	if (name != null ) {
		name = URLEncoder.encode(name,"UTF-8");
		response.sendRedirect("ex05-show.jsp?name" + name);
	}
	%>
</div>
</body>
</html>