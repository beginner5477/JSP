<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>test11.jsp</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>test11.jsp</h2>
  <form name="myform" method="post" action="/javaclass/T11">
  	<div>수1
  	  <input type="number" name="su1" value="100" class="form-control"/>
  	</div>
  	<div>수2
  	  <input type="number" name="su2" value="100" class="form-control"/>
  	</div>
  	<p><input type="submit" value="계산" class="btn btn-success" /></p>
  </form>
</div>
<p><br/></p>
</body>
</html>