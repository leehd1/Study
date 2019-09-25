<%@page import="com.administer.DB.sellerAdminDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath }"/>
    
	<c:set var="list" value="${list}"/>
	<%
		request.setCharacterEncoding("utf-8");
	%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 부트스트랩 링크 --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%-- style.css링크 --%>
<link rel="stylesheet" href="./css/style.css">
<title>Insert title here</title>
</head>
<body>
<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
<section>
    <div class="container fst_container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">판매자 등록요청 리스트</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
        	<div class="card card-body">
	        	<form action="${contextpath}/concent.ad">
	        		<table class="table text-center" style="font-size: 0.8em;">
	        			<tr class="table-active">
	        				<th>요청 아이디</th>
	        				<th>여행사 이름</th>
	        				<th>E-mail</th>
	        				<th>휴대폰번호</th>
	        				<th>팩스번호</th>
	        				<th>상담 가능 시간</th>
	        				<th>관리번호</th>
	        				<th width="7%">승낙</th>
	        				<th width="10%">거부</th>
	        			</tr>
						<c:forEach var="list" items="${list}">
						<tr>
							<td><c:out value="${list.sellerid}"/></td>
							<td><c:out value="${list.sellername }"/></td>
							<td><c:out value="${list.selleremail }"/></td>
							<td><c:out value="${list.sellerphonenum }"/></td>
							<td><c:out value="${list.sellerfaxnum}"/></td>
							<td><c:out value="${list.sellertravel_agency_consulting_time}"/></td>
							<td><c:out value="${list.sellertravel_agency_no}"/></td>
							<td>
								<input type="hidden" value="<c:out value='${list.sellerid}'/>" name="sellerid">
								<input type="hidden" value="<c:out value='${list.sellertravel_agency_no}'/>" name="sellerInsert_no">
								<input type="submit" value="확인" class="btn btn-primary">  
							</td>
							<td>
								<button type="button" class="btn btn-primary" onclick="location='${contextpath}/reject.ad?sellerInsert_no=<c:out value="${list.sellertravel_agency_no}"/>'">거부</button>
							</td>
						</tr>
						</c:forEach>
	        		</table>
	        	</form>
        	</div>
        </div>
    </div>
</section>
</body>
</html>