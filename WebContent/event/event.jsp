<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="./css/style.css">
<title>Insert title here</title>
<style type="text/css">
	.event-list {
    overflow: hidden;
    padding-top: 11px;
	}
	.event-list li {
    float: left;
    margin: -1px -1px 0 0;
    width: 255px;
    height: 190px;
    border: 1px solid #e0e0e0;
	}
	.event-list li .view-img {
    overflow: hidden;
    width: 255px;
    height: 107px;
    border-bottom: 1px solid #e0e0e0;
	}	
	.event-list li span {
    display: block;
	}
	.event-list li .data img {
    margin-right: 7px;
    vertical-align: -4px;
	}
	.event-list li .view-img img {
    width: 100%;
    height: auto;
    vertical-align: top;
	}
	
</style>
</head>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main">
    <div class="container" style="margin-top: 10em;">
<!--         <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">예약상황 및 확인</h1> -->
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right row">
            <ol class="breadcrumb bg-light">
                <li class="breadcrumb-item text-success font-weight-bold">이벤트</li>
            </ol>
            <br>
            <div class="row">
			<div class="col"></div>
			<div class="col-10">
    	<ul class="event-list">
    	
            <li id="EventList_ctl00_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636967320385369188.jpg" width="183" height="95" alt="해외여행 원데이픽 기획전"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2019.06.24 ~ 2019.12.31</span>
                <span class="con"><a href="#">해외여행 원데이픽 기획전</a></span>
            </li>
            	
        
            <li id="EventList_ctl01_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636935971625966055.jpg" width="183" height="95" alt="이 구역 다 찍고 접수, 금주의 미친 특가! 국내숙박 금도끼"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2018.01.18 ~ 2019.12.31</span>
                <span class="con"><a href="#">이 구역 다 찍고 접수, 금주의 미친 특가! 국내숙박 금도끼</a></span>
            </li>
            	
        
            <li id="EventList_ctl02_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636918943961083732.png" width="183" height="95" alt="요즘 뜨는 그 호텔 0원에 가자! 호텔이여, 0원하라!"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2018.01.15 ~ 2019.12.31</span>
                <span class="con"><a href="#">요즘 뜨는 그 호텔 0원에 가자! 호텔이여, 0원하라!</a></span>
            </li>
            	
        
            <li id="EventList_ctl03_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636933335889479473.jpg" width="183" height="95" alt="해외여행 추석 종합 프로모션"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2019.05.10 ~ 2019.10.13</span>
                <span class="con"><a href="#">해외여행 추석 종합 프로모션</a></span>
            </li>
            	
        
            <li id="EventList_ctl04_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636584391645806139.jpg" width="183" height="95" alt="인터파크투어 패키지 시니어 요금"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2018.02.20 ~ 2019.12.31</span>
                <span class="con"><a href="#">인터파크투어 패키지 시니어 요금</a></span>
            </li>
            	
        
            <li id="EventList_ctl05_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636978563775191665.jpg" width="183" height="95" alt="[국내여행] 여름 계곡 어디가 좋을까 ? "></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2019.07.04 ~ 2019.08.31</span>
                <span class="con"><a href="#">[국내여행] 여름 계곡 어디가 좋을까 ? </a></span>
            </li>
            	
        
            <li id="EventList_ctl06_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636978469690258687.jpg" width="183" height="95" alt="이번 주말에 뭐하지? - 2019 대천 머드축제"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2019.07.03 ~ 2019.07.21</span>
                <span class="con"><a href="#">이번 주말에 뭐하지? - 2019 대천 머드축제</a></span>
            </li>
            	
        
            <li id="EventList_ctl07_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636977496242809827.jpg" width="183" height="95" alt="제주항공 NEW CLASS &amp; JJ라운지"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2019.07.03 ~ 2019.07.31</span>
                <span class="con"><a href="#">제주항공 NEW CLASS &amp; JJ라운지</a></span>
            </li>
            	
        
            <li id="EventList_ctl08_liList">
                <span class="view-img"><a href="#"><img src="http://tourimage.interpark.com/Sites/Tour/Event/List/636979112860753567.jpg" width="183" height="95" alt="전국 인피니티풀 호텔&amp;리조트 #SNS성지 #여기한국맞아"></a></span>
                <span class="data"><img src="http://openimage.interpark.com/tourpark/tour/event_zone/txt_period.gif" alt="기간">2019.07.05 ~ 2019.08.31</span>
                <span class="con"><a href="#">전국 인피니티풀 호텔&amp;리조트 #SNS성지 #여기한국맞아</a></span>
            </li>
            	
        	
    </ul>
        </div>
        <div class="col"></div>
    </div>
    
    <div class="col-lg-6 offset-lg-3 d-flex" style="margin-top: 0.5em; margin-bottom: 0.5em;">
	            <div class="input-group col-4">
					<select class="custom-select" id="inputGroupSelect01">
					    <option value="*">전체</option>
					    <option value="1">제목</option>
					    <option value="2">내용</option>
					    <option value="3">이름</option>
					</select>
                </div>
                <div class="input-group col-8">
                        <input type="text" class="form-control" id="inputGroupSelect01">
                        <div class="input-group-append">
                            <button class="btn btn-info" type="button">검색</button>
                        </div>
                    </div>
            </div>
                
            <div class="col-lg-6 offset-lg-3 d-flex">
                <ul class="pagination mx-auto">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">«</span>
                            <span class="sr-only">Previous</span>
                        </a>
                    </li>
                    <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">»</span>
                            <span class="sr-only">Next</span>
                        </a>
                    </li>
                </ul>
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