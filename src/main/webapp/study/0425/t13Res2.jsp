<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String mid = request.getParameter("mid");
  String pwd = request.getParameter("pwd");
  String loginFlag = request.getParameter("loginFlag");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>전송된 값의 출력</h2>
  <hr/>
  <p><font color="red" size="5"><%=loginFlag %></font>에 의한 값의 전달</p>
  <p>아이디 : <%=mid %></p>
  <p>비밀번호 : <%=pwd %></p>
  <hr/>
<%if(!loginFlag.equals("request")) { %>
  <p><a href="t13_서버값전달이동.jsp" class="btn btn-success">돌아가기</a></p>
<%} else { %>
  <p><a href="<%=request.getContextPath()%>/study/0425/t13_서버값전달이동.jsp" class="btn btn-primary">돌아가기</a></p>
<%} %>
</div>
<p><br/></p>
</body>
</html>