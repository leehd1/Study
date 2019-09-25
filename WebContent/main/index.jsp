<%@page import="com.board.packboardDB.packspboardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.board.packboardDB.packnoboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<%
	List list = new ArrayList();
	packnoboardDAO dao = new packnoboardDAO();
	list = dao.getspboardc();
	pageContext.setAttribute("list", list);
%>
<%-- js링크 --%>
<script src="${contextpath}/js/jquery-1.10.2.min.js"></script>
<script src="${contextpath}/js/fadein.js"></script>
<%-- 부트스트랩 링크 --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%-- style.css링크 --%>
<link rel="stylesheet" href="${contextpath}/css/style.css">
<link rel="stylesheet" href="${contextpath}/css/animate.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#mainbg_wrap{
	overflow: hidden;
    width: 100%;
    height: 781px;
    margin: 0 auto;
    padding: 0 auto;
    background: url(http://www.travelstation.co.kr/webi/main/image/2019_main_image.jpg) no-repeat center 0;
    background-size: cover;
	height: 1000px;

	}
</style>
</head>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<%-- main background.start --%>
	<div class = "responsive box" id="mainbg_wrap">
		<div class="container hideme">
		
	<div class="sp" style="padding-top: 15em;">	
	<h1 align="center"><b>이벤트</b></h1><br><br>
		<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  
  <div class="carousel-inner" style="border-radius: 20px;">
    <div class="carousel-item active">
      <img src="http://image23.hanatour.com/Main/Mainbanner/main_image_P16646.jpg" alt="Los Angeles" width="1200" height="500">
    </div>
    <div class="carousel-item">
      <img src="https://img.publichs.com/ECMCFO/share/admin/exhibition/ec/master/201902/3299120190222172105.jpg" alt="Chicago" width="1200" height="500">
    </div>
    <div class="carousel-item">
      <img src="https://www.drtour.com/promotion/2016/0101_payco/images/payco_0330_top_pc.jpg" alt="New York" width="1200" height="500">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
</div>
	
	</div>
	</div>
<%-- main background.end --%>	
	
<%-- popular package.list.start --%>
	<div class="jumbotron text-center bottom-zero box main_jum">
		<h1>스마트 추천상품</h1>
		<p>윌투어에서 추천하는 상품입니다.</p>
	
	<div class="container hidemm">
			<div class="row">
				<div class="col-lg-4 colsize">
				<a href="#"><img src="${contextpath}/images/place-1.jpg" class="responsiveimg"
					alt=""></a>
				<div style="background-color: white;">
				<div class="">
				<h3>
					<a href="#" class="title">Group Tour</a>
				</h3>
				<p>Scelerisque vitae velit e llamcorper plvinar esras sit amet
					odio et dolor por bibendum sit amet neceros.</p>
				<div class="service-btn-link">
					<a href="domestic-tour.html" class="btn-link">Domestic Tour</a>
				</div>
				<div>
					<a href="international-tour.html" class="btn-link">International
						Tour</a>
				</div>
				</div>
			</div>
			</div>
			
			<div class="col-lg-4 colsize">
				<a href="#"><img src="${contextpath}/images/place-1.jpg" class="responsiveimg"
					alt=""></a>
				<div style="background-color: white;">
			<div class="">
				<h3>
					<a href="#" class="title">Group Tour</a>
				</h3>
				<p>Scelerisque vitae velit e llamcorper plvinar esras sit amet
					odio et dolor por bibendum sit amet neceros.</p>
				<div class="service-btn-link">
					<a href="domestic-tour.html" class="btn-link">Domestic Tour</a>
				</div>
				<div>
					<a href="international-tour.html" class="btn-link">International
						Tour</a>
				</div>
			</div>
			</div>
			</div>
			
			<div class="col-lg-4 colsize">
				<a href="#"><img src="${contextpath}/images/place-1.jpg" class="responsiveimg"
					alt=""></a>
			<div style="background-color: white;">
			<div class="">
				<h3>
					<a href="#" class="title">Group Tour</a>
				</h3>
				<p>Scelerisque vitae velit e llamcorper plvinar esras sit amet
					odio et dolor por bibendum sit amet neceros.</p>
				<div class="service-btn-link">
					<a href="domestic-tour.html" class="btn-link">Domestic Tour</a>
				</div>
				<div>
					<a href="international-tour.html" class="btn-link">International
						Tour</a>
				</div>
			</div>
			</div>
			</div>
		</div>
		<br>
		<button class="seebtn" onclick="location='#'">SEE ALL POST →</button>
	</div>
	
</div>

<%-- popular package.list.end --%>

<%-- 여기서부터 말풍선 영역입니다 --%>


<div class="jumbotron helpcolor bottom-zero box main_jum">
	<div align="center"><br><br>
		<h1>HOT 투어후기</h1>
		<p>해당 후기는 조회수가 높음 순으로 출력됩니다.</p><br><br>
	</div>
		<br><Br><br>
	<div class="container hhh">
			<div class="row" >
			
					<c:forEach items="${pageScope.list}" var="list">
					
					<div class="col-lg-4 colsize" style="margin-bottom: 2em;">
					<div style="background-color: white; border-radius: 20px;" >
						<div class="bubble" class="text-">
						<br>
						<h3 class="text-truncate" style="max-width: 300px;">
							<a href="${contextpath}/boardRead.bo?spno=${list.spno}" class="title">${list.sptitle}</a>
						</h3>
						<p>"${list.spsimple_content}"</p>
							<div class="service-btn-link">
								<p>별점 : ${list.star} 점</p>
							</div>
							<div>
							<a href="${contextpath}/boardRead.bo?spno=${list.spno}" class="btn-link">Learn More...</a>
							</div>
							<div>
								<br>
							</div>
						</div>
						</div>
							<div class= "arrows arrow-border"></div>
				 		<div class= "arrows arrow"></div>
					</div>
					</c:forEach>
				
		</div>
	</div>
	<br><br><br><br>
	</div>

<%-- 말풍선 끝 --%>
	<%--footer.start --%>
	<div>
	<jsp:include page="../inc/footer.jsp"/>
	</div>
	<%--footer.end --%>
</body>
</html>