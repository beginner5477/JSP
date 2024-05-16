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
	<h1>신고 리스트</h1>
	<table class="table table-hover">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>분류</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>신고자</th>
			<th>신고내역</th>
			<th>신고날짜</th>
		</tr>
		<c:set var="complaintCnt" value="${complaintCnt}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
		<tr>
			<td>${complaintCnt}</td>
			<td>${vo.part}</td>
			<td>${vo.title}</td>
			<td>${vo.nickName}</td>
			<td>${vo.cpMid}</td>
			<td>${vo.cpContent}</td>
			<td>${vo.cpDate}</td>
		</tr>
		<c:set var="complaintCnt" value="${complaintCnt - 1}"/>
		</c:forEach>
	</table>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
