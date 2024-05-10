<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Insert</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h3>구구단 연습</h3>
  <form>
    <div class="input-group mb-2">
	    <div class="input-group-prepend"><span class="input-group-text" style="width:70px">시작단</span></div>
	    <input type="number" name="startDan" value="${param.startDan}" autofocus class="form-control" />
	  </div>
	  <div class="input-group mb-2">
	    <div class="input-group-prepend"><span class="input-group-text" style="width:70px">끝 단</span></div>
	    <input type="number" name="endDan" value="${param.endDan}" class="form-control" />
	  </div>
	  <div class="input-group mb-2">
		  <div class="input-group-prepend"><span class="input-group-text">한줄에 표시할 단</span></div>
		  <input type="number" name="no" value="${param.no}" class="form-control" />
	  </div>
	  <div>
	    <div><input type="submit" value="계산" class="btn btn-success form-control"/></div>
    </div>
  </form>
  <hr/>
  <div id="demo">
    <c:set var="sDan" value="${param.startDan}"/>
    <c:set var="eDan" value="${param.endDan}"/>
    <c:set var="no" value="${param.no}"/>
    <c:set var="cnt" value="0"/>
    <c:set var="temp" value="0"/>
    <c:if test="${sDan+0 > eDan+0}">
      <c:set var="temp" value="${sDan}"/>
      <c:set var="sDan" value="${eDan}"/>
      <c:set var="eDan" value="${temp}"/>
    </c:if>
    <c:if test="${!empty sDan && !empty eDan}">
	    <table class="table table-bordered text-center">
	      <tr>
	      <c:forEach var="i" begin="${sDan}" end="${eDan}">
		        <td>
		          <table class="table">
		            <tr>
		            	<td>
							      * ${i} 단 *<br/>
							    	<c:forEach var="j" begin="1" end="9">
								      ${i} * ${j} = ${i * j}<br/>
								    </c:forEach>
					    		</td>
					    	</tr>
					    </table>
			      </td>
				    <c:set var="cnt" value="${cnt + 1}"/>
				    <c:if test="${cnt % no == 0}"></tr><tr></c:if>
		    </c:forEach>
		    </tr>
	    </table>
    </c:if>
  </div>
</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>