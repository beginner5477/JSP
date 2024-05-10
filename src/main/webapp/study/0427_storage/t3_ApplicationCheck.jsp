<%@ page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String applicationName = "";
	String applicationName_ = "";
  String applicationValue = "";
  
  String mid = (String) application.getAttribute("aMid");
  String nickName = (String) application.getAttribute("aNickName");
  String name = (String) application.getAttribute("aName");
  
  pageContext.setAttribute("mid", mid);
  pageContext.setAttribute("nickName", nickName);
  pageContext.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t3_applicationCheck.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>세션값 출력</h2>
  <p>아이디 : ${mid}</p>
  <p>별명 : ${nickName}</p>
  <p>성명 : ${name}</p>
  <hr/>
  <p><a href="t3_Application.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>