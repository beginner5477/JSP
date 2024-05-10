<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	pageContext.setAttribute("mid", mid);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>ex1_Main.jsp</title>
  <jsp:include page="/include/bs4.jsp" />
  <script>
    'use strict';
    
    function searchCehck() {
    	let str = '';
    	str += '접속아이피 : <%=request.getRemoteAddr()%><br/>';
    	str += '접속 URL : <%=request.getRequestURL()%><br/>';
    	str += 'ContextPath명 : <%=request.getContextPath()%><br/>';
    	str += '접속프로토콜 : <%=request.getProtocol()%><br/>';
    	str += '접속방식 : <%=request.getMethod()%><br/>';
    	str += '<hr/>';
    	str += '<a href="javascript:location.reload();" class="btn btn-success">새로고침</a>';
    	
    	demo.innerHTML = str;
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2>회원 전용방</h2>
  <br/>
  <p>현재 <font color='blue'><b>${mid}</b></font>님 로그인 중이십니다.</p>
  <hr/>
  <p><img src="<%=request.getContextPath()%>/images/112.jpg" width="300px"/></p>
  <hr/>
  <div class="row">
    <div class="col"></div>
    <div class="col"><button type="button" onclick="searchCehck()" class="btn btn-primary">접속조회</button></div>
    <div class="col"><a href="ex1_Logout.jsp?mid=${mid}" class="btn btn-danger">로그아웃</a></div>
    <div class="col"></div>
  </div>
  <hr/>
  <div id="demo"></div>
</div>
<p><br/></p>
</body>
</html>