<%@page import="java.util.List"%>
<%@page import="com.pack.packageDB.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<c:set var="rdto" value="${rdto}"/>
<c:set var="pvo" value="${packageInfo}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%-- style.css링크 --%>
<link rel="stylesheet" href="${contextpath}/css/style.css">
<script type="text/javascript">
   
   var package_no = <c:out value="${pvo.package_no}" />;
   var startnum = parseInt(<c:out value="${pvo.min_start_no}" />);
   var   adult = parseInt(<c:out value="${param.adult}" />);
   var   kid = parseInt(<c:out value="${param.kid}" />);
   var   baby = parseInt(<c:out value="${param.baby}" />);
   var sum = adult + kid + baby;
   
   function pay(){
      var card = $(".sel").val();
      if( card == "0" ){
         alert("결제 방법을 선택해 주세요");
         return false;
      }else{
         window.open("./pak/payment.jsp?card="+card, "결제","width=500 height=400 menubar=no status=no");
      }
      
   }
   
   function appchk(){
      $.ajax({type:"post",url:"./getNowTourist.nt",data:{package_no:package_no},
         success:function(data,textStatus){
            if( (parseInt(data)+sum) > startnum){
               /* 셀렉트 되돌리는 구문 */
               alert("해당 날짜에 예약 가능한 인원이 초과되었습니다. \n다른날짜를 이용해 주세요.");
               location.href="${contextpath}/info.pack?packageNo="+package_no;
            }else{
               alert("예약이 완료 되었습니다.");
                document.form.submit();
            }
         },
         error:function(err,textStatus){
            alert("에러발생");
         }
      });
   }
   
</script>

<title>Insert title here</title>
</head>
<body>
<%-- header.start --%>
   <jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<%-- 예약확인.start --%>
<form action="reserveproc.do" name="form">
<section role="main">
    <div class="container fst_container">
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right row">
            <div class="col-sm-12 p-0 m-0 mb-3">
            <div class="textsize">예약 정보 확인</div>
                <table class="table table-bordered p-0 m-0">
                    <thead>
                        <tr class="bg-info">
                            <th class="bg-info text-white text-center" colspan="4">예약정보</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th class="text-center">상품명</th>
                            <td class="text-center">${pvo.product_subject}</td>
                            <th class="text-center">일정</th>
                            <td class="text-center">${pvo.availability_start_date} ~ ${pvo.availability_end_date}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="col-sm-12 p-0 m-0 mb-0">
                <div class="table-responsive p-0 m-0">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="bg-info">
                                <th class="bg-info text-white text-center" colspan="40">여행자정보</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <th class="text-center">구분</th>
                                <th class="text-center">한글이름</th>
                                <th class="text-center">영문성</th>
                                <th class="text-center">영문이름</th>
                                <th class="text-center">생년월일</th>
                                <th class="text-center">성별</th>
                                <th class="text-center">국적</th>
                                <th class="text-center">여권번호</th>
                                <th class="text-center">여권만료일</th>
                            </tr>
                            <c:forEach var="list" items="${list}">
                               <tr>
                                   <td class="text-center">${list.tour_person_level}</td>
                                   <td class="text-center">${list.tour_ko_name}</td>
                                   <td class="text-center">${list.tour_last_name}</td>
                                   <td class="text-center">${list.tour_first_name}</td>
                                   <td class="text-center">${list.tour_birthday}</td>
                                   <td class="text-center">${list.tour_gender}</td>
                                   <td class="text-center">${list.tour_nation}</td>
                                   <td class="text-center">${list.tour_passport_num}</td>
                                   <td class="text-center">${list.tour_passport_end}</td>
                               </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="rounded border bg-light col-sm-12 pt-3 m-0 row">
                <div class="col-sm-6">
                    <h1 class="h5 mt-2 mb-3 pb-3 border-bottom">결제방법</h1>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample1">
                        <label class="custom-control-label" for="customRadio1">신용/체크카드 결제</label>
                    </div>
                
                    <div class="collapse mt-3 mb-3" id="collapseExample1">
                        <div class="card card-body">
                            <h1 class="h6 mt-2 mb-3 pb-3 border-bottom">신용/체크카드</h1>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelect01">카드선택</label>
                                </div>
                                <select class="custom-select sel" id="inputGroupSelect01">
                                    <option value="0" selected>카드를 선택해주세요</option>
                                    <option value="삼성">삼성카드</option>
                                    <option value="현대">현대카드</option>
                                    <option value="농협">농협카드</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="rounded border bg-white col-sm-6 mb-3 p-3">
                    <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">결제금액 : <fmt:formatNumber value="${rdto.total_price}" pattern="#,###"/> 원</h1>
                    <div>
                        <button class="btn btn-primary btn-lg btn-block" type="button" onclick="pay()">결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</form>
<%-- 예약확인.end --%>
<%--footer.start --%>
   <jsp:include page="../inc/footer.jsp"></jsp:include>
   <%--footer.end --%>
</body>
</html>