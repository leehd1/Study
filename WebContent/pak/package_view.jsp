<%@page import="com.db.mysql.PackageVO"%>
<%@page import="com.pack.packageDB.ReservationDAO"%>
<%@page import="com.sellboard.DB.packagelistDTO"%>
<%@page import="com.sun.org.glassfish.gmbal.IncludeSubclass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="info" value="${packageInfo}" />
<c:set var="agency" value="${agencyInfo}" />
<c:set var="guide" value="${guideInfo}" />
<c:set var="airlist" value="${list}"/>
<c:set var="paging" value="${pagingVO}" />
<c:set var="idCk" value="${sessionScope.id}" />
<%
pageContext.setAttribute("n", "\n"); //Space, Enter
pageContext.setAttribute("br", "<br/>"); //br 태그
ReservationDAO rdao = new ReservationDAO();
PackageVO pvo = new PackageVO();
pvo = (PackageVO)request.getSession().getAttribute("packageInfo");
int nowTourist = (int)rdao.getNowTourist(pvo.getPackage_no());
%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- 부트스트랩 링크 --%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%-- style.css링크 --%>
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="${context}/css/animate.css">
<title>Insert title here</title>
<script type="text/javascript">
var package_price_baby = <c:out value="${info.package_price_baby}" />;
var package_price_child = <c:out value="${info.package_price_child}" />;
var package_price_adult = <c:out value="${info.package_price_Adult}" />;
<c:set var="test" value="1" />
var disabledDays = [<c:forEach items="${totalAirList}" var="i">"${i.availability_start_date}"
    <c:if test="${fn:length(totalAirList) != test}">, </c:if>
    <c:set value="${test + 1}" var="test" /></c:forEach>];
$(function() {

   <c:if test="${param.packDate != null}">
        var queryDate = '${param.packDate}';
        var dateParts = queryDate.match(/(\d+)/g);
        var realDate = new Date(dateParts[2], (Number(dateParts[0]) - 1), dateParts[1]);
    </c:if>
    
    $("#datepicker").datepicker({
       minDate: 0,
       beforeShowDay: disableAllTheseDays,
       <c:if test="${param.packDate != null}">
            defaultDate: realDate,
        </c:if>
        onSelect: function (dateText, inst) {
            location.href = '<c:out value="${context}"/>/info.pack?packageNo=' + <c:out value="${info.package_no}"/> + '&packDate=' + dateText;
        }
   });
});

// $(document).ready(function(){
//     $(".collapse-1").click(function(){
//        $(".co_1").collapse('toggle');
//    });
// });
   
function disableAllTheseDays(date) {
    var m = date.getMonth(), d = date.getDate(), y = date.getFullYear();
    
    if (d < 10) d = '0' + d;
    if (m < 10) m = '0' + (m + 1);
    
    for (i = 0; i < disabledDays.length; i++) {
        
        if($.inArray(y + '-' + m + '-' + d,disabledDays) == -1) {
            return [false];
        }
    }
    return [true];
}   
   
$(function() {
   
   var prevSelect;
    var prevSelectVal;
   
   $("#price select").on("focus blur click", function () {
      
       prevSelect = $(this);
       prevSelectVal = prevSelect.val();
       
       
    }).change(function() {
        var baby = Number($("#package_price_baby").val());
        var child = Number($("#package_price_child").val());
        var adult = Number($("#package_price_adult").val());
        
        if (baby + child + adult > <c:out value="${info.min_start_no}" />) {
            prevSelect.find("option:eq(" + prevSelectVal + ")").prop("selected", "selected");
           
            return false;
        }
        
        baby *= package_price_baby;
        child *= package_price_child;
        adult *= package_price_adult;
        
        $("#package_price").html(numberWithCommas(baby + child + adult));
   });
   
});
   
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>
<style type="text/css">
.cursor:HOVER{
   cursor: pointer;
}

</style>
</head>
<body>

<%-- header.stary --%>
    <jsp:include page="../inc/header.jsp" />
