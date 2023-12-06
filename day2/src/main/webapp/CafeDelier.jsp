<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CafeDelier</title>
</head>
<body>
<h1>메뉴 외울겸 JSP 연습할 겸</h1>
<hr>

<form>
	<p>
		<select name="category" required>
			<option value="">=== 카테고리 ===</option>
			<option value="시그니처메뉴">시그니처메뉴</option>
			<option value="커피">커피</option>
			<option value="스무디">스무디</option>
			<option value="음료">음료</option>
			<option value="차">차</option>
		</select>
	</아이스티p>
	<p><input type="text" name="menuName" placeholder="메뉴이름" required></p>
	<p><input type="text" name="recipe" placeholder="레시피" required></p>
	<p><input type="submit"></p>
</form>
<%@	page import="java.util.ArrayList, food.CafeDelierDTO" %>
<%!	
	private ArrayList<CafeDelierDTO> list = new ArrayList<>();
%>
<%
	String category = request.getParameter("category");
	String menuName = request.getParameter("menuName");		// <select name="category">
	String recipe = request.getParameter("recipe");	// <input name="storeName">
	
	if(category != null) {
		CafeDelierDTO dto = new CafeDelierDTO();
		dto.setCategory(category);
		dto.setMenuName(menuName);
		dto.setRecipe(recipe);
	
		list.add(dto);
		
		list.sort((a, b) -> a.getCategory().compareTo(b.getCategory()));
	}
%>

<table border="1" cellpadding="10" cellspacing="0">
	<tr bgcolor="#dadada">
		<th>카테고리</th>
		<th>메뉴이름</th>
		<th>레시피</th>
		</tr>
	<%--	리스트 내용을 화면에 출력하기 --%>
	<% for(CafeDelierDTO dto : list) { %>
	<tr>
		<td><%=dto.getCategory() %></td>
		<td><%=dto.getMenuName() %></td>
		<td><%=dto.getRecipe() %></td>
	</tr>
	<% } %>
</table>
</body>
</html>