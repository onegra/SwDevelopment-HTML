<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex04.jsp</title>
</head>
<body>
<h1>페이지 이동 기술</h1>
<hr>
<h3>redirect :  클라이언트에게 이동할 주소를 보내주고, 클라이언트가 새로 요청하게 한다</h3>
<h3>forward : 클라이언트가 요청한 내용을 다른 주소로 넘겨서 응답을 보내도록 한다</h3>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>response.sendRedirect(String location)</td>
		<td>
			<ul>
				<li>클라이언트가 새로운 요청을 보내기, 때문에 현재 서버가 아닌 다른 주소도 이동 가능하다</li>
				<li>클라이언트가 직접 요청을 보내기 때문에, 브라우저 주소창의 주소가 변경된다</li>
			</ul>
		</td>
	</tr>
	<tr>
		<td>request.getRequestDispatcher(String url).forward(request, response)</td>
		<td>
			<ul>
				<li>서버 내부에서 임의로 응답할 주소를 고르기 때문에, 다른 서버로는 넘길 수 없다</li>
				<li>클라이언트는 관여하지 않고 서버에서 응답을 바꿔치기 하므로 브라우저 주소창이 변경되지 않는다</li>
				<li>고객에게 잠시 기다리게 하고, 내선번호로 전화를 돌리는 방식</li>
				<li>request, response가 유지된다 (A에서 setAttribute하면 B에서 getAttribute 할 수 있다)</li>
				<li></li>
			</ul>
		</td>
	</tr>
</table>

<fieldset>
	<legend>rediret</legend>
	<form>
	<input type="text" name="redirectURL" placeholder="리다이렉트 주소 입력">
	<button>리다이렉트</button>
	</form>
</fieldset>
<br>
<%
	String redirectURL = request.getParameter("redirectURL");
	if(redirectURL != null) {
		response.sendRedirect(redirectURL);
		return;
	}
	
	String forwardURL = request.getParameter("forwardURL");
	if(forwardURL != null) {
		request.getRequestDispatcher(forwardURL).forward(request, response);
		return;
	}
%>
</body>
</html>