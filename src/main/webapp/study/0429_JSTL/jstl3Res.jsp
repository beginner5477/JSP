<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jstl3Res.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>개별 회원 자료</h2>
  <div class="card p-3">
    <div class="card p-2 m-2">성명 : ${vo.name}</div>
    <div class="card p-2 m-2">나이 : ${vo.age}</div>
    <div class="card p-2 m-2">성별 : ${vo.gender}</div>
    <div class="card p-2 m-2">직업 : ${vo.job}</div>
    <div class="card p-2 m-2">주소 : ${vo.address}</div>
  </div>
  <hr/>
  <div>
    <a href="${ctp}/study/0429_JSTL/jstl3_vo.jsp" class="btn btn-warning">돌아가기</a>
  </div>
  <hr/>
  <h2 class="text-center">전체 회원 리스트</h2>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
    	<th>번호</th>
    	<th>성명</th>
    	<th>나이</th>
    	<th>성별</th>
    	<th>직업</th>
    	<th>주소</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${st.count}</td>
    	  <td>${vo.name}</td>
    	  <td>${vo.age}</td>
    	  <td>${vo.gender}</td>
    	  <td>${vo.job}</td>
    	  <td>${vo.address}</td>
    	</tr>
    </c:forEach>
    <tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <hr/>
  <h2 class="text-center">전체 회원 리스트2</h2>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
    	<th>번호</th>
    	<th>성명</th>
    	<th>나이</th>
    	<th>성별</th>
    	<th>직업</th>
    	<th>주소</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${cnt-st.index}</td>
    	  <td>${vo.name}</td>
    	  <td>${vo.age}</td>
    	  <td>${vo.gender}</td>
    	  <td>${vo.job}</td>
    	  <td>${vo.address}</td>
    	</tr>
    </c:forEach>
    <tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>