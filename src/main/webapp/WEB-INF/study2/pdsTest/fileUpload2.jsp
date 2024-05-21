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
		let fName2 = document.getElementById("file2").value;
		let fName3 = document.getElementById("file3").value;
		let maxSize = 1024 * 1024 * 10	//기본 단위는 Byte이다 그러므로 2의 20승은 근사치로 MB로 쳐서 10MB로 설정한 것임.
		let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
		let ext2 = fName2.substring(fName2.lastIndexOf(".")+1).toLowerCase();
		let ext3 = fName3.substring(fName3.lastIndexOf(".")+1).toLowerCase();
		
		if(fName1.trim() == "" || fName2.trim() == "" || fName3.trim() == "") {
			alert("업로드 할 파일명을 입력해주세요");
			return false;
		}
		let fileSize1 = document.getElementById("file1").files[0].size;
		let fileSize2 = document.getElementById("file2").files[0].size;
		let fileSize3 = document.getElementById("file3").files[0].size;
		if(fileSize1 > maxSize || fileSize2 > maxSize || fileSize3 > maxSize) {
			alert("업로드할 개당 파일의 최대용량은 10MByte입니다.");
		} else if(ext1 != "png") { 
			alert("1파일에 업로드 가능한 파일은 png입니다.");
		} else if(ext2 != "png") { 
			alert("2파일에 업로드 가능한 파일은 png입니다.");
		} else if(ext3 != "png") { 
			alert("3파일에 업로드 가능한 파일은 png입니다.");
		} else {
			alert("전송합니다.");
			myform.submit();
		}
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>파일 업로드 연습(멀티 파일 처리하기)</h3>
	<p>COS라이브러리를 이용한 파일 업로드</p>
	<div>(Http://www.servlets.com)</div>
	<form name="myform" method="post" action="FileUpload2Ok.st" enctype="multipart/form-data">
		파일명1:<input type="file" name="fName1" id="file1" class="btn btn-control-file mb-2"/>
		파일명2:<input type="file" name="fName2" id="file2" class="btn btn-control-file mb-2"/>
		파일명3:<input type="file" name="fName3" id="file3" class="btn btn-control-file mb-2"/>
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