<%-- header.end --%>

<%-- 패키지 제목 및 정보 --%>
<form action="reserve.do" name="form">
    <div class="container fst_container">
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right row thwidth">
            <div class="row">
                <div class="col-lg-12 textsize"><c:out value="${info.product_subject}" /></div>
            </div>
            <div class="dush"></div>
            <div class="row rowmargin">
                <div class="col-lg-6">
                   <img class="packageImage" alt="packageImage" src="${context}/img/${info.package_img_src}" width="500" height="400">
                </div>
                <div class="col-lg-6">
                    <table class="table table-bordered pak_table">
                       <tr align="center">
                          <td align="center" colspan="2">
                             <b>제품 상세 정보</b>
                          </td>
                       </tr>
                       <tr>
                          <td align="center" width="33%">
                            상품번호
                          </td>
                          <td width="77%">
                              <c:out value="${info.package_no}" />
                          </td>
                        </tr>
                        <tr>
                           <td align="center">
                              여행기간
                           </td>
                           <td>
                                <c:out value="${info.travel_period}" />일<br>
                           </td>
                        </tr>
                        <tr>
                           <td align="center">
                              예약현황
                           </td>
                           <td>
                               예약 <%=nowTourist%>명<br>
                               (총 예정인원 <c:out value="${info.reservation_no}" />명 / 최소출발 <c:out value="${info.min_start_no}" />명)
                          </td>
                       </tr>
                    </table>
                </div>
                <div class="col-lg-6" style="font-size: 0.9em; margin-bottom: 2em;">
                   <h4>상품특징</h4>
                    <div class="dush"></div>
                    <c:out value="${fn:replace(info.product_simple_info, n, br)}" escapeXml="false"/>
                </div>
                <div class="col-lg-6">
                    <h4>가이드 정보</h4>
                    <div class="dush"></div>
                    <div style="display: inline-flex; margin-bottom: 2em;">
                    <img alt="" src="http://openimage.interpark.com/tourpark/tour/detail/bg_guide.gif">
                       &nbsp;해당 상품의 전담가이드(인솔자)를<br> &nbsp;선정중에 있습니다.
                    </div>
                </div>
                <div class="col-lg-12">
                   <table class="table">
                      <tr>
                         <th width="10%">교통</th>
                         <td>필요한 항공기</td>
                      </tr>
                   </table>
                </div>
                <div class="col-lg-12">
                <h4>해외여행상품에 궁금하신 점 있으시면 문의주세요!</h4>
                <div class="dush"></div>
                <div style="display: flex; margin-bottom: 2em; font-size: 0.7em;">
                <img alt="" src="http://openimage.interpark.com/tourpark/tour/detail/bg_guide.gif">
                <table style="float: right; width: 80%; margin-top: 1em; margin-left: 1em;">
                   <tr align="left">
                      <th style="text-align: left;">담당자</th>
                      <td style="text-align: left;"><c:out value="${agency.travel_agency_name}" /></td>
                   </tr>
                   <tr>
                      <th style="text-align: left;">전화번호</th>
                      <td style="text-align: left;"><c:out value="${agency.travel_agency_phone_number}" /></td>
                   </tr>
                   <tr>
                      <th style="text-align: left;">이메일</th>
                      <td style="text-align: left;"><c:out value="${agency.travel_agency_email}" /></td>
                   </tr>
                   <tr>
                      <th style="text-align: left;">팩스번호</th>
                      <td style="text-align: left;"><c:out value="${agency.travel_agency_fax_number}" /><br></td>
                   </tr>
                   <tr>
                      <th style="text-align: left;">상담가능시간</th>
                      <td style="text-align: left;"><c:out value="${agency.travel_agency_consulting_time}" /></td>
                   </tr>
                </table>    
                </div>
                </div>
            </div>
 <%-- 패키지 제목 및 정보 끝--%>
 
 <%-- 상품평 및 상세일정  시작--%>
 
