<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/findpw.css">
<link rel="stylesheet" href="../css/style.css">
<title>Insert title here</title>
	
</head>
<body class="findpw_body">

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
<section role="main" style="margin-top: 10em;">

<div class="row justify-content-md-center">
	<div class="col-md-auto"></div>
	<div class="col-md-auto"><br><br><br><br><br><br>
    <div class="container findpw_container" style="background-color: white;">
  	
                <form method="post">
                
                <h1 align="center"><br>Find Password</h1><br><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-auto">
  						<div class="input-group-text findpw_text" style="width: auto;">&nbsp;이 메 일&nbsp;</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="text" class="form-control" placeholder="" aria-label="Recipient's username" aria-describedby="button-addon2"
  						style="width: 500px; height: 40px;">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-auto">
  						<div class="input-group-text findpw_text" style="width: auto;">&nbsp;아 이 디&nbsp;</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="text" class="form-control" placeholder="" aria-label="Recipient's username" aria-describedby="button-addon2"
  						style="width: 500px; height: 40px;">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-auto">
  						<div class="input-group-text findpw_text" style="width: auto;">&nbsp;&nbsp;이&nbsp; 름&nbsp;&nbsp;&nbsp;&nbsp;</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="password" class="form-control" placeholder="" aria-label="Recipient's username" aria-describedby="button-addon2"
  						style="width: 500px; height: 40px;">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br><br>
     
        		<div class="row justify-content-md-center">
  					<div class="col-md-auto"></div>
  					<div class="col-md-7"> 
  						<button type="submit" class="findpw_findbutton">전 송</button><br><br>
  						</div>
  					<div class="col-md-auto"></div>
        		</div><br>
  			</form>
  				
		</div>
</div>
<div class="col-md-auto"></div>

              
          
 </div>
    
</section>

	


</body>
</html>