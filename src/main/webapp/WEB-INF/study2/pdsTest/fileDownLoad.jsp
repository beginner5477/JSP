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
	function fileDelete(fileName) {
		$.ajax({
			url : "fileDelete.st",
			type : "post",
			data : {fileName : fileName},
			success:function(res) {
				if(res != 0) {
					alert("삭제완료");
					location.reload();
				} else alert("삭제 실패요");
			},
			error:function() {
				alert("전송 실패");
			}
		});
	}
	//선택 삭제
	function selectDelete() {
		let query = {};
		for(let i = 1; i <= ${fn:length(files)}; i++) {
			if(document.getElementById("cb"+i).checked) {
				query['cb'+i] = document.getElementById("cb"+i).value;
			}
		}
		query['length'] = ${fn:length(files)};
		console.log(query);
		console.log(typeof(query));
		
		
		$.ajax({
			url : "SelDelete.st",
			type : "post",
			data : query,
			success:function(res) {
				if(res != "0") {
					alert("삭제성공");
					location.reload();
				} else alert("실패요..");
			},
			error:function() {
				alert("전송실패요");
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
	<h2>저장된 파일 정보</h2>
	<hr/>
	<c:forEach var="file" items="${files}" varStatus="st">
		<input type="checkbox" name="cb${st.count}" id="cb${st.count}" value="${file}"/>
		<c:set var="fNameArr" value="${fn:split(file,'.')}"/>
		<c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}"/>
		<c:if test="${extName == 'jpg' || extName == 'png' ||extName == 'gif'}">
			<img src="${ctp}/images/pdsTest/${file}" width="250px"/>
		</c:if>
		${st.count}-<a href="${ctp}/images/pdsTest/${file}" download="${file}">${file}</a><br/>
		<input type="button" value="삭제" onclick="fileDelete('${file}')" class="btn btn-danger"/>
		<input type="button" value="자바로 다운로드" onclick="location.href='JavaFileDownload.st?file=${file}'" class="btn btn-danger"/>
	</c:forEach>
	
	<p><input type="button" value="돌아가기" onclick="location.href='FileUpload4.st';"/></p>
		<input type="button" value="선택삭제" onclick="selectDelete()"/>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
