<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t02Res.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
<div class="container">
  <h2>성적 처리 결과</h2>
  <hr/>
	<p>성명 : ${vo.name} / ${param.name}</p>  
	<p>학번 : ${vo.hakbun} / ${param.hakbun}</p>  
	<p>국어 : ${vo.kor} / ${param.kor}</p>  
	<p>영어 : ${vo.eng} / ${param.eng}</p>  
	<p>수학 : ${vo.mat} / ${param.mat}</p>  
	<p>사회 : ${vo.soc} / ${param.soc}</p>  
	<p>과학 : ${vo.sci} / ${param.sci}</p>  
	<p>총점 : ${vo.tot} / ${param.tot}</p>  
	<p>평균 : ${vo.avg} / ${param.avg}</p>  
	<p>학점 : ${vo.grade} / ${param.grade}</p>  
  <hr/>
  <p><a href="<%=request.getContextPath()%>/study/0426/t02.jsp" class="btn btn-warning">돌아가기</a></p>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>