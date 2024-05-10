<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t1_Filter.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<script>
  'use strict';
  
  function fCheck(flag) {
	  if(flag == 'OK') myform.action = "${ctp}/j0430/T01Ok1";
	  else myform.action = "${ctp}/j0430/T01Ok2";
	  myform.submit();
  }
</script>
<p><br/></p>
<div class="container">
  <h2>Filter한글처리 연습</h2>
  <form name="myform" method="post">
    <div><input type="text" name="content" value="간단한 소개입니다." class="form-control" autofocus /></div>
    <div><textarea rows="5" name="introduce" class="form-control" >자기소개입니다.</textarea></div>
    <div><input type="button" value="전송1" onclick="fCheck('OK')" class="btn btn-success form-control mb-1"/></div>
    <div><input type="button" value="전송2" onclick="fCheck('NO')" class="btn btn-primary form-control"/></div>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>