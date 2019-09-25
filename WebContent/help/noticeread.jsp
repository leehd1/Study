<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.board.packboardDB.packnoboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<%
	packnoboardDTO bdto = (packnoboardDTO)request.getAttribute("bdto");
	
	SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd");
%>
</head>
<body>
	
	<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<%-- header.end --%>
	
	<div class="container fst_container">
	<h1 class="h2 mt-2 mb-2 pb-2 border-bottom">Content</h1>
		
		<div class="align-items-center p-3 my-3 rounded shadow">
			<table class="table">
				<tr>
					<th class="text-center" width="10%" class="table-primary">제목</th>
					<td><%=bdto.getNotitle() %></td>
				</tr>
			</table>
			<table class="table table-borderless" style="border-bottom: 1px;">
				<tr align="left">
					<td width="60%"></td>
					<td width="10%">작성일 : </td>
					<td width="10%"><%=s.format(bdto.getDate()) %></td>
					<td width="10%">조회수 : </td>
					<td width="10%"><%=bdto.getCount() %></td>
				</tr>
			</table>
			<div class="dush" style="opacity: 0.2; margin: 0;"></div>
			<div style="white-space: pre-line; padding: 2em;">
				<div class="card card-body">
				 <%=bdto.getNocontent() %>
				 </div>
			</div>
			</div>
				<div style="padding: 2em;" align="right">
					<input type="button" class="btn btn-info" value="목록보기" onclick="location='./notice.bo'">
				</div>
		</div>
		
		<%--footer.start --%>
		<div>
			<jsp:include page="../inc/footer.jsp"></jsp:include>
		</div>
		<%--footer.end --%>
</body>
</html>