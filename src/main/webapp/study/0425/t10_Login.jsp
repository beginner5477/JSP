<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String msgFlag = request.getParameter("msgFlag");
  System.out.println("msgFlag : " + msgFlag);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t10_Login.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    if('<%=msgFlag%>' == 'no') {
    	alert("로그인 실패~~ 정보를 다시 확인후 입력해 주세요");
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>값 전송 연습(Get/Post)</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0425/T10Ok">
  	<div>아이디
  	  <input type="text" name="mid" value="admin" class="form-control mb-3" autofocus required />
  	</div>
  	<div>비밀번호
  	  <input type="password" name="pwd" value="1234" class="form-control mb-3" required />
  	</div>
  	<div>
  	  <input type="submit" value="로그인" class="btn btn-success"/>
  	</div>
  </form>
</div>
<p><br/></p>
</body>
</html>