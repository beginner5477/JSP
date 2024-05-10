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
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>쿠키 연습 메인 메뉴</h2>
  <hr/>
  <div class="row">
    <div><a href="t1_CookiesSave.jsp" class="btn btn-success mr-3">쿠키저장</a></div>
    <div><a href="t1_CookiesCheck.jsp" class="btn btn-primary mr-3">쿠키확인</a></div>
    <div><a href="t1_CookiesAllDelete.jsp" class="btn btn-danger mr-3">전체쿠키삭제</a></div>
    <div><a href="t1_CookiesPwdDelete.jsp" class="btn btn-warning mr-3">비밀번호쿠키삭제</a></div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>