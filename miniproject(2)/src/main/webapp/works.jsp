<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	.works {
	width: 1200px;
	background-color: black;
	border: 1px solid black;
	height: 250px;
	padding: 30px;
	}
	.poster-img {
	border: 1px solid red;
	}
	.poster-img > a > img {
		width: 130px;
	}
</style>

<h3>뮤지컬</h3>
<div class="works frame sb" style="flex: 6">
			<div class="poster">
				<div class="poster-img">
					<a href="#">
						<img src="${dto.image }https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif" >
						<h4>${dto.title }<h4>
						<p>${dto.area }</p>
						<p>${dto.date}</p>
					</a>
				</div>
			</div>
			<div class="poster">
				<div class="poster-img flex">
					<a href="#">
					<img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif">
					<h4 style="border: 1px solid blue;">제프버넷내한공연<h4>
						<p>명화 라이브 홈</p>
						<p>24-03-06</p>
					</a>
					
				</div>
			</div>
			<div class="poster">
				<div class="poster-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif">
					</a>
				</div>
			</div>
			<div class="poster">
				<div class="poster-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
			<div class="poster">
				<div class="poster-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
			<div class="poster">
				<div class="poster-img">
					<a href="#"><img src="https://ticketimage.interpark.com/Play/image/large/23/23017574_p.gif"></a>
				</div>
			</div>
		</div>
<table border="1" cellpadding="10" cellspacing="0" width="800" align="center">
	<c:set var="list" value="${worksDAO.selectList() }" />
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.id }</td>
		<td width="500">
			<a href="${cpath }/view.jsp?idx=${dto.id}">${dto.title }</a>
		</td>
		<td>${dto.writer }</td>
		<td>${dto.writeDate }</td>
	</tr>
	</c:forEach>
</table>

<div style="display: flex; width: 800px; margin: 20px auto; justify-content: space-between;">
	<div>
	
	</div>
	<div>
		<a href="${cpath }/write.jsp"><button>작성</button></a>
	</div>
</div>

</body>
</html>