<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t02_1.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>성적 자료</h2>
  <form name="myform" method="post" action="<%=request.getContextPath()%>/j0426/T02Ok">
  	<p>성명 : <input type="text" name="name" value="홍길동" class="form-control" autofocus /></p>
  	<p>학번 : <input type="text" name="hakbun" value="MS1234" class="form-control"/></p>
  	<p>국어 : <input type="text" name="kor" value="100" class="form-control"/></p>
  	<p>영어 : <input type="text" name="eng" value="90" class="form-control"/></p>
  	<p>수학 : <input type="text" name="mat" value="80" class="form-control"/></p>
  	<p>사회 : <input type="text" name="soc" value="70" class="form-control"/></p>
  	<p>과학 : <input type="text" name="sci" value="60" class="form-control"/></p>
  	<p>
  		<input type="submit" value="계산" class="btn btn-success mr-3" />
  		<input type="reset" value="다시입력" class="btn btn-warning" />
  	</p>
  </form>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>