<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- ex1_Logout.jsp -->
<%
  String mid = request.getParameter("mid");
  pageContext.setAttribute("mid", mid);
%>
<script>
	alert('${mid}님 로그아웃 되었습니다.');
	location.href='ex1_Login.jsp';
</script>