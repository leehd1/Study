<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
    <c:set var="bean" value="${bean}"/>
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
<style type="text/css">
	footer{
		bottom: 0;
		position: fixed;
		width: 100%;
	}

</style>
</head>
<body>
<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
<br><br>
<section>
    <div class="container fst_container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">판매자 등록</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
        	<div class="card card-body">
        		<div class="textsize">예행사 정보</div>
        		<form action="${contextpath}/SellerReqAction.se" method="post">
					<table class="table border thwidth" style="border-top: 2px solid !important;">
						<tr>
							<th class="table-active">여행사명</th>
							<td width="40%">
				  				<input type="text" class="form-control" id="travel_agency_name" name="travel_agency_name">
							</td>
							<th class="table-active">이메일</th>
							<td>
				  				<div class="input-group mb-3">
				  					<input type="text" class="form-control" readonly="readonly" value="${bean.email}" name="travel_agency_email">
<!-- 				  				<div class="input-group-append"> -->
<!-- 				    				<button class="btn btn-success" type="submit">인증</button>  -->
<!-- 								</div> -->
								</div>
							</td>
						</tr>
						<tr>
							<th class="table-active">휴대폰</th>
							<td>
								<div class="col-sm-3 inblock">
									<select name="travel_agency_phone_number1" class="form-control custom-select custom-select-sm">
										<option value="010">010
										<option value="011">011
										<option value="016">016
									</select></div>-
								<div class="col-sm-4 inblock"><input type="text" name="travel_agency_phone_number2" id="travel_agency_phone_number2" class="form-control"></div> -
								<div class="col-sm-4 inblock"><input type="text" name="travel_agency_phone_number3" id="travel_agency_phone_number3" class="form-control"></div>
							</td>
							<th class="table-active">팩스</th>
							<td>
								<div class="input-group">
				  					<input type="text" class="form-control" name="travel_agency_fax_number"><br>
								</div>
								<small class="form-text text-muted">'-'항목을 포함하여 작성해주세요</small>
							</td>
						</tr>
						<tr>
							<th class="table-active">상담가능시간</th>
							<td colspan="3">
								<textarea class="form-control" style="white-space: pre-line;" name="travel_agency_consulting_time" placeholder="ex) 평일 09:00 ~ 18:00 / 주말 / 공휴일 09:00 ~ 17:00"></textarea>
							</td>
						</tr>
					</table>
					<div align="center">
						<input type="submit" value="요청하기" class="btn btn-info">
					</div>
        		</form>
        		
        	</div>
        </div>
	</div>
</section>
<br><br><br><br><br><br><br>
<%--footer.start --%>
	<div>
	<jsp:include page="../inc/footer.jsp"/>
	</div>
<%--footer.end --%>
</body>
</html>