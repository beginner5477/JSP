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
	function fCheck() {
		let fName1 = document.getElementById("file1").value;
		let maxSize = 1024 * 1024 * 10	//기본 단위는 Byte이다 그러므로 2의 20승은 근사치로 MB로 쳐서 10MB로 설정한 것임.
		let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
		
		if(fName1.trim() == "") {
			alert("업로드 할 파일명을 입력해주세요");
			return false;
		}
		let fileSize1 = document.getElementById("file1").files[0].size;
		if(fileSize1 > maxSize) {
			alert("업로드할 개당 파일의 최대용량은 10MByte입니다.");
		} else if(ext1 != "png") { 
			alert("1파일에 업로드 가능한 파일은 png입니다.");
		} else {
			alert("전송합니다.");
			myform.submit();
		}
	}
	//파일 박스 추가하기
	let cnt = 1;
	function fileBoxAppend() {
		let fileBox = "";
		cnt++;
		fileBox += "<div id='fBox"+cnt+"'>"; 
		fileBox += "<input type='file' name='fName"+cnt+"' id='file"+cnt+"' class='form-control-file border mb-2' style='float:left; width:85%;'/>"; 
		fileBox += "<input type='button' value='삭제' onclick='deleteBox("+cnt+")' style='width:15%;'/>"; 
		fileBox += "</div>";
		$("#fileBox").append(fileBox);
	}
	function deleteBox(cnt_) {
		$("#fBox"+cnt_).remove();
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>파일 업로드 연습3</h3>
	<p>COS라이브러리를 이용한 파일 업로드</p>
	<div>(Http://www.servlets.com)</div>
	<form name="myform" method="post" action="FileUpload3Ok.st" enctype="multipart/form-data">
		파일명:
		<div>
			<input type="button" value="파일박스추가" onclick="fileBoxAppend()"/>
			<input type="file" name="fName1" id="file1" class="btn btn-control-file mb-2"/>
		</div>
		<div id="fileBox"></div>
		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control"/>
		<input type="hidden" value="dd" name="nickName"/>
	</form>
	<hr/>
	<div><a href="downLoad.st" class="btn btn-primary form-control">다운로드 폴더로 이동하기</a></div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
