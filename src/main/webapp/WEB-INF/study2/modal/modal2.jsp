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
	function fCheck(name) {
		/* document.getElementById("tt").innerHTML = name; */
		$("#tt").html("<hr/>"+name);
	}
</script>
</head>
<body>
<%@ include file="/include/header.jsp" %>
<%@ include file="/include/nav.jsp" %>
<p><br/><p>
<div class="container">
	<h3>모달연습2</h3>
	<hr/>
	<p>
		<input type="button" value="내용 출력" class="btn btn-secondary" data-toggle="modal" data-target="#myModal"/>
		<a href="#" type="button" onclick="fCheck('우리엘')" class="btn btn-primary" data-toggle="modal" data-target="#myModal">"내용 출력"</a>
	</p>
	<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" id="tt">Modal Heading</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          Modal body..
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
<p><br/><p>
<%@ include file="/include/footer.jsp" %>
</body>
</html>
