<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%--
<jsp:useBean id="dto" class="reply.ReplyDTO"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:setProperty property="writer" name="dto" value="${login.userid }"/>
${replyDAO.delete(dto) }
<c:redirect url="/view.jsp?idx=${param.board_idx }"/>
 --%>


<c:set var="row" value="${replyDAO.delete(param.idx) }" />
<c:redirect url="/view.jsp?idx=${param.board_idx }"/>
</body>
</html>