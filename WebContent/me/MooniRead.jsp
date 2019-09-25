<%@page import="com.board.packboardDB.questionDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%-- css --%>
<link rel="stylesheet" href="./css/style.css">
<title>Insert title here</title>
</head>
<%
	questionDTO dto = (questionDTO)request.getAttribute("dto");
	SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd");
	String id = (String)request.getAttribute("id");
%>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main">
    <div class="container" style="margin-top: 10em;">
<!--         <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">예약상황 및 확인</h1> -->
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <div>
            	<div style="margin: 1em;"><%=dto.getQtitle() %></div><span style="float: right; margin: 2em;">
            			작성일 : <%=s.format(dto.getDate()) %>
            	</span>
            </div>
            <div class="dush" style=""></div>
            	<div style="margin: 10px"> [질문유형 ] <%=dto.getQcate() %> </div>
            	
            <div class="card card-body content" style="margin: 2em;">
            <div>
            	<img alt="" src="${contextpath}/img/<%=dto.getQfilerealname()%>">
            </div>
            <br>
            	<%=dto.getQcontent() %>
           	</div>
            </div>
            <br><br><br>
            <div style="margin: 2em;">
            	<h3>답글
					<input type="button" class="btn btn-info" value="목록보기" onclick="location='./MemberMooni.me'" style="float: right; height: auto;">
            	</h3>
            	<form action="#" method="post">
            	<div class="input-group mb-3">
				  <textarea class="form-control" aria-label="With textarea" name="recontent"></textarea>
				  <div class="input-group-prepend">
				    <button class="btn btn-outline-secondary" id="button-addon2">등록</button>
				  </div>
				</div>
            	</form>
            </div>
            
        </div>
    </div>
</section>

<%--footer.start --%>
	<div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>
	<%--footer.end --%>

</body>
</html>