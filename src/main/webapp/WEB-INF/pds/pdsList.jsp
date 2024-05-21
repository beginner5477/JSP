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
<script type="text/javascript">
	
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h4>자료실 리스트(${part})</h4>
	<br/>
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td>
				<form name="partForm">
					<select name="part" id="part" onchange="partCheck()">
						<option${part == '전체' ? "selected" : "" }>전체</option>
						<option${part == '학습' ? "selected" : "" }>학습</option>
						<option${part == '여행' ? "selected" : "" }>여행</option>
						<option${part == '음식' ? "selected" : "" }>음식</option>
						<option${part == '기타' ? "selected" : "" }>기타</option>
					</select>
				</form>
			</td>
			<td class="text-right">
				<a href="PdsInput.pds?part=${part}">자료 올리기</a>
			</td>
		</tr>
	</table>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>자료제목</th>
			<th>올린이</th>
			<th>올린날짜</th>
			<th>분류</th>
			<th>파일명(크기)</th>
			<th>다운 횟수</th>
			<th>비고</th>
		</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${curScrStartNo}</td>
				<td><a href="pdsContent.pds?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&part=${part}">${title}</a></td>
				<td>${vo.nickName}</td>
				<td>${vo.fDate}</td>
				<td>${vo.part}</td>
				<td>
					개별파일 다운로드
				</td>
				<td>${vo.downNum}</td>
				<td>
					<c:if test="${vo.mid == sMid || sLevel == 0}">
						<a href="#">삭제</a><br/>
					</c:if>
					<a href="PdsTotalDown.pds?idx=${vo.idx}">전체파일 다운로드</a>
				</td>
			</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
		</c:forEach>
	</table>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
