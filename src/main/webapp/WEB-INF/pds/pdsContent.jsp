<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>

<style type="text/css">
	#starform fieldset {
		direction: rtl;
	}
	#starform input[type=radio] {
		display: none;
	}
	#starform label {
		font-size: 1.6em;
		color: transparent;
		text-shadow: 0 0 0 #f0f0f0;
	}
	#starform label:hover {
		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	}
	#starform label:hover ~ label {
		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	}
	#starform input[type=radio]:checked ~ label {
		text-shadow: 0 0 0 rgba(250, 200, 0, 0.98);
	}
</style>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3 class="text-center">자료 내용 상세보기</h3>
	<br/>
	<table class="table table-bordered text-center">
		<tr>
			<th>올린이</th>
			<td>${vo.nickName}</td>
			<th>올린날짜</th>
			<td>${fn:substring(vo.fDate,0,fn:length(vo.fDate)-2)}</td>
		</tr>
		<tr>
      <th>파일명</th>
      <td>
        <c:set var="fNames" value="${fn:split(vo.fName,'/')}"/>
        <c:set var="fSNames" value="${fn:split(vo.fSName,'/')}"/>
        <c:forEach var="fName" items="${fNames}" varStatus="st">
          <a href="${ctp}/images/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}</a><br/>
        </c:forEach>
        (<fmt:formatNumber value="${vo.fSize/1024}" pattern="#,##0" />KByte)
      </td>
      <th>올린날짜</th>
      <td>${vo.downNum}</td>
    </tr>
    <tr>
			<th>분류</th>
			<td>${vo.part}</td>
			<th>접속아이피</th>
			<td>${vo.hostIp}</td>
		</tr>
    <tr>
			<th>제목</th>
			<td colspan="3">${vo.title}</td>
		</tr>
    <tr>
			<th>세부설명</th>
			<td colspan="3">${fn:replace(vo.content,newLine,'<br/>')}</td>
		</tr>
		<tr>
           <td> <button onclick="location.href='PdsList.pds?pag=${pag}&pageSize=${pageSize}&part=${part}'">돌아가기</button> </td>
		</tr>
	</table>
	<hr/>
	<div>
		<form name="starform" id="starform">
			<fieldset style="border:0px;">
				<div class="m-0">
					<input type="radio" name="star1" id="star1" value="5"/><label for="star1">★</label>
					<input type="radio" name="star2" id="star2" value="4"/><label for="star2">★</label>
					<input type="radio" name="star3" id="star3" value="3"/><label for="star3">★</label>
					<input type="radio" name="star4" id="star4" value="2"/><label for="star4">★</label>
					<input type="radio" name="star5" id="star5" value="1"/><label for="star5">★</label>
				</div>
			</fieldset>
			<div class="m-0 p-0">
				<textarea rows="3" class="form-control mb-1" placeholder="별점 후기를 남겨주시면 100포인트를 지급 받습니다."></textarea>
			</div>
			<div>
				<input type="button" value="별점/리뷰등록" onclick="reviewCheck()"/> 
			</div>
		</form>
	</div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
