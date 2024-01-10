<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<h3>게시글 상세 보기</h3>
<main>
<fieldset>
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
	<h3>${dto.idx } | ${dto.title } | ${dto.writer } </h3>
	<h4>조회수 : ${dto.viewCount }</h4>
	<c:if test="${not empty dto.image }">
		<img src="${cpath }/reviewImage/${dto.image}">
	</c:if>
	<pre>${dto.content }</pre>
	<h4>${dto.ipaddr }에서 ${dto.writeDate }에 작성됨</h4>
</fieldset>
<br>
<a href="${cpath }/index.jsp"><button>목록으로</button></a>
</main>

</body>
</html>