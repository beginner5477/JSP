<%@ page import="study.j0429.MemberVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>jstl4_function.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
  <h2>JSTL function연습</h2>
  <div class="text-right">
    <button type="button" onclick="location.href='jstl1.jsp';" class="btn btn-primary btn-sm">JSTL core라이브러리</button>
    <button type="button" onclick="javascript:location.href='jstl2.jsp';" class="btn btn-success btn-sm">JSTL반복문</button>
    <button type="button" onclick="location.href='jstl3_vo.jsp';" class="btn btn-info btn-sm">JSTL 반복문응용</button>
    <button type="button" onclick="location.href='jstl5_format.jsp';" class="btn btn-secondary btn-sm">JSTL Formatting</button>
  </div>
	<hr/>

	<h2>JSTL Function 라이브러리</h2>
	<pre>
	  사용법 : $ { fn:함수명(변수/값,....) }
	  관계연산자 : ==(eq), !=(ne), >(gt), <(lt), >=(ge), <=(le)
	</pre>
<%
  String str = "Welcome to My Homepage!!!";
	pageContext.setAttribute("str", str);
	
	String[] hobbys = {"등산","낚시","수영","독서","바둑","승마","바이크","수집","영화감상"};
	pageContext.setAttribute("hobbys", hobbys);
	
	ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
	
	MemberVO vo = null;
	
	vo = new MemberVO();
	vo.setName("홍길동");
	vo.setAge(25);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("서울");
	vos.add(vo);
	
	request.setAttribute("vo", vo);
	
	vo = new MemberVO();
	vo.setName("김말숙");
	vo.setAge(33);
	vo.setGender("여자");
	vo.setJob("회사원");
	vo.setAddress("청주");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("이기자");
	vo.setAge(30);
	vo.setGender("남자");
	vo.setJob("공무원");
	vo.setAddress("제주");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("소나무");
	vo.setAge(53);
	vo.setGender("여자");
	vo.setJob("군인");
	vo.setAddress("인천");
	vos.add(vo);
	
	vo = new MemberVO();
	vo.setName("고인돌");
	vo.setAge(13);
	vo.setGender("남자");
	vo.setJob("학생");
	vo.setAddress("청주");
	vos.add(vo);
	
	pageContext.setAttribute("vos", vos);
