<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>uuidForm.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <script>
    'use strict';
    
    let str = '';
    function uuidCheck() {
    	$.ajax({
    		url  : "${ctp}/UuidProcess",
    		type : "get",
    		success:function(res) {
    			str += res + "<br/>";
    			demo.innerHTML = str;
    		},
    		error : function() {
    			alert("전송오류!");
    		}
    	});
    }
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>UUID란</h2>
  <pre>
    UUID(Universally Unique IDentifier)는 네트워크상에서 고유성이 보장되는 id를 만들기 위한 규약이다.
    '거의 중복되는 확률이 0에 가까운, 매우 낮은 확륭를 가지는 ID를 만드는'방법을 표준화한것이 UUID이다.
    UUID는 계속해서 생성해도 중복이 생길 가능성이 0에 가깝다.
    128Bit로, 16진수 32자로 표현된다.(8-4-4-4-12)
    예) 1234aDFa-fr4R-AW36-Urd3-FADEfdwDVDEq
  </pre>
  <div>
    <form name="myform">
      <input type="button" value="UUID생성" onclick="uuidCheck()" class="btn btn-success"/>
      <input type="button" value="다시하기" onclick="location.reload()" class="btn btn-warning"/>
    </form>
  </div>
  <hr/>
  출력결과<br/>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>