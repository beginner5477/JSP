<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>calendar2</title>
<%@ include file="/include/bs4.jsp" %>
<style>
</style>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<div class="text-align">
		<input type="button" onclick="location.href='Calendar2.st?yy=${yy - 1}&&MM=${MM}';" class="btn btn-secondary btn-sm" value="이전연도"/>
		<input type="button" onclick="location.href='Calendar2.st?yy=${yy}&&MM=${MM - 1}';" class="btn btn-secondary btn-sm" value="이전월"/>
		<font size="5">${yy}년${MM + 1}월</font>
		<input type="button" onclick="location.href='Calendar2.st?yy=${yy}&&MM=${MM + 1}';" class="btn btn-secondary btn-sm" value="다음월"/>
		<input type="button" onclick="location.href='Calendar2.st?yy=${yy + 1}&&MM=${MM}';" class="btn btn-secondary btn-sm" value="다음연도"/>
		<input type="button" onclick="location.href='Calendar2.st';" class="btn btn-secondary btn-sm" value="오늘날짜"/>
	</div>
	<div>
		<table class="table table-bordered" style="height:450px">
			<tr class="table-dark text-dark">
				<th><font color="red">일</font></th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th><font color="blue">토</font></th>
			</tr>
			<tr>
				<!-- 첫번째 행을 처리해준다-->
				<c:set var="lastLastDay" value="${lastLastDay + 2 - startWeek}"></c:set>
				<c:forEach begin="1" end="${startWeek - 1}">
					<td>${lastLastDay}</td>
					<c:set var="lastLastDay" value="${lastLastDay+1}"></c:set>
				</c:forEach>
				<c:set var="jud" value="${startWeek}"/>
				<c:forEach begin="1" end="${lastDay}" varStatus="st">
					<td>${st.count}</td>
					<c:if test="${jud % 7 == 0}"></tr><tr></c:if>
					<c:set var="jud" value="${jud + 1}"></c:set>
				</c:forEach>
				<c:forEach begin="1" end="${8 - nextStartWeek}" varStatus="st">
					<td>${st.count}</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
