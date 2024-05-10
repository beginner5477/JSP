<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test2.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <%-- 
    JSP 지시자(<%@  %>)
    JSP 스크립틀릿(scriptlet) - jsp안에서 Java코드 사용시... : <%   %>
    JSP 선언문  <%!  %>
    JSP 표현식  <%=  %>
  --%>
  <h2>JSP 문법</h2>
  <hr/>
  <%
    int tot = 0;
  %>
  <h3>1~100까지 합 출력</h3>
  <%
    for(int i=1; i<=100; i++) {
    	tot += i;
    }
    out.println("1~100까지의 합은? "+tot+" 입니다.");
  %>
  <div>작업을 마칩니다.</div>
</div>
<p><br/></p>
</body>
</html>