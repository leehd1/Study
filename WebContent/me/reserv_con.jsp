<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<c:set var="list" value="${list}"/>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<%-- style.css링크 --%>
<link rel="stylesheet" href="${contextpath}/css/style.css">
<title>Insert title here</title>

</head>
<body>

<%-- header.stary --%>
   <jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main" style="min-height: 597px">
    <div class="container" style="margin-top: 10em;">
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right row">
            <ol class="breadcrumb bg-light">
                <li class="breadcrumb-item text-success font-weight-bold">예약 / 확인</li>
            </ol>
            <div class="table-responsive">
            
            <table class="table table-sm">
   <c:choose>
      <c:when test="${empty list}">
         <thead><tr><td align="center"><h3 class="mt-5">예약 내역이 없습니다.</h3></td></tr></thead>
      </c:when>
      <c:otherwise>
         <thead>
                      <tr>
                          <th class="text-center">예약일</th>
                          <th class="text-center">예약 번호</th>
                          <th class="text-center">상품명</th>
                          <th class="text-center">예약 상황</th>
                      </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="lists" items="${list}" varStatus="status">
                      <tr class="collapse-${status.count} colls">
                          <td class="text-center">
                     <fmt:parseDate value="${fn:substring(lists.reserve_no,0,8)}" var="Date" pattern="yyyyMMdd"/>
                     <fmt:formatDate value="${Date}" pattern="yyyy-MM-dd"/>
                          </td>
                          <td class="text-center">${lists.reserve_no}</td>
                          <td class="text-center">${lists.product_subject}</td>
                          <td class="text-center">
                        <fmt:parseDate value="${lists.availability_end_date}" var="end" pattern="yyyy-MM-dd"/>
                        <fmt:parseDate value="${lists.availability_start_date}" var="start" pattern="yyyy-MM-dd"/>
                              <fmt:parseNumber value="${start.time / (1000*60*60*24)}" integerOnly="true" var="start1" />
                        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1" />
                        <fmt:parseNumber value="${end.time / (1000*60*60*24)}" integerOnly="true" var="end1" />
                        <c:if test="${end1>=now1}"><span class="badge badge-primary">예약 완료</span></c:if>
                        <c:if test="${end1<now1}"><span class="badge badge-success">여행 완료</span></c:if>
                          </td>
                      </tr>
                      <tr class="collapse co_${status.count}">
                         <td colspan="4">
                            <div class="collapse co_${status.count}">
                             <table class="table table-bordered">
                                <tr>
                                 <td class="text-center" width="200px">상품명</td>
                                 <td colspan="3"><a href="${contextpath}/info.pack?packageNo=${lists.package_no}">
                                    ${lists.product_subject}
                                 </a></td>
                              </tr>
                              <tr>
                                 <td class="text-center">여행기간</td>
                                 <td colspan="3">
                                    
                                    ${end1 - start1}박 ${end1 - start1 +1}일
                                    ${lists.availability_start_date} ~ ${lists.availability_end_date}
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text-center">교통/항공편</td>
                                 <td colspan="3">
                                    <c:choose>
                                         <c:when test="${lists.airplane_no == 1}">제주항공/아시아나항공</c:when>
                                         <c:when test="${lists.airplane_no == 2}">대한항공/아시아나항공</c:when>
                                         <c:when test="${lists.airplane_no == 3}">유나이티드 국제선 왕복 항공</c:when>
                                     </c:choose>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text-center">예약자 성명</td>
                                 <td colspan="3">${lists.reader_name}님, &nbsp;&nbsp;여행자 ${lists.nowtourist} 명 
                                    <button class="btn btn-primary btn-sm" type="button" onclick="checkTourist(${lists.reserve_no})">여행자 정보</button>
                                 </td>
                              </tr>
                              <tr>
                                 <td class="text-center">상품가격</td>
                                 <td colspan="3">
                                    [성인] <fmt:formatNumber value="${lists.package_price_adult}" pattern="#,###"/>원(만 12세 이상),
                                    [소아] <fmt:formatNumber value="${lists.package_price_child}" pattern="#,###"/>원(만 12세 미만),
                                    [유아] <fmt:formatNumber value="${lists.package_price_baby}" pattern="#,###"/>원(만 2세미만)<br>
                                    	총 결제 금액 : <fmt:formatNumber value="${lists.total_price}" pattern="#,###"/>원
<!--                                     <br><br> -->
<!--                                      · 항공운임 등 총액이 포함된 금액이며, 발권일/환율 등에 따라 유류할증료/제세공과금은 변동 될 수 있습니다. -->
                                 </td>
                              </tr>
                             </table>
                            </div>
                         </td>
                      </tr>
                        </c:forEach>
                        </tbody>
      </c:otherwise>
   </c:choose>
   
<!--                             <td class="text-center"><span class="badge badge-primary">입금 완료</span></td> -->
<!--                             <td class="text-center"><span class="badge badge-success">여행 완료</span></td> -->

                </table>
            </div>
        </div>
    </div>
</section>

<%--footer.start --%>
   <div>
   <jsp:include page="../inc/footer.jsp"></jsp:include>
   </div>
   <%--footer.end --%>
   
<script type="text/javascript">
      $(".colls").click(function(){
         var index = $(".colls").index(this)+1;
         $(".co_"+index).collapse('toggle');
      });
      
      function checkTourist(reserve_no){
         window.open("./me/tourist_con.jsp?reserve_no="+reserve_no, "여행자 정보 확인","width=850 height=450 menubar=no status=no");
      }
      
</script>

</body>
</html>