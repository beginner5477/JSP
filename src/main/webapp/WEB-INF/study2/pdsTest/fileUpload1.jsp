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
		let fName = document.getElementById("file").value;
		let maxSize = 1024 * 1024 * 10;	//기본 단위는 Byte이다 그러므로 2의 20승은 근사치로 MB로 쳐서 10MB로 설정한 것임.
		let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
		
		if(fName.trim() == "") {
			alert("업로드 할 파일명을 입력해주세요");
			return false;
		}
		let fileSize = document.getElementById("file").files[0].size;
		if(fileSize > maxSize) {
			alert("업로드할 파일의 최대용량은 10MByte입니다.");
		} else if(ext != "png") { 
			alert("업로드 가능한 파일은 png입니다.");
		} else {
			alert("전송합니다.");
			myform.submit();
		}
	}
	function imgCheck(e) {
		if(e.files && e.files[0]) {
			let reader = new FileReader();
			reader.onload =  function(e) {
				/* document.getElementById("demoImg").src = e.target.result; */
				document.getElementById("demoImg").src = reader.result;
			}
			 reader.readAsDataURL(e.files[0]);
		}
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>파일 업로드 연습(싱글 파일 처리)</h3>
	<p>COS라이브러리를 이용한 파일 업로드</p>
	<div>(Http://www.servlets.com)</div>
	<form name="myform" method="post" action="FileUpload1Ok.st" enctype="multipart/form-data">
		파일명:<input type="file" name="fName" onchange="imgCheck(this)" id="file" class="btn btn-control-file mb-2"/>
		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control"/>
		<!-- <input type="submit" value="파일전송" class="btn btn-success form-control"/> -->
		<input type="hidden" value="dd" name="nickName"/>
	</form>
	<hr/>
	<div id="demo"></div>
	<img id="demoImg" width="200px"/>
	<hr/>
	<div><a href="downLoad.st" class="btn btn-primary form-control">다운로드 폴더로 이동하기</a></div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
