<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t09.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    'use strict';
    
    function imgView() {
    	let img = myform.img.value;
    	let str = '<img src="<%=request.getContextPath()%>/images/'+img+'.jpg" width="300px" />';
    	demo.innerHTML = str;
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>아래 콤보상자에서 그림파일을 선택하면 선택된 그림을 화면에 출력시켜주시오.</h2>
  <hr/>
  <form name="myform">
	  <div>그림선택
	    <select name="img" onchange="imgView()">
	      <option>111</option>
	      <option>112</option>
	      <option>113</option>
	      <option>114</option>
	      <option>115</option>
	    </select>
	  </div>
	  <hr/>
	  <div id="demo"></div>
  </form>
</div>
<p><br/></p>
</body>
</html>