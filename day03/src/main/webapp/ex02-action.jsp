<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="java.net.URLEncoder"%>

<%!
	Random ran = new Random();
	int cpu = ran.nextInt(100) + 1;
	int count = 0;
%>

<%
	if(request.getParameter("reset") != null) {
	count = 0;
	cpu = ran.nextInt(100) + 1;
	response.sendRedirect("ex02-form.jsp");
	return;
}
	int user = Integer.parseInt(request.getParameter("user"));
	count++;
	String msg ="";
	
	if (user == cpu) {
		msg = String.format("정답. %d회만에 정답으로 맞춤", count);
	}
	else if (user < cpu) {
		msg = "up (" + count + "회)"; 
	}
	else {
		msg = "down (" + count + "회)";
	}
	String location = "ex02-form.jsp?msg=" + URLEncoder.encode(msg,"UTF-8");
	
	response.sendRedirect(location);
%>
<a href="ex02-form.jsp?msg=<%=msg %>">	
<button>입력으로 이동</button>
</a>