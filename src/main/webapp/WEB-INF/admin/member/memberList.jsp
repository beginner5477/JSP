<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>memberList.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
    'use strict';
    
    $(function(){
    	$("#userDispaly").hide();
    	
    	$("#userInfor").on("click", function(){
    		if($("#userInfor").is(':checked'))	$("#userDispaly").show();
    		else $("#userDispaly").hide();
    	});
    });
    //등급별 회원 보기
    function levelItemCheck() {
    	let level = $("#LevelItem").val();
    	location.href = "MemberList.ad?level="+level;
    }
    //회원의 등급 변경 처리하는 것
    function levelChange(e) {
    	let items = e.value.split("/");
    	let query = {
    			level : items[0],
    			idx : items[1]
    	}
    	let ans = confirm("선택한 회원의 등급을 바꾸겠습니까?");
    	if(!ans) {
    		location.reload();
    		return false;
    	}
    	$.ajax({
    		url : "MemberLevelChange.ad",
    		type : "post",
    		data : query,
    		success: function(res) {
    			if(res != "0") {
    				alert("등급 수정완료~");
    				location.reload();
    			} else alert("등급 수정 실패");
    		},
    		error: function() {
    			alert("전송오류");
    		}
    	});
    }
    function memberDeleteOk(idx) {
    	let ans = confirm("선택하신 회원을 영구 삭제 하시겠습니까?");
    	if(ans) {
    		$.ajax({
    			url : "MemberDeleteOk.ad",
    			type : "post",
    			data : {idx : idx},
    			success: function(res) {
    				if(res != "0") {
    					alert("영구 삭제 완료");
    					location.reload();
    				} else {
    					alert("삭제 실패");
    				}
    			},
    			error: function() {
    				alert("전송오류");
    			}
    		});
    	} else {
    		return;
    	}
    }
    function selectAll() {
    	for(let i = 1; i <= ${fn:length(vos)}; i++)
    	{
        	document.getElementById("ch"+i).checked = true;
    	}
    }
    function deselectAll() {
    	for(let i = 1; i <= ${fn:length(vos)}; i++)
    	{
        	document.getElementById("ch"+i).checked = false;
    	}
    }
    function reverseAll() {
    	for(let i = 1; i <= ${fn:length(vos)}; i++)
    	{
    		if(document.getElementById("ch"+i).checked)
        	document.getElementById("ch"+i).checked = false;
    		else document.getElementById("ch"+i).checked = true;
    	}
    }
    function sendChange() {
    	let level = document.getElementById("changeAll").value;
    	let tempList = "";
    	for(let i = 2; i <= ${fn:length(vos)}; i++)
    	{
    		if(document.getElementById("ch"+i).checked)
    		tempList += document.getElementById("ch"+i).value + "/";
    	}
    	let list = {
    			level : level,
    			list : tempList
    	};
    	$.ajax({
    		url : "AllMemberChage.ad",
    		type : "post",
    		data : list,
    		success:function(res) {
    			if(res != 0) {
    				alert("전체등급변경 성공이요.");
    				location.reload();
    			} else alert("전체등급변경 실패요");
    		},
    		error:function() {
    			alert("전송실패");
    		}
    	});
    }
  </script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2 class="text-center">전체 회원 리스트</h2>
  <div class="row">
    <div><input type="button" name="selectAll" id="selectAll" onclick="selectAll()" value="전체선택"/></div>
    <div><input type="button" name="deselectAll" id="deselectAll" onclick="deselectAll()" value="전체해제"/></div>
    <div><input type="button" name="reverseAll" id="reverseAll" onclick="reverseAll()" value="반전"/></div>
    <div class="col">
    	<select name="changeAll" id="changeAll" onchange="sendChange()">
    		<option value="">선택 등급 바꾸기 선택</option>
    		<option value="1">준회원</option>
    		<option value="2">정회원</option>
    		<option value="3">우수회원</option>
    		<option value="4">운영자</option>
    		<option value="99">탈퇴신청회원</option>
    		<option value="0">관리자</option>
    	</select>
    </div>
    <div class="col">
    	<select name="LevelItem" id="LevelItem" onchange="levelItemCheck()">
    		<option value="">선택</option>
    		<option value="999">전체보기</option>
    		<option value="1">준회원</option>
    		<option value="2">정회원</option>
    		<option value="3">우수회원</option>
    		<option value="4">운영자</option>
    		<option value="99">탈퇴신청회원</option>
    		<option value="0">관리자</option>
    	</select>
    </div>
   </div>
  <table class="table table-hover text-center">
    <tr class="table-dark text-dark">
      <th>번호</th>
      <th>아이디</th>
      <th>닉네임</th>
      <th>성명</th>
      <th>생일</th>
      <th>성별</th>
      <th>최종 방문 일</th>
      <c:if test="${sLevel == 0}">
      <th>오늘 방문 횟수</th>
      <th>삭제 신청 여부</th>
      <th>활동 여부</th>
      <th>현재 레벨</th>
      </c:if>
    </tr>
    <c:forEach var="vo" items="${vos}" varStatus="st">
      	<c:if test="${vo.userDel == 'OK'}"><c:set var="activity" value="탈퇴신청"></c:set></c:if>
      	<c:if test="${vo.userDel != 'OK'}"><c:set var="activity" value="활동중"></c:set></c:if>
	      <tr>
	        <td><input type="checkbox" id="ch${st.count}" name="ch" value="${vo.idx}"/>${vo.idx}</td>
	        <td><a href="MemberSearch.mem?mid=${vo.mid}">${vo.mid}</a></td>
	        <td>${vo.nickName}</td>
	        <td>${vo.name}</td>
	        <td>${fn:substring(vo.birthday,0,10)}</td>
	        <td>${vo.gender}</td>
	        <td>${fn:substring(vo.lastDate,0,10)}</td>
	        <c:if test="${sLevel == 0}">
	        <td>${vo.todayCnt}</td>
	        <td>${vo.userDel} <c:if test="${activity == '탈퇴신청' }"><a href="javascript:memberDeleteOk(${vo.idx})">${vo.deleteDiff}일 경과</a> </c:if></td>
	        <td>${activity}</td>
	        <td>
	        	<form name="levelForm">
	        		<select name="level" onchange="levelChange(this)">	<!-- 여기서 넘길때 밸류에 탈퇴신청여부도 같이 넘겨주고 그걸 컨트롤러에 보낼때 같이 넘겨줘서 탈퇴신청인 애가 탈퇴회원 아니고 다른 레벨로 바꿔지면 sql문에 탈퇴여부 바꾸는거 추가해주면 됨 -->
	        			<option value="1/${vo.idx}"${vo.level == 1 ? "selected" : ""}>준회원</option>
	        			<option value="2/${vo.idx}"${vo.level == 2 ? "selected" : ""}>정회원</option>
	        			<option value="3/${vo.idx}"${vo.level == 3 ? "selected" : ""}>우수 회원</option>
	        			<option value="4/${vo.idx}"${vo.level == 4 ? "selected" : ""}>운영자</option>
	        			<option value="0/${vo.idx}"${vo.level == 0 ? "selected" : ""}>관리자</option>
	        			<option value="99/${vo.idx}"${vo.level == 99 ? "selected" : ""}>탈퇴 회원</option>
	        		</select>
	        	</form>
	        </td>
	        </c:if>
	      </tr>
    </c:forEach>
    <tr><td colspan="8" class="m-0 p-0"></td></tr>
  </table>
</div>
<p><br/></p>
</body>
</html>