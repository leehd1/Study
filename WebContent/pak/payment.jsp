<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container border" style="margin-top: 5%;">
<h2 style="margin-left: 10%; margin-top: 15px;">${param.card}카드</h2>
	<div class="row" style="margin-bottom: 20px; margin-top:20px;">
	<!-- 카드번호 -->
	<div class="col-md-auto">
	<div class="input-group-prepend">
      <span class="input-group-text" style="background-color: white; border: 0px;">카드번호&nbsp;</span>
    <input type="text" class="form-control" maxlength="4" style="width: 60px;">&nbsp;&nbsp;_&nbsp;&nbsp;
    <input type="text" class="form-control" maxlength="4" style="width: 60px;">&nbsp;&nbsp;_&nbsp;&nbsp;
    <input type="text" class="form-control" maxlength="4" style="width: 60px;">&nbsp;&nbsp;_&nbsp;&nbsp;
    <input type="text" class="form-control" maxlength="4" style="width: 60px;">
	</div>
	</div>
	</div>
	
	<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-auto">
	<div class="input-group-prepend">
      <span class="input-group-text" style="background-color: white; border: 0px;">유효 기간</span>
    <input type="text" class="form-control" maxlength="2" style="width: 60px;">
    <span class="input-group-text" style="background-color: white; border: 0px;">월</span>
    &nbsp;&nbsp;&nbsp;
    <input type="text" class="form-control" maxlength="2" style="width: 60px;">
    <span class="input-group-text" style="background-color: white; border: 0px;">년</span>
	</div>	
	</div>
	</div>
	
	<div class="row" style="margin-bottom: 20px;">
	<div class="col-md-auto">
	<div class="input-group-prepend">
		<span class="input-group-text" style="background-color: white; border: 0px;">PVC</span>
   	 <input type="text" class="form-control" maxlength="3" style="width: 60px; margin-left: 40px;">
   	</div>
    </div>
	</div>
	
	<div class="row justify-content-md-right">
	<div class="col-md-auto" style="margin-left: 60%;">
	<button class="btn btn-primary" onclick="sub()" style="width: 150px;">결 제</button>
	</div>
	</div>
	<!-- 카드번호 끝 -->
	<br>
	<!-- 유효 기간 -->
	
	<!-- 유효 기간 끝 -->
	
</div>
<script type="text/javascript">
	function sub(){
		window.close();
		opener.parent.appchk(); 
	    
	}
</script>
</body>
</html>