<%@page import="com.member.DB.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/memberinfo.css">
<link rel="stylesheet" href="${contextpath}/css/style.css">
<title>Insert title here</title>
<style type="text/css">
.memberinfo_body{
   background: linear-gradient(to left, #fcbf92, #ff6d2f);   
}

.memberinfo_container{
   border-radius: 10px 10px 10px 10px;
   box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
}

.memberinfo_text{
   width: 25%;
   
      text-align: center;
      font-size: 110%;
      background: white;
      border: 0px solid #F78536 !important;
      color: #f78536;
      margin-right: 1px;
      font-weight: bold;
      text-shadow: 3px 2px #E6E6E6;
}

.memberinfo_button{
   color: #Fcfcfc;
      border: 1px solid #F78536 !important;
      padding: 8px 20px;
      width: 100%;
      background-color: #f78536; 
      font-size: 17px;
      border-radius: 10px 10px 10px 10px;
}

.memberinfo_button:HOVER {
   box-shadow: 0 0 30px rgba(255, 153, 051, 1);
}
</style>	
</head>
<body class="memberinfo_body">


			<% 
        	MemberBean mb = (MemberBean)request.getAttribute("mb");
        	%>
	

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
<section role="main" style="margin-top: 10em;">

<div class="row justify-content-md-center">
	<div class="col-md-auto"></div>
	<div class="col-md-auto"><br><br><br><br><br><br>
    <div class="container memberinfo_container" style="background-color: white;">
  	
                <form action="${contextpath}/MemberModifyAction.me" method="post">
                
                <h1 align="center"><br>Member info</h1><br><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-2">
  						<div class="input-group-text memberinfo_text" style="width: auto;">&nbsp;아 이 디&nbsp;</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="text" readonly="readonly" class="form-control sh_form-control" placeholder=""
  						style="width: 500px; height: 40px;" name="id" value="<%=mb.getId() %>">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-2">
  						<div class="input-group-text memberinfo_text" style="width: auto;">&nbsp;이 메 일&nbsp;</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="text" class="form-control sh_form-control" placeholder=""
  						style="width: 500px; height: 40px;" name="email" value=<%=mb.getEmail() %>>
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-2">
  						<div class="input-group-text memberinfo_text" style="width: auto;">&nbsp;비 밀 번 호&nbsp;</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="password" class="form-control sh_form-control" placeholder=""
  						style="width: 500px; height: 40px;" name="pw">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-2">
  						<div class="input-group-text memberinfo_text" style="width: auto;">비밀번호확인</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="password" class="form-control sh_form-control" placeholder=""
  						style="width: 500px; height: 40px;" name="pw2">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br>
        		<div class="row justify-content-md-center">
  					<div class="col-md-1"></div>
  					<div class="col-md-2">
  						<div class="input-group-text memberinfo_text" style="width: auto;">이 름</div>
  					</div>
  					<div class="col-md-6"> 
  						<div class="input-group-prepend">
  						<input type="text" class="form-control sh_form-control" placeholder=""
  						style="width: 500px; height: 40px;" name="name" value="<%=mb.getName() %>">
  						</div></div>
  					<div class="col-md-2"></div>
        		</div><br><br>
        		
        		<div class="row justify-content-md-center">
  					<div class="col-md-auto"></div>
  					<div class="col-md-3"> 
  						<button type="submit" class="memberinfo_button">수 정</button><br>
  					</div>
  					<div class="col-md-3"> 
  						<button type="button" class="memberinfo_button" onclick="location='${contextpath}/main/index.jsp'">취 소</button><br><br>
  					</div>
  					<div class="col-md-auto"></div>
        		</div><br>
  			</form>
  			
  				
		</div>
</div>
</div>

    
</section>

	


</body>
</html>