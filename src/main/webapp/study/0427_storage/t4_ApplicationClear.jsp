<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t4_ApplicationClear.jsp -->
<%
	application.setAttribute("aCount", 0);
%>
<script>
  alert("어플리케이션값이 초기화 되었습니다.");
  location.href = "t4_StorageTest.jsp";
</script>