%>
  <hr/>
  <div>
    str변수의 값? ${str}<br/>
    1-1.str변수의 길이(length)? <%=str.length() %> / ${fn:length(str)}<br/>
    1-2.hobbys변수의 길이(length)? <%=hobbys.length %> / ${fn:length(hobbys)}<br/>
    1-3.vos변수의 길이(length)? <%=vos.size() %> / ${fn:length(vos)}<br/>
    <hr/>
    2-1.대문자변환(toUpeerCase()) : <%=str.toUpperCase() %> / ${fn:toUpperCase(str)}<br/>
    2-2.소문자변환(toLowerCase()) : <%=str.toLowerCase() %> / ${fn:toLowerCase(str)}<br/>
    <hr/>
    3-1.문자열추출(substring()) : <%=str.substring(0,5) %>	/ ${fn:substring(str, 0, 5)}<br/>
    3-2.문자열추출(substring()) : <%=str.substring(5) %>	/ 
																		<%-- ${fn:substring(str, 5)} --%>
																		${fn:substring(str, 5, fn:length(str))} / ${fn:substring(str, 5, -1)}
																		<br/>
		4-1.특정문자의 위치값(indexOf) : <%=str.indexOf("o") %> / ${fn:indexOf(str, 'o')}<br/>
		4-2.특정문자의 위치값(lastIndexOf) : <%=str.lastIndexOf("o") %> / <%-- ${fn:lastIndexOf(str, 'o')} --%> <br/>
		4-3.str변수의 값중에서 'o'문자가 들어있는 모든 위치를 출력하세요<br/>
		<c:set var="cnt" value="0" />
		<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
		  <c:if test="${fn:substring(str,i,i+1) == 'o'}">
		    <c:set var="cnt" value="${cnt + 1}" />
				${cnt}번째 'o'의 위치값은? ${i}<br/>
		  </c:if>
		</c:forEach>
		str변수의 'o'문자의 개수는 ${cnt} 개 있습니다.<br/>
		
		4-4. str변수의 'o'문자의 2번째 위치값만 출력하시오?<br/>
		- (1) str 변수에 기억된 문자중 'o'의 위치를 찾아서 변수에 기억시켜둔다. :
    <c:set var="position1" value="${fn:indexOf(str,'o')}"/> <font color='red'><b>${position1}</b></font><br/>
    - (2) substring()을 사용한, 첫번째로 만나는 'o'의 문자 뒤의 모든값을 변수에 담는다 :
    <c:set var="str1" value="${fn:substring(str,fn:indexOf(str,'o')+1,fn:length(str))}"/>
    <font color='red'><b>${str1}</b></font><br/>
    - (3) 이어서 저장되어 있는 값중에서 'o'문자의 위치를 변수에 담는다. : 
    <c:set var="position2" value="${fn:indexOf(str1,'o')}"/><font color='red'><b>${position2}</b></font><br/>
    - (4) 처음에 저장된 위치와 2번째 저장된 위치를 더하고 +1 시키면 2번째 'o'의 위치가 된다. : 
    <font color='red'><b>${position1 + position2 + 1}</b></font><br/>
    4-4-2. 4-4의 두번째방법(문법5의 방법사용 : substringAfter()) : 
    <font color='red'><b>${fn:indexOf(str,fn:substringAfter(fn:substringAfter(str,'o'),'o'))-1}</b></font><br/><br/>
    <br/>
		<br/>
		
		4-5. str변수의 'o'문자의 마지막 위치값을 출력하시오?<br/>
    - split()함수 사용하기 : <br/>
    <c:set var="strTemps" value="${fn:split(str,'o')}"/>
    <c:set var="strTempsLength" value="${fn:length(strTemps)}"/>
    마지막 'o'문자뒤의 모든 문자열? ${strTemps[strTempsLength-1]}<br/>
    마지막 'o'문자의 위치? <font color='red'><b>${(fn:length(str)-1) - (fn:length(strTemps[strTempsLength-1]))}</b></font>
    <br/>
		- forEach활용한 전체문자의 1대1 비교<br/>
		<c:set var="idx" value="0"/>
		<c:forEach var="i" begin="0" end="${fn:length(str)-1}">
		  <c:if test="${fn:substring(str,i,i+1)=='o'}">
		    <c:set var="idx" value="${i}"/>
		  </c:if>
		</c:forEach>
	  마지막 'o'문자의 위치? <font color="red"><b>${idx}</b></font><br/>
		<br/>
		<hr/>
		
		5. 문자열추출(substringBefore() / substringAfter())<br/>
		문자 'o'앞의 문자열을 출력? ${fn:substringBefore(str, 'o')}<br/>
		문자 'o'뒤의 문자열을 출력? ${fn:substringAfter(str, 'o')}<br/>
		~~~~~ 2번째 'o'의 위치값을 출력??? ~~~~<br/>
		
		<hr/>
		
		6. 문자열분리(split(변수, 분리할문자)) : 문자열분리후에는 분리된 문자들이 모두 변수에 담아줘야한다. 즉, 이변수는 배열(?)이 된다.<br/>
		예) str변수안의 문자열중에서 'o'를 기준으로 분리해서 출력하시오?<br/>
		<c:set var="strs" value="${fn:split(str, 'o')}"/>
		<c:forEach var="s" items="${strs}" varStatus="st">
			${st.count}. ${s}<br/>
		</c:forEach>
		str변수의 'o'문자의 개수? ${fn:length(strs) - 1} 개 있습니다.<br/>
		<hr/>
		
		7. 치환(replace())<br/>
		예) str변수안의 'o' 를 'O'로 치환..?
		<%=str.replace("o", "O") %> / ${fn:replace(str, 'o', 'O')}<br/>
		<hr/>
		
		8. 특정문자열의 포함유무? contains()<br/>
		예1) str변수에 'My'가 포함유무? ${fn:contains(str, 'My')}<br/>
		예2) str변수에 'my'가 포함유무? ${fn:contains(str, 'my')}<br/>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>