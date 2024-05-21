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
<script>
    'use strict';
    let cnt = 1;
    
    function fCheck() {
    	let fName1 = document.getElementById("fName1").value;
    	let maxSize = 1024 * 1024 * 30;	// 기본 단위 : Byte,   1024 * 1024 * 30 = 30MByte 허용
    	let title = $("#title").val();
    	
    	if(fName1.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	else if(title.trim() == "") {
    		alert("업로드할 파일을 선택하세요");
    		return false;
    	}
    	
    	// 파일사이즈와 확장자 체크하기
    	let fileSize = 0;
    	for(let i=1; i<=cnt; i++) {
    		let imsiName = 'fName' + i;
    		if(isNaN(document.getElementById(imsiName))) {
    			let fName = document.getElementById(imsiName).value;
    			if(fName != "") {
    				fileSize += document.getElementById(imsiName).files[0].size;
			    	let ext1 = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
	    	    if(ext1 != 'jpg' && ext1 != 'gif' && ext1 != 'png' && ext1 != 'zip' && ext1 != 'hwp' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'doc' && ext1 != 'pdf' && ext1 != 'xlsx' && ext1 != 'txt') {
	    		    alert("업로드 가능한 파일은 'jpg/gif/png/zip/hwp/ppt/pptx/doc/pdf/xlsx/txt'만 가능합니다.");
	    		    return false;
	    	    }
    			}
    		}
    	}
    		
    	if(fileSize > maxSize) {
    		alert("업로드할 파일의 최대용량은 30MByte입니다.");
    		return false;
    	}
    	else {
    		myform.fSize.value = fileSize;
    		alert("파일 총 사이즈 : " + fileSize);
    		myform.submit();
    	}
    }
    
    // 파일 박스 추가하기
    function fileBoxAppend() {
    	cnt++;
    	let fileBox = '';
    	fileBox += '<div id="fBox'+cnt+'">';
    	fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border mb-2" style="float:left; width:85%;" />';
    	fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger mb-2 ml-2" style="width:10%;" />';
    	fileBox += '</div>';
    	$("#fileBox").append(fileBox);		// html(), text(), append()
    }
    
    // 파일 박스 삭제
    function deleteBox(cnt) {
    	$("#fBox"+cnt).remove();
    	cnt--;
    }
    function pwdCheck1() {
    	$("#pwdDemo").show();
    }
    function pwdCheck2() {
    	$("#pwdDemo").hide();
    	$("#pwd").var("");
    }
  </script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<form name="myform" method="post" action="PdsInputOk.pds" enctype="multipart/form-data">
		<h2>자료올리기</h2>
		<br/>
		<div>
			<input type="button" value="파일박스추가" onclick="fileBoxAppend()"/>
			<input type="file" name="fName1" id="fName1" class="btn btn-control-file mb-2"/>
		</div>
		<div id="fileBox"></div>
		<div class="mb-2">
			올린이 : ${sNickName}
		</div>
		<div class="mb-2">
			제목 : <input type="text" name="title" id="title" placeholder="자료의 제목을 입력하세요" required/>
		</div>
		<div class="mb-2">
			내용 : <textarea rows="4" name="content" id="content" placeholder="자료의 상세내역을 입력하세요"></textarea>
		</div>
		<div class="mb-2">
			분류 :
			<select name="part" id="part" onchange="partCheck()">
				<option${part == '전체' ? "selected" : "" }>전체</option>
				<option${part == '학습' ? "selected" : "" }>학습</option>
				<option${part == '여행' ? "selected" : "" }>여행</option>
				<option${part == '음식' ? "selected" : "" }>음식</option>
				<option${part == '기타' ? "selected" : "" }>기타</option>
			</select>
		</div>
		<div class="mb-2">
			공개여부 : <input type="radio" name="openSw" onclick="pwdCheck2()" value="공개" checked/>공개
			공개여부 : <input type="radio" name="openSw" onclick="pwdCheck1()" value="비공개"/>비공개
			<div id="pwdDemo" style="display:none"><input type="password" name="pwd" id="pwd"/></div>
		</div>
		<div>
			<input type="button" value="자료올리기" onclick="fCheck()"/>
			<input type="reset" value="다시쓰기"/>
			<input type="button" value="돌아가기" onclick="location.href='PdsList.pds?part=${part}';" class="btn btn-info"/>
		</div>
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
	    <input type="hidden" name="mid" value="${sMid}" />
	    <input type="hidden" name="nickName" value="${sNickName}" />
	    <input type="hidden" name="fSize" />
	</form>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
