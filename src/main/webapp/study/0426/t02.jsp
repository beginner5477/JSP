<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>성적계산하기</h2>
  <hr/>
  <div class="row">
	  <div><a href="t02_1.jsp" class="btn btn-success mr-3">방법1(Servlet)</a></div>
	  <div><a href="t02_2.jsp" class="btn btn-primary mr-3">방법2(JSP)</a></div>
	  <div><a href="t02_3.jsp" class="btn btn-secondary">방법3(JSP)</a></div>
  </div>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>