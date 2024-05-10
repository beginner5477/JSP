<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t14Res.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    if('${loginFlag}' == 'OK') {
    	alert("${mid}님 로그인 되셨습니다.");
    	location.href = '<%=request.getContextPath()%>/study/0425/t14Main.jsp?mid=${mid}&loginFlag=${loginFlag}';
    }
  
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  
</div>
<p><br/></p>
</body>
</html>