<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t12Main.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    alert('${vo.name}님 회원가입 되셨습니다.');
    
    function logout() {
    	alert("${vo.name}님 로그아웃 되었습니다.");
    	location.href = "t12_form.jsp";
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회 원 정 보</h2>
  <hr/>
  <p>${vo.name}</p>
  <p>${vo.age}</p>
  <p>${vo.gender}</p>
  <p>${vo.hobby}</p>
  <p>${vo.job}</p>
  <p>${vo.mountain}</p>
  <p>${vo.content}</p>
  <p>${vo.fileName}</p>
  <hr/>
  <p>
    <input type="button" value="로그아웃" onclick="logout()" class="btn btn-success"/>
  </p>
</div>
<p><br/></p>
</body>
</html>