<div class="container mt-3">

    <!-- Nav tabs -->
    <ul class="nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link <c:if test="${paging.nowPage != null && paging.nowPage <= 1}">active</c:if>" data-toggle="tab" href="#home">상세일정</a>
        </li>
        <li class="nav-item">
            <a class="nav-link <c:if test="${paging.nowPage != null && paging.nowPage > 1}">active</c:if>" data-toggle="tab" href="#menu1">상품평</a>
        </li>
    </ul>
    
    <!-- Tab panes -->
    <div class="tab-content">
        <div id="home" class="container tab-pane <c:if test="${paging.nowPage != null && paging.nowPage <= 1}">active</c:if>"><br>
            <h3>상세일정</h3>
            <div class="dush"></div>
                <c:out value="${info.product_info}" escapeXml="false"/>
        </div>
    
    <div id="menu1" class="container tab-pane  <c:if test="${paging.nowPage != null && paging.nowPage > 1}">active</c:if>"><br>
      <h3>고객 상품평 ${paging.totalRecord}건</h3>
      <div class="dush"></div>
      
            <div class="table-responsive">
                <table class="table table-sm">
                    <tbody>
                    <c:if test="${spList != null}">
                        <c:forEach items="${spList}" var="list">
                            <tr class="collapse-${list.spno} cursor">
                                <td>${list.sptitle}</td>
                                <td class="text-center">${list.date}</td>
                                <td class="text-center"><span class="badge">조회수 ${list.spcount}</span></td>
                            </tr>
                            <tr class="collapse co_${list.spno}">
                                <td colspan="4">
                                    <div class="collapse co_${list.spno}">
                                     <ol class="breadcrumb bg-light cursor">
                                            <li class="breadcrumb-item text-success font-weight-bold">별점 : ${list.star}</li>
                                            <li class="breadcrumb-item font-weight-bold">${list.spsimple_content}</li>
                                            <li class="text-success font-weight-bold"><a href="${context}/boardRead.bo?spno=${list.spno}"><span class="badge">상세보기</span></a></li>
                                        </ol>
                                    </div>
                                </td>
                            </tr>
                            <script>
                                $(document).ready(function(){
                                    $(".collapse-${list.spno}").click(function(){
                                        $(this).addClass('cursor');
                                        $(".co_${list.spno}").collapse('toggle');
                                    });
                                });
                            </script>
                        </c:forEach>
                        <tr>
                            <td colspan="4">
                                <div class="col-lg-6 offset-lg-3 d-flex">
                                    <ul class="pagination mx-auto">
                                        <c:if test="${paging.prevBtnVisible}"><li class="page-item"><a class="page-link" href="${context}/list.pack?page=${paging.prevBlock}&packageNo=${info.package_no}">이전</a></li></c:if>
                                        <c:if test="${paging.totalBlock > 0}">
                                            <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
                                                <c:choose>
                                                    <c:when test="${paging.nowPage == i}"><li class="page-item active" aria-current="page"><span class="page-link">${i}<span class="sr-only">(current)</span></span></li></c:when>
                                                    <c:otherwise><li class="page-item"><a class="page-link" href="${context}/info.pack?page=${i}&packageNo=${info.package_no}">${i}</a></li></c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${paging.nextBtnVisible}"><li class="page-item"><a class="page-link" href="${context}/list.pack?page=${paging.nextBlock}&packageNo=${info.package_no}">이후</a></li></c:if>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
 
 
 <%-- 상품평 끝 --%>
 
 
 <%-- 여행 일자 선택 시작--%>
