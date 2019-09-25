<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextpath}/css/findid.css">
<link rel="stylesheet" href="${contextpath}/css/style.css">
<title>Insert title here</title>

</head>
<body class="findid_body">

			<% 
			String contextpath = request.getContextPath();
        	%>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
<section role="main" style="margin-top: 10em;">

<div class="row justify-content-md-center">
	<div class="col-md-auto"></div>
	<div class="col-md-auto"><br><br><br><br><br><br>
    <div class="container findid_container" style="background-color: white;">
  	
                <form action="${contextpath}/MemberFindIdAction.me" method="post">
                
                <h1 align="center"><br>Find ID</h1><br><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-auto">
  						<div class="input-group-text findid_text">&nbsp;E-mail&nbsp;</div>
  					</div>
  					<div class="col-md-5"> 
  						<div class="input-group-prepend">
  						<input type="text" class="form-control sh_form-control email" placeholder="name"
  						style="width: 500px; height: 40px; margin-top: 12px;">
  						</div></div>
  					<div class="col-md-auto">
  						<button type="button" class="findid_loginbutton btn_find">Search</button>
 					</div>
 					<div class="col-md-1"></div>
        		</div><br><br>
					<h2 align="center">Your ID</h2><br>
        		<div class="row justify-content-md-center">
        		<div class="col-md-1"></div>
  					<div class="col-md-auto"></div>
  					<div class="col-md-auto"> 
  						<p class="findid_id">
  							
  						</p>
  						</div>
  					<div class="col-md-auto"></div>
  					<div class="col-md-1"></div>
        		</div><br><br><br>
  			</form>
  				
		</div>
</div>
<div class="col-md-auto"></div>

              
          
 </div>
    
</section>

	<script type="text/javascript">
		$(".btn_find").on("click",function(){
	        var email = $(".email").val();
	        
	        if(email == ""){
	        	alert("빈칸");
	        }else{
	           $.ajax({
	        	   type:"post",
	        	   url:"/teamproj/findid.fi",
	        	   data:{email:email},
	                 success:function(data,textStatus){
	                    if(data == '0'){
	                    	$(".findid_id").html("없는 이메일 이메일확인해");
	                    }else{
	                       $(".findid_id").html(data);
	                    }
	                 },
	                 error:function(err,textStatus){
	                    alert("에러발생");
	                 }
	           });
	           
	        }
	     });
		
	</script>

</body>
</html>