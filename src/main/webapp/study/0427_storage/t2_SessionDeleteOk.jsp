<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_SessionDeleteOk.jsp -->
<%
	String sessionSW = request.getParameter("sessionSW");
	session.removeAttribute(sessionSW);
%>
<script>
  alert("<%=sessionSW%> 세션이 삭제 되었습니다.");
  location.href = "t2_Session.jsp";
</script>