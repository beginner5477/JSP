<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>t03.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>값 전송 연습(Get/Post)</h2>
  <form name="myform" method="post" action="/javaclass/T03Ok">
  	<div>성명
  	  <!-- <input type="text" name="name" value="홍길동" class="form-control mb-3" autofocus required /> -->
  	  <input type="text" name="name" class="form-control mb-3" autofocus />
  	</div>
  	<div>나이
  	  <!-- <input type="text" name="age" value="20" class="form-control mb-3" required /> -->
  	  <input type="text" name="age" class="form-control mb-3" />
  	</div>
  	<div>
  	  <input type="submit" value="전송(submit)" class="btn btn-success"/>
  	</div>
  </form>
</div>
<p><br/></p>
</body>
</html>