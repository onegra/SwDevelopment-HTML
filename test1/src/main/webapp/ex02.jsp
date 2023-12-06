<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%--선언부(declaration) : 필드 선언 및 메서드 정의 --%>
<%!
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
	public String getNow() {
		String answer="";
		answer =sdf.format(new Date());		
		return answer;
	}
%>
<%--스크립틀릿(scriptlet) : 메인함수 역할에 해당하는 함수 --%>
<%
	String now = getNow(); //다른 함수를 호출하거나, 지역변수에 값을 할당할 수 있다
	System.out.println("now: "+ now);
	//out.print("<h3>now : "+ now +"</h3>");
%>
<h1>JSP기본 문법 활용 예시</h1>
<hr>
<h3>now: <%=now %>
</h3>

</body>
</html>