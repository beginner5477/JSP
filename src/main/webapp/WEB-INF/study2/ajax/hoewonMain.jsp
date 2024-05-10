<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file = "/include/certification.jsp" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>hoewonMain.jsp</title>
  <%@ include file = "/include/bs4.jsp" %>
  <style>
    th {
      background-color: #eee;
      text-align: center;
    }
  </style>
  <script>
    'use strict';
    
    // 회원 가입처리
    function hInput() {
    	let mid = $("#mid").val().trim();
    	let pwd = $("#pwd").val().trim();
    	let name = $("#name").val().trim();
    	let age = $("#age").val().trim();
    	let gender = myform.gender.value;
    	let address = $("#address").val().trim();
    	
    	if(mid == "") {
    		alert("아이디를 입력하세요");
    		$("#mid").focus();
    		return false;
    	}
    	else if(pwd == "") {
    		alert("비밀번호를 입력하세요");
    		$("#pwd").focus();
    		return false;
    	}
    	else if(name == "") {
    		alert("성명을 입력하세요");
    		$("#name").focus();
    		return false;
    	}
    	else if(age == "") {
    		alert("나이를 입력하세요");
    		$("#age").focus();
    		return false;
    	}
    	else if(address == "") {
    		alert("주소를 입력하세요");
    		$("#address").focus();
    		return false;
    	}
    	
    	let query = {
    			mid     : mid,
    			pwd     : pwd,
    			name    : name,
    			age     : age,
    			gender  : gender,
    			address : address
    	}
    	
    	$.ajax({
    		url  : "${ctp}/hoewonInput.st",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res == "1") {
    				alert("회원 등록 완료!!!");
    				location.reload();
    			}
    			else {
    				alert(res);
    				$("#mid").focus();
    			}
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
    }
    
    // 회원 개별 조회
    function hoewonSearch(idx) {
    	$.ajax({
    		url  : "hoewonSearch.st",
    		type : "post",
    		data : {idx : idx},
    		success:function(res) {
    			let str = res.split("/");
    			
    			$("#idx").val(str[0]);
    			$("#mid").val(str[1]);
    			$("#pwd").val(str[2]);
    			$("#name").val(str[3]);
    			$("#age").val(str[4]);
    			$("#address").val(str[6]);
    			if(str[5] == "남자") $("input[id=male]").prop('checked',true);
    			else $("input[id=female]").prop('checked',true);
    			
    			$("#mid").attr("readonly", true);
    		},
    		error : function() {
    			alert("전송오류~~~");
    		}
    	});
    }
    
    // 회원정보 수정하기
    function hUpdate() {
    	let mid = $("#mid").val();
    	let pwd = $("#pwd").val().trim();
    	let name = $("#name").val().trim();
    	let age = $("#age").val().trim();
    	let gender = myform.gender.value;
    	let address = $("#address").val().trim();
    	
    	if(pwd == "") {
    		alert("비밀번호를 입력하세요");
    		$("#pwd").focus();
    		return false;
    	}
    	else if(name == "") {
    		alert("성명을 입력하세요");
    		$("#name").focus();
    		return false;
    	}
    	else if(age == "") {
    		alert("나이를 입력하세요");
    		$("#age").focus();
    		return false;
    	}
    	else if(address == "") {
    		alert("주소를 입력하세요");
    		$("#address").focus();
    		return false;
    	}
    	
    	let query = {
    			mid     : mid,
    			pwd     : pwd,
    			name    : name,
    			age     : age,
    			gender  : gender,
    			address : address
    	}
    	
    	$.ajax({
    		url  : "${ctp}/hoewonUpdate.st",
    		type : "post",
    		data : query,
    		success:function(res) {
    			if(res != "0") {
    				alert("회원 정보 수정 완료!!!");
    				// location.reload();  // 전체화면 reload...
    				
    				$("#hoewonList").load(location.href = ' #hoewonList');  // 부분 reload()
    			}
    			else {
    				alert("수정 실패~~");
    				$("#pwd").focus();
    			}
    		},
    		error : function() {
    			alert("전송오류~~");
    		}
    	});
    }
    
    // 회원 정보 삭제
    function hoewonDelete(idx) {
    	let ans = confirm("선택된 회원을 삭제하시겠습니까?");
    	if(!ans) return false;
    	
    	$.ajax({
    		url  : "${ctp}/hoewonDelete.st",
    		type : "post",
    		data : {idx : idx},
    		success:function(res) {
    			if(res != "0") {
    				alert("삭제되었습니다.");
    				location.reload();
    			}
    			else alert("삭제 실패~~~");
    		},
    		error : function() {
    			alert("전송 오류~~");
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
  <h2>AJax를 이용한 CRUD 구현하기</h2>
  <form name="myform">
    <table class="table table-bordered">
      <tr>
        <th>아이디</th>
        <td><input type="text" name="mid" id="mid" class="form-control" autofocus /></td>
      </tr>
      <tr>
        <th>비밀번호</th>
        <td><input type="password" name="pwd" id="pwd" class="form-control"/></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" id="name" class="form-control"/></td>
      </tr>
      <tr>
        <th>나이</th>
        <td><input type="number" name="age" id="age" class="form-control"/></td>
      </tr>
      <tr>
        <th>성별</th>
        <td>
        	<input type="radio" name="gender" id="male" value="남자" /> 남자 &nbsp;&nbsp;
        	<input type="radio" name="gender" id="female" value="여자" checked /> 여자
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="address" id="address" class="form-control"/></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
          <input type="button" value="회원등록" onclick="hInput()" class="btn btn-success mr-2"/>
          <input type="reset" value="다시입력" class="btn btn-primary mr-2"/>
          <input type="button" value="회원수정" onclick="hUpdate()" class="btn btn-info mr-2"/>
          <input type="button" value="전체보기" onclick="location.href='hoewonList.st';" class="btn btn-secondary"/>
        </td>
      </tr>
    </table>
  </form>
  <hr/>
  <h2>회 원 전 체 리 스 트</h2>
  <div id="hoewonList">
	  <table class="table table-hover text-center">
	    <tr class="table-dark text-dark">
	      <th>번호</th>
	      <th>아이디</th>
	      <th>비밀번호</th>
	      <th>성명</th>
	      <th>나이</th>
	      <th>성별</th>
	      <th>주소</th>
	      <th>비고</th>
	    </tr>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${vo.idx}</td>
	        <td>${vo.mid}</td>
	        <td>${vo.pwd}</td>
	        <td>${vo.name}</td>
	        <td>${vo.age}</td>
	        <td>${vo.gender}</td>
	        <td>${vo.address}</td>
	        <td>
	          <a href="javascript:hoewonSearch(${vo.idx})" class="btn btn-success btn-sm">개별조회</a>
	          <a href="javascript:hoewonDelete(${vo.idx})" class="btn btn-danger btn-sm">삭제</a>
	        </td>
	      </tr>
	    </c:forEach>
	    <tr><td colspan="8" class="m-0 p-0"></td></tr>
	  </table>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>