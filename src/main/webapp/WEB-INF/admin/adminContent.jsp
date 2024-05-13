<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
</head>
<body>
<p><br/><p>
<div class="container">
	<h4>관리자 메인 화면</h4>
	<hr/>
	<p>방명록 최신 글(1주일)</p>
	<p>게시글 최신 글(1주일)</p>
	<p>신규회원 등록건수 출력(준회원)<a href="">${mCount}</a></p>	<!-- 우선 admin 컨트롤러로 접속 그다음 커맨드객체로 넘겨서 거기서 SELECT * FROM member WHERE level = 1로 불러와서 배열로 저장해서 배열 넘겨주면 jsp와서 스플릿하던지 그 전 컨트롤러에서 처리해서 넘기던지 해서 c:forEach돌려서 뽑아주면 끝남. -->
	<p>탈퇴 신청 회원 출력<a href="">${m99Count}</a></p>
</div>
<p><br/><p>
</body>
</html>
