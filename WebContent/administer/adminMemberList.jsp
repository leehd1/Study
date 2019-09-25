<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath }"/>
    
	<c:set var="list" value="${list}"/>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">

	function update(val) {
		
		var name = document.getElementById("name"+val).value;
		var email = document.getElementById("email"+val).value;
		var level = document.getElementById("level"+val).value;
		var travel_agency_no = document.getElementById("travel_agency_no"+val).value;
		var num = document.getElementById("num"+val).value;
		
		location.href = "${contextpath}/adminMemberUpdate.ad?name=" + name + "&email=" + email +"&level=" + level + "&travel_agency_no="+ travel_agency_no  + "&num="+ num; 
	}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%-- 부트스트랩 링크 --%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%-- style.css링크 --%>
<link rel="stylesheet" href="./css/style.css">

<title>Insert title here</title>
<style type="text/css">
input:focus {
  outline: none !important;
}

</style>
</head>
<body>
<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

    <div class="container fst_container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">회원 리스트 관리</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
			<table class="table">
				<tr class="text-center">
					<th>아이디</th>
					<th>이름</th>
					<th>E-mail</th>
					<th>LEVEL</th>
					<th>관리NO.</th>
					<th>가입일</th>
					<th></th>
				</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>
						<input id="id${list.num}" value="${list.id}" class="form-control" style="border: 0;" readonly="readonly">
					</td>
					<td>
						<input id="name${list.num}" value="${list.name}" class="form-control" style="border: 0;">
					</td>
					<td>
						<input id="email${list.num}" value="${list.email}" class="form-control" style="border: 0;"> 
					</td>
					<td>
						<input id="level${list.num}" value="${list.level}" class="form-control" style="border: 0;">
					</td>
					<td>
						<input id="travel_agency_no${list.num}" value="${list.travel_agency_no }" class="form-control" style="border: 0;" readonly="readonly">
					</td>
					<td>
						<input id="regdate${list.num}" value="${list.date}" class="form-control" style="border: 0;" readonly="readonly">
						<input type="hidden" id="num${list.num}" value="${list.num}">
					</td>
					<td>
						<button onclick="update(${list.num})" class="btn btn-secondary">∨</button>
					</td>
				</tr>
			</c:forEach>
			</table>        
        
        </div>
	</div>
	
	<%--footer.start --%>
	<div>
		<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>
	<%--footer.end --%>
</body>
</html>