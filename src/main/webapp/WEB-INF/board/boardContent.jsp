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
	function etcShow() {
		$("#complaintTxt").show();
	}
	//신고사항 확인 후에 신고로 넘김
	function complaintCheck() {
		if(!$("input[type='radio'][name='complaint']").is(':checked')) {
			alert("신고항목을 선택하세요");
			return false;
		}
		if( $("input[type='radio'][id='complaint7']").is(':checked') && $("#complaintTxt").val() == "") {
			alert("기타 사유를 입력해주세요");
			return false;
		}
		
		let cpContent = modalForm.complaint.value;
		if(cpContent == "기타") cpContent += "/" + $("#complaintTxt").val();
		
		let query = {
				part : "board",
				partIdx: "${vo.idx}",
				cpMid: "${sMid}",
				cpContent: cpContent
		}
		console.log(typeof(query));
		alert("신고내용"+cpContent);
		$.ajax({
			url: "boardComplaintInput.ad",
			type: "post",
			data: query,
			success:function(res) {
				if(res != 0) {
					alert("신고 성공하였습니다.");
					location.reload();
				} else {
					alert("신고 실패요...");
				}
			},
			error:function() {
				alert("전송오류");
			}
			
		});
	}
	function replyCheck() {
		let content = $("#content").val();
		if(content.trim() == "") {
			alert("댓글을 입력하세요");
			return false;
		}
		let query = {
				boardIdx : ${vo.idx},
				mid : '${sMid}',
				nickName : '${sNickName}',
				hostIp : '${pageContext.request.remoteAddr}',
				content : content
		}
		$.ajax({
			url : "BoardReplyInput.bo",
			type: "post",
			data: query,
			success:function(res) {
				if(res != "0") {
					alert("댓글이 입력되었습니다.");
					location.reload();
				}
			},
			error:function() {
				alert("전송오류");
			}
		});
	}
	function replyDelete(idx) {
		let ans = confirm("선택한 댓글을 삭제하시겠습니까?");
		if(!ans) return false;
		$.ajax({
			url:"BoardReplyDelete.bo",
			type: "post",
			data : {idx : idx},
			success:function(res) {
				if(res != "0") {
					alert("댓글이 삭제 되었습니다.");
					location.reload();
				}
				else alert("삭제 실패");	
			},
			error:function() {
				alert("전송 실패요");
			}
			
		});
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
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
		<td colspan="12">${vo.title } [<a href="javascript:goodCheck()">👍</a>]:${vo.good} /
		[<a href="javascript:goodCheck2()">good</a>]:${vo.good}</td>
		</tr>
		<tr>
		<tr>
		<th>내용</th>
		<td colspan="12"> ${fn:replace(vo.content, newLine, "<br/>")} </td>
		</tr>
		<tr>
			<td colspan="4"><button onclick="location.href='BoardList.bo?pag=${pag}&pageSize=${pageSize}'">돌아가기</button></td>
			<c:if test="${vo.nickName == sNickName || sLevel == '0'}">
				<td colspan="4" class="text-right"><button onclick="location.href='BoardUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}'">수정</button></td>
				<td colspan="4" class="text-right"><button onclick="boardDelete()">삭제</button></td>
			</c:if>
			<c:if test="${vo.nickName != sNickName}">
				<c:if test="${report == 'OK'}">신고중</c:if>
				<c:if test="${report != 'OK'}">
				<td colspan="4" class="text-right"><button data-toggle="modal" data-target="#myModal">신고</button></td>
				</c:if>
			</c:if>
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
<div class="container">
	<!-- 댓글 리스트 보여주기 -->
	<table class="table table-hover text-center">
		<tr>
			<th>작성자</th>
			<th>댓글내용</th>
			<th>댓글일자</th>
			<th>접속IP</th>
		</tr>
		<c:forEach var="replyVo" items="${replyVos}" varStatus="st">
			<tr>
				<td>${replyVo.nickName}<c:if test="${sMid == replyVo.mid || sLevel == 0}"><a title="댓글삭제" href="javascript:replyDelete(${replyVo.idx})">(x)</a></c:if></td>
				<td class="text-left">${fn:replace(replyVo.content,newLine,"<br/>")}</td>
				<td>${fn:substring(replyVo.wDate,0,10)}</td>
				<td>${replyVo.hostIp}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 댓글 입력창 -->
	<form name="replyForm">
		<table class="table table-center">
			<tr>
				<td style="width:85%" class="text-left">
					글내용:
					<textarea rows="4" name="content" id="content" class="form-control"></textarea>
				</td>
				<td style="width:15%">
					<br/>
					<p>작성자: ${sNickName}</p>
					<p><input type="button" value="댓글달기" onclick="replyCheck()" class="btn btn-info"/></p>
				</td>
			</tr>
		</table>
	</form>
</div>
<!-- 신고용 모달 창 -->
<div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">게시글 신고하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          	<b>신고 사유 선택</b>
          	<hr/>
          <form name="modalForm">
          	<input type="radio" name="complaint" id="complaint1" value="광고,홍보,영리목적"/> 광고,홍보,영리목적 <br/>
          	<input type="radio" name="complaint" id="complaint2" value="욕설 비방 차별 혐오"/> 욕설 비방 차별 혐오 <br/>
          	<input type="radio" name="complaint" id="complaint3" value="불법 정보"/> 불법 정보<br/>
          	<input type="radio" name="complaint" id="complaint4" value="음란 청소년 유해"/> 음란 청소년 유해 <br/>
          	<input type="radio" name="complaint" id="complaint5" value="개인정보노출,유포,거래"/> 개인정보노출,유포,거래 <br/>
          	<input type="radio" name="complaint" id="complaint6" value="도배, 부적절한 반복성 글"/> 도배, 부적절한 반복성 글 <br/>
          	<input type="radio" name="complaint" id="complaint7" value="기타" onclick="etcShow()"/> 기타 <br/>
          	<div id="etc"><textarea id="complaintTxt" rows="2" class="form-control" style="display:none"></textarea></div>
          	<hr/>
          	<input type="button" value="확인" onclick="complaintCheck()" class="btn btn-secondary form-control"/>
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