<div class="container">
<div class="dush"></div>
    <div class="jumbotron row jum_padding">
          <div class="col-lg-12 textsize" style="margin: 0;">출발일 및 교통편 선택</div>
    </div>
   <div class="jumbotron row jum_padding" style="background: white;">
       <div class="col-lg-4">
         <div id="datepicker"></div>
       </div>
                
       <div class="col-lg-8">
       <div class="divscroll">
          <table class="table table-hover">
             <tr align="center" class="table-danger">
                <th width="10%">출발일시</th>
                <th width="10%">도착일시</th>
                <th width="10%">기간</th>
                <th width="20%">교통</th>
                <th width="10%">가격</th>
                <th width="10%">상태</th>
             </tr>
                
                <%-- 1 = 제주항공/아시아나항공, 2= 대한항공/아시아나항공, 3 = 유나이티드 국제선 왕복 항공 --%>
              <c:forEach var="list" items="${airList}">
                 <tr align="center" onclick="location.href='${context}/info.pack?packageNo=${list.package_no}'">
                    <td>${list.availability_start_date}</td>
                    <td>${list.availability_end_date}</td>
                    <td>${info.travel_period}일</td>
                    <td>
                            <c:choose>
                                <c:when test="${list.airplane_no == 1}">제주항공/아시아나항공</c:when>
                                <c:when test="${list.airplane_no == 2}">대한항공/아시아나항공</c:when>
                                <c:when test="${list.airplane_no == 3}">유나이티드 국제선 왕복 항공</c:when>
                            </c:choose>
                        </td>
                    <td>${list.package_price_adult}</td>
                    <td>출발가능</td>
                 </tr>
              </c:forEach>
          </table>
       </div>
       </div>
    </div>
 </div>
 
 <%-- 여행 일자 선택 끝--%>
 
 <%-- 예약 결제 시작 --%>
 
 <div class="container">
    <div class="jumbotron jum_padding">
       <div class="row">
<div class="col-lg-7">
  <table class="table" id="price">
      <tr>
        <th rowspan="3" class="align-middle text-center">여행인원</th>
        <td>성인 (만 12세 이상)
        <div class="divright">
           <fmt:formatNumber value="${info.package_price_Adult}" />원&nbsp;&nbsp;
        <div class="divright">
            <select id="package_price_adult" name="adult">
                <c:forEach begin="0" end="${info.min_start_no}" var="i" step="1">
                    <option <c:if test="${i == 1}">selected="selected"</c:if> value="<c:out value="${i}" />"><c:out value="${i}" /></option>
                </c:forEach>
            </select>
        </div>
        </div>
        </td>
      </tr>
      <tr>
        <td>소아 (만 12세 이하)
        <div class="divright">
            <fmt:formatNumber value="${info.package_price_child}" />원&nbsp;&nbsp;
        <div style="float: right;">
           <select id="package_price_child" name="kid">
                <c:forEach begin="0" end="${info.min_start_no}" var="i" step="1">
                    <option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
                </c:forEach>
           </select>
        </div>
        </div>
        </td>
      </tr>
      <tr>
        <td>유아 (2세 이하)
        <div style="color: #fd5f37; float: right;">
            <fmt:formatNumber value="${info.package_price_baby}" />원&nbsp;&nbsp;
        <div style="float: right;">
            <select id="package_price_baby" name="baby">
                <c:forEach begin="0" end="${info.min_start_no}" var="i" step="1">
                    <option value="<c:out value="${i}" />"><c:out value="${i}" /></option>
                </c:forEach>
            </select>
        </div>
        </div>
        </td>
      </tr>
  </table>
 </div>
 <div class="col-lg-5">
    <div style="background: #e4e4e4; height: 165px;" class="text-center" id="moneysize">
       <span>총 합계금액 :</span>
       <span id="package_price"><fmt:formatNumber value="${info.package_price_Adult}" />원</span>
        <c:if test="${idCk != null}">
            <a href="javascript:document.form.submit();" class="btn btn-secondary btn-lg" role="button">결제</a>
        </c:if>
    </div>
 </div>
 </div>
    </div>
 </div>
 </div>
 </div>
 </form>
 <%-- 예약 결제 끝 --%>

<%--footer.start --%>
    <jsp:include page="/inc/footer.jsp" />
<%--footer.end --%>
</body>
</html>