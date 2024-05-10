<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>loginMain.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
		'use strict';
		
		function nameSearch() {
			let name = document.getElementById("name").value;
			if(name.trim() == "") {
				alert("검색할 성명을 입력하세요!");
				document.getElementById("name").focus();
			}
			else {
				location.href = "${ctp}/database/LoginSearch?name="+name;
			}
			
		}
		
		function sortCheck() {
			let sortKey = document.getElementById("sortKey").value;
			location.href = '${ctp}/study/database/LoginList?sortKey='+sortKey;
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2 class="text-center">회 원 메 인 방</h2>
  <hr/>
  <div class="text-right mb-3">
  	<c:if test="${pag > 1}">
      <a href="${ctp}/study/database/LoginList?pag=1" title="첫페이지">◁◁</a>
      <a href="${ctp}/study/database/LoginList?pag=${pag-1}" title="이전페이지">◀</a>
    </c:if>
    ${pag}/${totPage}
    <c:if test="${pag < totPage}">
      <a href="${ctp}/study/database/LoginList?pag=${pag+1}" title="다음페이지">▶</a>
      <a href="${ctp}/study/database/LoginList?pag=${totPage}" title="마지막페이지">▷▷</a>
    </c:if>
  </div>
  <div class="row">
    <div class="col"><input type="button" value="전체조회" onclick="location.href='${ctp}/study/database/LoginList';" class="btn btn-success btn-sm mb-2"/></div>
    <div class="col text-right">정렬순서 :&nbsp;
      <select name="sortKey" id="sortKey" onchange="sortCheck()">
        <option value="idx"       <c:if test="${sortKey == 'idx'}">selected</c:if>>번호순</option>
        <option value="idx desc"  <c:if test="${sortKey == 'idx desc'}">selected</c:if>>번호역순</option>
        <option value="name"      <c:if test="${sortKey == 'name'}">selected</c:if>>성명순</option>
        <option value="name desc" <c:if test="${sortKey == 'name desc'}">selected</c:if>>성명역순</option>
        <option value="age"       <c:if test="${sortKey == 'age'}">selected</c:if>>나이순</option>
        <option value="address"   <c:if test="${sortKey == 'address'}">selected</c:if>>주소순</option>
      </select>
    </div>
  </div>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>성명</th>
      <th>나이</th>
      <th>성별</th>
      <th>주소</th>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
    	<tr>
    	  <td>${vo.idx}</td>
    	  <td>${vo.mid}</td>
    	  <td><a href="${ctp}/study/database/LoginView?idx=${vo.idx}">${vo.name}</a></td>
    	  <td>${vo.age}</td>
    	  <td>${vo.gender}</td>
    	  <td>${vo.address}</td>
    	</tr>
    </c:forEach>
    <tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <hr/><br/>
  <div class="input-group">
    <div class="input-group-prepend"><span class="input-group-text">성 명</span></div>
    <input type="text" name="name" id="name" class="form-control"/>
    <button type="button" onclick="nameSearch()" class="input-group-append btn btn-warning">개별조회</button>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>