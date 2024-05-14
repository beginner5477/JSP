<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine","\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	function boardDelete() {
		let ans = confirm("현재 게시글을 삭제하시겠습니까?");
		if(ans) location.href = "BoardDelete.bo?idx=${vo.idx}";
	}
	function goodCheck() {
		$.ajax({
			url: "BoardGoodCheck.bo",
			type: "post",
			data: {idx : ${vo.idx}},
			success:function(res) {
				if(res != 0) {
					alert("좋아요 완료~");
					location.reload();
				}
			}
		});
	}
	function goodCheck2() {
		$.ajax({
			url: "BoardGoodCheck2.bo",
			type: "post",
			data: {idx : ${vo.idx}},
			success:function(res) {
				if(res != 0) {
					alert("좋아요 완료~");
					location.reload();
				}
			}
		});
	}
</script>
</head>
<body>
<p><br/><p>
<div class="container">
	<h3>게시글 내용</h3>
	<table class="table table-bordered">
		<tr>
		<th>글쓴이</th>
		<td>${vo.nickName }</td>
		<th>글쓴 날짜</th>
		<td>${fn:substring(vo.wDate, 0, 16)}</td>
		</tr>
		<tr>
		<th>글 조회수</th>
		<td>${vo.readNum }</td>
		<th>접속 IP</th>
		<td>${vo.hostIp }</td>
		</tr>
		<tr>
		<th>글제목</th>
		<td colspan="3">${vo.title } [<a href="javascript:goodCheck()">👍</a>]:${vo.good} /
		[<a href="javascript:goodCheck2()">good</a>]:${vo.good}</td>
		</tr>
		<tr>
		<tr>
		<th>내용</th>
		<td colspan="3"> ${fn:replace(vo.content, newLine, "<br/>")} </td>
		</tr>
		<tr>
			<td colspan="4"><button onclick="location.href='BoardList.ad?pag=${pag}&pageSize=${pageSize}'">돌아가기</button></td>
		</tr>
	</table>
	<hr/>
	<!-- 이전글 다음글 출력하기 -->
	<table class="table table-borderless">
		<tr>
			<td>
				<c:if test="${!empty preVo.title}">
				👆<a href="BoardContent.bo?idx=${preVo.idx}">이전글 : ${preVo.title}</a><br/>
				</c:if>
				<c:if test="${!empty nextVo.title}">
				👇<a href="BoardContent.bo?idx=${nextVo.idx}">다음글 : ${nextVo.title}</a><br/>
				</c:if>
			</td>
		</tr>
	</table>
</div>
<p><br/><p>
</body>
</html>
