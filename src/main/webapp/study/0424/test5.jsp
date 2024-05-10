<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test4.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>JSP 문법(선언문)</h2>
  <hr/>
  <%!
    public int hap(int su) {
  	  int hap = 0;
  	  for(int i=1; i<=su; i++) {
  	  	hap += i;
  	  }
  	  return hap;
    }
  %>
  <h3>1~?까지 합을 출력</h3>
  <div>1~100까지의 합을? <%=hap(100) %> 입니다.</div>
  <div>작업을 마칩니다.</div>
</div>
<p><br/></p>
</body>
</html>