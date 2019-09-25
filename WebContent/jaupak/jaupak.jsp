<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="refresh" content="6; url=${path}/main/index.jsp">

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>

<%-- style.css링크 --%>
<link rel="stylesheet" href="./css/style.css">
<title>Insert title here</title>
<style type="text/css">
	footer{
	position:absolute;
    bottom:0;
    width: 100%;
	}
</style>
<script type="text/javascript">
	
$(document).ready(function() {
	    
	    var timer = 5;
	    var seconds;
	    
	    var interval = setInterval(function(){
	        seconds = parseInt(timer % 60, 10);
	      
	        seconds = seconds < 10 ? "" + seconds : seconds;
	      
	        $('#id').text(seconds);
	        --timer;
	    }, 1000);
	})

</script>
</head>
<body>
<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
	<center>
	<img alt="junbi" src="./images/junbi.jpg" style="padding-top: 11em;" ><br>
	<h2><span id="id">5</span>초 후에 메인 페이지로 이동됩니다.</h2>
	</center>
<%--footer.start --%>
	<div>
	<jsp:include page="../inc/footer.jsp"/>
	</div>
	<%--footer.end --%>
	
</body>
</html>