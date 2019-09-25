<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<%
	String path = request.getContextPath();
	String id = (String)session.getAttribute("id");
	
	int IDLEVEL = Integer.parseInt((String)session.getAttribute("IDLEVEL"));
	
	pageContext.setAttribute("IDLEVEL", IDLEVEL);
%>
<style type="text/css">
.mypage_body{
	background: linear-gradient(to left, #fcbf92, #ff6d2f);	
}
.mypage_container{
	background-color: white;
	box-shadow: 0 0 30px rgba(0, 0, 0, 0.5);
	width: 100%;
}

.my{
	border: 0px solid gray;
	text-align: center;
	vertical-align: middle;
}
.my1 div {
	border: 0px solid gray;
	
}
.my1 img{
	
	width: 100px;
	height: 100px;
}
.mypage_level{
	
	
}
.my1{
	
	padding: 0px !important;
	margin-bottom: 50px;
	
}
.mypage_p{
	vertical-align: middle;
}
.mypage_a{
	line-height: 50px;
	color: black;
	font-weight: bold;
	font-size: 20px;
}

</style>
</head>
<body class="mypage_body">

	<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<%-- header.end --%>

	<section role="main" style="margin-top: 15em;">
		<div class="container mypage_container">
		<h1 align="center">My Page</h1>
			<div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right row">
				<div class="col-sm-12 my" style="height: 10em;"><br>
					<img src="${contextpath}/images/level_${IDLEVEL}.png" class="mypage_level"><br>
					<c:choose>
						<c:when test="${IDLEVEL==9}">
						<p class="mypage_a">관리자 계정</p>
						</c:when>
					</c:choose>
				</div>
				
				<div class="col-sm-12 my" style="margin-bottom: 10px; height: 3em;">
					<br><a href="#" style="font-size: 17px;"><c:if test="${IDLEVEL!=9}"><b>등급별 혜택보기</b></c:if></a><br><br>
				</div>
				
				<br><br><br><br><br><br>
				<div class="container">
				<div class="row justify-content-md-center">
				
				<c:if test="${IDLEVEL>=0&&IDLEVEL!=9}">
					<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/MemberUpdateAction.me" class="mypage_a"><img src="${contextpath}/images/boy.png"><br>
							회원 정보 수정
						</a>
					</div>
					<c:if test="${IDLEVEL<4&&IDLEVEL!=9}">
					<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/SellerReq.se?id=<%=id%>" class="mypage_a"> <img src="${contextpath}/images/boy.png"><br>
							판매자로 등록하기
						</a>
					</div>
					</c:if>
					<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/reserv_con.do" class="mypage_a"> <img src="${contextpath}/images/paper.png"><br>
							예약 확인
						</a>
					</div>
					<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/MemberMooni.me" class="mypage_a"> <img src="${contextpath}/images/mail.png"><br>
							문의 내역
						</a>
					</div>
					<div class="col-md-3 my1" align="center">
						<a href="<%=path%>/MemberDeleteAction.me?id=<%=id %>" class="mypage_a"> <img src="${contextpath}/images/exit.png"><br>
							회원 탈퇴
						</a>
					</div>
				</c:if>
				<c:if test="${IDLEVEL==9 }">
				<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/adminMemberList.ad" class="mypage_a"><img src="${contextpath}/images/boy.png"><br>
							회원 관리
						</a>
					</div>
				<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/MemberMooni.me" class="mypage_a"> <img src="${contextpath}/images/mail.png"><br>
							문의 내역 확인
						</a>
					</div>
					<div class="col-md-3 my1" align="center">
						<a href="${contextpath}/adminList.ad" class="mypage_a"> <img src="${contextpath}/images/paper.png"><br>
							요청 확인 리스트
						</a>
					</div>
				</c:if>
				</div>
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