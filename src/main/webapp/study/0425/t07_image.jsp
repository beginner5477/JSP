<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t07.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>정적(static)파일 연습</h2>
  <p>JSP소스코드와는 별개로 webapp폴더아래 독립적으로 폴더를 만들어서 관리한다.</p>
  <p>종류 : js / css / image / 테플릿파일</p>
  <hr/>
  <div>
    <p>1.<img src="111.jpg" width="200px" /> (X)</p>
    <p>2.<img src="../../images/111.jpg" width="200px" /> (O)</p>
    <p>3.<img src="/images/111.jpg" width="200px" /> (X)</p>
    <p>4.<img src="/javaclass/images/111.jpg" width="200px" /> (O)</p>
    <p>5.<img src="<%=request.getContextPath()%>/images/111.jpg" width="200px" /> (O)</p>
    <p>6.<img src="<%=request.getContextPath()%>/images/112.jpg" width="200px" /> (O)</p>
    <p>7.<img src="<%=request.getContextPath()%>/images/113.jpg" width="200px" /> (O)</p>
    <p>
      <%
        for(int i=111; i<=113; i++) {
        	out.println("<div><img src='"+request.getContextPath()+"/images/"+i+".jpg' width='200px' ></div>");
        }
      %>
    </p>
  </div>
</div>
<p><br/></p>
</body>
</html>