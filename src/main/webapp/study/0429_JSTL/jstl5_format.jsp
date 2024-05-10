<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jstl5_format.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>JSTL Framt연습</h2>
  <div class="text-right">
    <button type="button" onclick="location.href='jstl1.jsp';" class="btn btn-primary btn-sm">JSTL core라이브러리</button>
    <button type="button" onclick="javascript:location.href='jstl2.jsp';" class="btn btn-success btn-sm">JSTL반복문</button>
    <button type="button" onclick="location.href='jstl3_vo.jsp';" class="btn btn-info btn-sm">JSTL 반복문응용</button>
    <button type="button" onclick="location.href='jstl4_function.jsp';" class="btn btn-secondary btn-sm">JSTL Functon</button>
  </div>
	<hr/>

	<pre>
	  사용용도 : 형식문자열을 표현(지정)할때 사용한다.(예: 쉼표, 통화량(화폐)단위, 백분율..., 날짜형식....)
	  사용법 : < fmt : 명령어... value="$ {값/변수}" pattern="표현패턴" [type="화폐단위"] />
	</pre>
	<c:set var="won1" value="7654321"/>
	<c:set var="won2" value="7654.561"/>
	<div>
	  won1 : ${won1} / won2 : ${won2}<br/>
	  <hr/>
	  1. 천단위 쉼표 : <br/>
	  <fmt:formatNumber value="${won1}" /> : <fmt:formatNumber value="${won2}" /> | <fmt:formatNumber value="7654321" /><br/>
	  <fmt:formatNumber value="${won1}" pattern="0,000" /> : <fmt:formatNumber value="${won2}" pattern="0,000" /><br/>
	  <fmt:formatNumber value="${won1}" pattern="0,000.0" /> : <fmt:formatNumber value="${won2}" pattern="0,000.0" /><br/>
	  <fmt:formatNumber value="${won1}" pattern="#,##0.0" /> : <fmt:formatNumber value="${won2}" pattern="#,##0.0" /><br/> <!-- 서식기호 '#'은 의미가없는 0을 표시하지 않는다. -->
	  <hr>
	  
	  2.화폐단위<br/>
	  원화 : <fmt:formatNumber value="${won1}" type="currency" /><br/>
	  US달러1 : <fmt:formatNumber value="${won1}" type="currency" currencyCode="USD" /><br/>
	  US달러2 : $<fmt:formatNumber value="${won2}" type="currency" pattern="#,##0.00" currencyCode="USD" /><br/>
	  <hr/>
	  
	  3. 백분율<br/>
	  <c:set var="per" value="0.98765"/>
	  원본 : ${per}<br/>  
	  백분율1 : <fmt:formatNumber value="${per}" type="percent" /><br/>
	  백분율2 : <fmt:formatNumber value="${per}" type="percent" pattern="0.0%" />
	  <hr/>
	  
	  <b>4. 날짜</b><br/>
	  오늘날짜1 : <%=new Date() %><br/>
	  <c:set var="today" value="<%=new Date() %>" /><br/>
	  오늘날짜2 : ${today} : <fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /><br/>
	  오늘날짜3 : ${today} : <fmt:formatDate value="${today}" pattern="yyyy-MM" /><br/>
	  오늘날짜4 : ${today} : <fmt:formatDate value="${today}" pattern="MM-dd" /><br/>
	  오늘날짜5 : ${today} : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일" /><br/>
	  현재시간1 : <fmt:formatDate value="${today}" pattern="hh : mm : ss" /><br/>
	  현재시간2 : <fmt:formatDate value="${today}" pattern="hh시 mm분 ss초" /><br/>
	  현재날짜시간 : <fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초" /><br/>
	  <hr/>
	  
	  5. 국가별설정(로케일)<br/>
	  톰캣서버의 기본 로케일 : <%=response.getLocale() %><br/>
	  톰캣버서의 기본 로케일을 미국식으로 변경 : <fmt:setLocale value="en_US" />
	      <fmt:formatNumber value="${won1}" type="currency" />
	  <hr/>
	  
	  6. URL이동 : location.href = '';    ==>>>  redirect   : core에 있음 (예1: < c : redirect url='경로' />)
	     예2) < c : redirect url='경로' >
	     				< c : param name="변수명" value="값" />
	     			< / c : redirect >
	  
	  7. import : core..에 있음
	  <c:import url="/include/bs4.jsp" />
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>