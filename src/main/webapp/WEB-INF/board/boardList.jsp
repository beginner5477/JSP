<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
<%@ include file="/include/bs4.jsp" %>
<script>
	function pageSizeCheck() {
		let pageSize = $("#pageSize").val();
		location.href = "BoardList.bo?pageSize="+pageSize;
	}
  	function modalCheck(name, mid, nickName) {
  		let n1 = 1;
  		$("#myModal #modalName").html(name);
  		$("#myModal #modalMid").text(mid);
  		$("#myModal #modalNickName").text(nickName);
  	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td colspan="2"><h2>게 시 판 리 스 트</h2></td>
		</tr>
		<tr>
			<td><c:if test="${sLevel != 1}"><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></c:if></td>
			<td>
				<select name="pageSize" id="pageSize" onchange="pageSizeCheck()">
			          <option ${pageSize==5  ? "selected" : ""}>5</option>
			          <option ${pageSize==10 ? "selected" : ""}>10</option>
			          <option ${pageSize==15 ? "selected" : ""}>15</option>
			          <option ${pageSize==20 ? "selected" : ""}>20</option>
			          <option ${pageSize==30 ? "selected" : ""}>30</option>
		        </select>
			</td>
		</tr>
	</table>
	<table class="table table-hover m-0 p-0">
		<tr class="table-dark text-dark">
			<th>글번호</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>글쓴날짜</th>
			<th>조회수</th>
		</tr>
		<c:set var="curScrStartNo" value="${curScrStartNo}"/>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<c:if test="${vo.getOpenSw() == 'OK'||sLevel == 0 || sNickName == vo.nickName}">
			<tr>
				<td>${curScrStartNo}</td>
				<td>
					<a href="BoardContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}">${vo.title}</a>
					<c:if test="${vo.hour_diff < 24}"><img src="${ctp}/images/new.gif"/></c:if> 
				</td>
				<td>
					${vo.nickName}
					<c:if test="${sLevel == 0}"><a href="#" onclick="modalCheck('${sName}','${sMid}','${vo.nickName}')" data-toggle="modal" data-target="#myModal">모달</a></c:if>
				</td>
				<!-- 1일 이내는 시간만 표시하고 1일 초과는 날짜 시간  표시해주기 c:if조지면 끝이요
					단 24시간 이내를 만족시키는 자료중에 날짜 어제로 넘어가는 거는 날짜시간표시해주고 아닌거는 시간만 표시해주기  -->
				<td>
				 	${vo.date_diff == 0 ? fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,19) }
				</td>
				<td>${vo.readNum}(${vo.good})</td>
				<c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
			</tr>
			</c:if>
		</c:forEach>
	</table>
	<!-- 블록페이지 시작 -->
	<div class="text-center">
	  <ul class="pagination justify-content-center">
		  <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
		  <c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}">이전블록</a></li></c:if>
		  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize) + blockSize}" varStatus="st">
		    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
		  </c:forEach>
		  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
		  <c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
	  </ul>
	</div>
	<!-- 블록페이지 끝 -->
</div>
<p><br/><p>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form name="midModalForm">
            아이디 : <span id="modalMid"></span><br/>
            성명 : <span id="modalName"></span><br/>
            닉네임 : <span id="modalNickName"></span><br/>
          </form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
