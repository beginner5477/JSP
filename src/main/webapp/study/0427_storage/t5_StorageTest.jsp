<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t5_StorageTest.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>서블릿에서 세션/어플리케이션 처리하기</h2>
  <p>
    <a href="<%=request.getContextPath()%>/j0427/T5_StorageTestOk?mid=admin" class="btn btn-success mr-3">서버스토리지처리</a>
    <a href="${pageContext.request.contextPath}/j0427/T5_StorageTestClear" class="btn btn-danger">서버스토리지삭제</a>
  </p>
  <hr/>
  <p>세션 아이디 : ${sMid}</p>
  <p>어플리케이션 아이디 : ${aMid}</p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>