<%@page import="com.db.mysql.PackageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<c:set var="pvo" value="${packageInfo}"/>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>


<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700|Nanum+Pen+Script|Poor+Story&display=swap&subset=korean" rel="stylesheet">
<%-- style.css링크 --%>
<link rel="stylesheet" href="${contextpath}/css/style.css">
<style type="text/css">

*{ 
    font-family: 'Nanum Pen Script', cursive; 
    font-family: 'Nanum Gothic Coding', monospace; 
    font-family: 'Poor Story', cursive; 
 } 

</style>
<script type="text/javascript">

    $(function(){
       $("#allcheck").click(function(){
           if($("#allcheck").prop("checked")){
               $("input[name=chk]").prop("checked",true);
           }else{
               $("input[name=chk]").prop("checked",false);
           }
       });
   });

/* 동적으로 input 추가*/
   var strTable;
   var adult,kid,baby;
   
   var package_price_adult = <c:out value="${pvo.package_price_Adult}" />;
   var package_price_child = <c:out value="${pvo.package_price_child}" />;
   var package_price_baby = <c:out value="${pvo.package_price_baby}" />;
   var package_no = <c:out value="${pvo.package_no}" />;
   var startnum = parseInt(<c:out value="${pvo.min_start_no}"/>);
   
//    $.ajax({type:"post",url:"../getNowTourist.nt",data:{package_no:package_no},
//       success:function(data,textStatus){
//          alert((data+sum)+" "+startnum);
//          if( (data+sum) > startnum){
//             /* 셀렉트 되돌리는 구문 */
//          }else{
//             /* 인풋 추가하는 구문 */
//          }
//       },
//       error:function(err,textStatus){
//          alert("에러발생");
//       }
//    });
      
      
   $(function() {
      
      $('.sel').on('focus', function () {
        prevSelect = $(this);
         prevSelectVal = prevSelect.val();
         
        }).on('change',function(){
         adult = parseInt($(".adult option:selected").val());
         kid = parseInt($(".kid option:selected").val());
         baby = parseInt($(".baby option:selected").val());
         var sum = adult+kid+baby;
         var price = (package_price_adult*adult)+(package_price_child*kid)+(package_price_baby*baby);
         
         $.ajax({type:"post",url:"./getNowTourist.nt",data:{package_no:package_no},
          success:function(data,textStatus){
             if( (parseInt(data)+sum) > startnum){
                var ablenum = startnum - parseInt(data);
                alert("현재 해당 날짜는 "+ablenum+"명이 예약 가능합니다.");
                prevSelect.val(prevSelectVal).prop("selected", "selected");
                
                   return false;
             }else{
                $(this).val(prevSelectVal).prop("selected", true);
                   $("#adult_num").html(adult);
                   $("#kid_num").html(kid);
                   $("#baby_num").html(baby);
                   $("#package_price").html(numberWithCommas(price));
                   
                var j=1,k=1,l=1;
                   strTable = "<tr class='table-active'><th>구분</th>"
                      +"<th>한글명</th>"
                      +"<th>영문성</th>"
                      +"<th>영문이름</th>"
                      +"<th>생년월일<br>(19981010)</th>"
                      +"<th>성별</th>"
                      +"<th>국적</th>"
                      +"<th>여권번호</th>"
                      +"<th>여권만료</th></tr>";
                   for (var i=1; i <= sum; i++) {
                      if(adult-- > 0){
                         strTable += "<tr><td>성인"+ (j++) +"<input type='hidden' value='성인' name='tour_person_level"+i+"'></td>";
                      }else {
                         if(kid-- > 0){
                            strTable += "<tr><td>소아"+ (k++) +"<input type='hidden' value='소아' name='tour_person_level"+i+"'></td>";
                         }else {
                            if(baby-- > 0){
                               strTable += "<tr><td>유아"+ (l++) +"<input type='hidden' value='유아' name='tour_person_level"+i+"'></td>";
                            }
                         }
                      }
                      strTable += "<td><input type='text' class='form-control inputchk' name='tour_ko_name"+i+"'></td>"
                              +"<td><input type='text' class='form-control inputchk' name='tour_last_name"+i+"'></td>"
                              +"<td><input type='text' class='form-control inputchk' name='tour_first_name"+i+"'></td>"
                              +"<td><input type='text' class='form-control inputchk' name='tour_birthday"+i+"'></td>"
                              +"<td><select class='custom-select custom-select-sm' name='tour_gender"+i+"'>"
                              +"<option value='남자'>남자<option value='여자'>여자"
                              +"</select></td>"
                              +"<td><select class='custom-select custom-select-sm' name='tour_nation"+i+"'>"
                              +"<option value='내국인'>내국인<option value='외국인'>외국인"
                              +"</select></td>"
                              +"<td><input type='text' class='form-control inputchk' name='tour_passport_num"+i+"'></td>"
                              +"<td><input type='text' class='form-control inputchk' name='tour_passport_end"+i+"'></td></tr>";
                      }
                   $('#personBox').html(strTable);
                   
             }
          },
          error:function(err,textStatus){
             alert("에러발생");
          }
       });
         
         
      });
   });
   
   function numberWithCommas(x) {
       return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
   }
   
   function emailCheck(){
      window.open("./pak/userEmail.jsp", "email인증","width=500 height=380 menubar=no status=no");
   }
   
   function check(){
      
      if( !($("#travel").is(":checked") && $("#personal").is(":checked") && $("#anpersonal").is(":checked") )){   
            alert("약관에 동의하셔야 합니다");
            return false;
      }
      if( $("#email").val() == "" ){
         alert("이메일 인증을 해주세요");
         return false;
      }
      
      var inputchk = $(".inputchk").length;      
      for(var i = 0 ; i < inputchk ; i++){
         if( $(".inputchk").eq(i).val() == "" ){
            $(".inputchk").eq(i).focus();
            alert("빈칸을 형식에 맞게 모두 채워주세요");
            return false;
         }
      }
         
         
      adult = parseInt($(".adult option:selected").val());
       kid = parseInt($(".kid option:selected").val());
       baby = parseInt($(".baby option:selected").val());
       var sum = adult+kid+baby;
      
      $.ajax({type:"post",url:"./getNowTourist.nt",data:{package_no:package_no},
         success:function(data,textStatus){
            if( (parseInt(data)+sum) > startnum){
               alert("해당 날짜에 예약 가능한 인원이 초과되었습니다. \n다른날짜를 이용해 주세요.");
//                return false;
               location.href="${contextpath}/info.pack?packageNo="+package_no;
            }else{
                document.form.submit();
            }
         },
         error:function(err,textStatus){
            alert("에러발생");
         }
      });
      
//       document.form.submit();
//       return true;
   }

   
   <%
      int adult = Integer.parseInt(request.getParameter("adult"));
      int kid = Integer.parseInt(request.getParameter("kid"));
      int baby = Integer.parseInt(request.getParameter("baby"));
      int sum = adult+kid+baby;
      
      HttpSession session5 = request.getSession();
      PackageVO pvo = (PackageVO)session5.getAttribute("packageInfo");
   %>
</script>
</head>
<body>
<%-- header.stary --%>
   <jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<form action="reservation_check.do" name="form">
<%-- 상품정보.시작 --%>
   <div class="container fst_container" style="margin-top: 10em;">
      <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right row">
         <div class="textsize">상품 정보</div>
         <table class="table border thcolor">
         <tbody>
            <tr>
               <th>상품명</th>
               <td><%=pvo.getProduct_subject() %></td>
            </tr>
            <tr>
               <th>여행기간</th>
               <td><%=pvo.getAvailability_start_date()%> ~ <%=pvo.getAvailability_end_date()%></td>
            </tr>
            <tr>
               <th>결제정보</th>
               <td>상담후결제  (예약을 신청한 후 담당자와 상담을 통해 가격 및 예약을 확정합니다.)</td>
            </tr>
         </tbody>
         </table>
   
<%-- 상품정보.끝 --%>

<%-- 약관 동의 --%>
   <div class="container mt-3">
  <!-- Nav tabs -->
  <ul class="nav nav-tabs">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">여행약관</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu1">개인정보수집</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#menu2">개인정보 제3자 제공</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content" style="border: 1px solid #dee2e6; border-top: 0;">
    <div id="home" class="container tab-pane active divscroll" style="white-space: pre-line; border: 0;"><br>
         1. 제1조(목적) 
         이 약관은 ㈜윌투어의 여행사업부문(이하 “당사”라 합니다)과 여행계약을 체결한 고객(이하   “고객”)간 국외여행계약의 세부이행 및 준수사항을 정함을 목적으로 합니다. 
         
         2. 제2조(당사와 고객의 의무)
          ① 당사는 고객에게 안전하고 만족스러운 여행서비스를 제공하기 위하여 여행알선 및 안내․운송․숙박 등 여행계획의 수립 및 실행과정에서 맡은 바 임무를 충실히 수행하여야 합니다. 
          ② 고객은 안전하고 즐거운 여행을 위하여 타 여행자와의 화합도모 및 여행업자의 여행질서 유지에 적극 협조하여야 합니다. 
          
         3. 제3조(여행의 종류 및 정의) 
          여행의여행의 종류와 정의는 다음과 같습니다. 
           1. 기획여행 : 당사가 미리 여행목적지 및 관광일정, 여행자에게 제공될 운송 및 숙식서비스 내용(이하'여행서비스'라 함),여행요금을 정하여 광고 또는 기타 방법으로 여행자를 모집하여 실시하는 여행. 
           2. 희망여행 : 여행자(개인 또는 단체)가 희망하는 여행조건에 따라 당사가 운송,숙식,관광 등 여행에 관한 전반적인 계획을 수립하여 실시하는 여행.
           3. 해외여행 수속대행(이하 수속대행계약이라 함) : 당사가 여행자로부터 소정의 수속대행요금을 받기로   약정하고, 여행자의 위탁에 따라 다음에 열거하는 업무(이하 수속 대행업무라 함)를 대행하는 것. 1) 사증, 재입국 허가 및 각종 증명서 취득에 관한 수속 2) 출입국 수속서류 작성 및 기타 관련업무
      </div>
      <div id="menu1" class="container tab-pane fade divscroll" style="white-space: pre-line; border: 0;"><br>
         <table class="table table-bordered text-center">
            <tr>
               <th>수집 및 이용 목적</th>
               <th>수집항목</th>
               <th>보유 및 이용기간</th>
            </tr>
            <tr>
               <td>상품 예약 및 상담, 출입국 가능 여부 확인</td>
               <td>예약자정보(이름, 이메일, 휴대전화, 일반전화) 
               여행자정보(한글이름, 영문이름, 생년월일, 휴대번호
               , 성별, 여권번호, 여권만료일, 국적, 여권사본)</td>
            <td rowspan="3" style="vertical-align: middle;">회원탈퇴 후 파기됩니다. 
            다만 관계법령에 의해 보존할 경우 그 
            의무기간 동안 별도 보관되며 불,편법
             행위의 방지 및 대응의 목적으로 
             60일간 별도 보관됩니다.</td>
            </tr>
            <tr>
               <td>여행자보험 가입</td>
               <td>한글명, 영문명, 주민들록번호</td>
            </tr>
            <tr>
               <td>현금영수증 발급</td>
               <td>현금영수증카드번호, 휴대폰번호</td>
            </tr>
         </table>
    </div>
    <div id="menu2" class="container tab-pane fade divscroll" style="white-space: pre-line; border: 0;"><br>
         ※ 동의를 거부할 권리 및 동의 거부에 따른 불이익
      정보주체는 개인정보 수집 및 이용에 대해 거부할 권리가 있습니다. 
      동의를 거부할 경우 상품 예약과 관련한 정보의 수집 및 이용이 이루어지지 않으므로 서비스 제공이 불가함을 알려 드립니다.
    </div>
    </div>
    <table class="table">
       <tr class="table-active">
          <td colspan="3" width="20%;">
             <input type="checkbox"name="allcheck" id="allcheck"> 모든 약관 동의
          </td>
       </tr>
       <tr class="table-active">
          <td width="20%;">
             <input type="checkbox" name="chk" id="travel"> 여행약관 동의 
          </td>
          <td width="20%;">
             <input type="checkbox" name="chk" id="personal"> 개인정보 수집 동의
          </td>
          <td></td>
       </tr>
       <tr class="table-active">
          <td colspan="3" width="20%;">
            <input type="checkbox"name="chk" id="anpersonal"> 개인정보 제3자 제공 동의
         </td>
       </tr>
    </table>
   </div>
   <%--약관 동의.끝 --%>
   <%-- 인원 --%>
   
   <div class="textsize">여행자 정보</div> 여행자 인원수를 확인해 주시기 바랍니다. 여행자 상세 정보는 마이페이지에서 추후 입력 및 수정 가능합니다. (단, 전액결제 상품 제외)
<table class="table table-bordered thwidth">
   <tr>
      <th width="10%">여행자 정보</th>
      <td style=" border: 0;">
         <span>성인</span>
         <select class="custom-select custom-select-sm sel adult" name="adult">
             <option class="opt1" value="1">1명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt2" value="2" <%if(adult==2){%>selected="selected"<%}%>>2명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt3" value="3" <%if(adult==3){%>selected="selected"<%}%>>3명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt4" value="4" <%if(adult==4){%>selected="selected"<%}%>>4명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt5" value="5" <%if(adult==5){%>selected="selected"<%}%>>5명 &nbsp;&nbsp;&nbsp;</option>
         </select>
      </td>
      <td style=" border: 0;">
         <span>소아</span>
         <select class="custom-select custom-select-sm sel kid" name="kid">
             <option class="opt0" value="0">0명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt1" value="1" <%if(kid==1){%>selected="selected"<%}%>>1명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt2" value="2" <%if(kid==2){%>selected="selected"<%}%>>2명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt3" value="3" <%if(kid==3){%>selected="selected"<%}%>>3명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt4" value="4" <%if(kid==4){%>selected="selected"<%}%>>4명 &nbsp;&nbsp;&nbsp;</option>
         </select>
      </td>
      <td style=" border: 0;">
         <span>유아</span>
         <select class="custom-select custom-select-sm sel baby" name="baby">
             <option class="opt0" value="0">0명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt1" value="1" <%if(baby==1){%>selected="selected"<%}%>>1명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt2" value="2" <%if(baby==2){%>selected="selected"<%}%>>2명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt3" value="3" <%if(baby==3){%>selected="selected"<%}%>>3명 &nbsp;&nbsp;&nbsp;</option>
             <option class="opt4" value="4" <%if(baby==4){%>selected="selected"<%}%>>4명 &nbsp;&nbsp;&nbsp;</option>
         </select>
      </td>
   </tr>
   <tr>
      <td colspan="4">
         <ul>
            <li>여행자 정보는 예약완료 단계 전까지 마이페이지를 통해 입력 및 수정 가능합니다.</li>
            <li>예약 후 일행 변경 시 옵션 및 가격 변동이 있을 수 있습니다. 변경사항이 있을 경우 담당자에게 문의해 주시기 바랍니다.</li>
            <li>성인,소아,유아 기준 인원이 각 10명 이상일 경우 예약 후 담당자에게 초과 인원을 말씀해 주세요.</li>
         </ul>
      </td>
   </tr>   
</table>

<table class="table table-bordered thwidth" id="personBox">
  <tr class="table-active">
   <th>구분</th>
   <th>한글명</th>
   <th>영문성</th>
   <th>영문이름</th>
   <th>생년월일<br>(19981010)</th>
   <th>성별</th>
   <th>국적</th>
   <th>여권번호</th>
   <th>여권만료</th>
  </tr>
  <tr>
  <%
     int j=1,k=1,l=1;
   for (int i=1; i <= sum; i++) {
      if(adult-- > 0){
         %>
         <tr><td>성인<%=j++%><input type="hidden" value="성인" name="tour_person_level<%=i%>"></td>
         <%
      }else {
         if(kid-- > 0){
            %>
            <tr><td>소아<%=k++%><input type="hidden" value="소아" name="tour_person_level<%=i%>"></td>
            <%
         }else {
            if(baby-- > 0){
               %>
               <tr><td>유아<%=l++%><input type="hidden" value="유아" name="tour_person_level<%=i%>"></td>
               <%
            }
         }
      }
  %>
   <td><input type="text" class="form-control inputchk" name="tour_ko_name<%=i%>"></td>
   <td><input type="text" class="form-control inputchk" name="tour_last_name<%=i%>"></td>
     <td><input type="text" class="form-control inputchk" name="tour_first_name<%=i%>"></td>
     <td><input type="text" class="form-control inputchk" name="tour_birthday<%=i%>"></td>
     <td><select class="custom-select custom-select-sm" name="tour_gender<%=i%>">
     <option value="남자">남자<option value="여자">여자
     </select></td>
     <td><select class="custom-select custom-select-sm" name="tour_nation<%=i%>">
     <option value="내국인">내국인<option value="외국인">외국인
     </select></td>
     <td><input type="text" class="form-control inputchk" name="tour_passport_num<%=i%>"></td>
     <td><input type="text" class="form-control inputchk" name="tour_passport_end<%=i%>"></td>
  </tr>
  <%
   }  
  %>
</table>
<div class="container">
<div class="row">
   <div class="col-sm-6 resbox">
      <h5>
      &nbsp;&nbsp;<img src="//sslimage.interpark.com/tourpark/tour/common/bul/bul_tit07.gif" style="padding-bottom: 0.5em;">
      &nbsp;<b>성인/소아 유아 기준 안내</b></h5>
      <ul>
         <li><strong>성인</strong> : 출발일 기준 만 12세이상 (2007년 09월 14일 이전 출생자)</li>
         <li><strong>소아</strong> : 출발일 기준 만 2세이상~만12세 미만 (2017년 09월 14일 이전 출생자)</li>
         <li><strong>유아</strong> : 출발일 기준 만 2세미만 ( 2017년 09월 15일 이후 출생자)</li>
      </ul>
   </div>
   <div class="col-sm-6 resbox">
      <h5>
      &nbsp;&nbsp;<img src="//sslimage.interpark.com/tourpark/tour/common/bul/bul_tit07.gif" style="padding-bottom: 0.5em;">
      &nbsp;<b>여권번호 입력 안내</b></h5>
      <ul>
         <li>여권정보 입력 시 여행자의 정확한 여권정보를 입력하여야 합니다.</li>
         <li>출발일 기준 여권의 유효기간은 180일 이상 남아있어야 합니다.</li>
      </ul>
   </div>
</div>
</div>
   
   <%-- 인원 --%>
   
   <%-- 예약자 정보.시작 --%>
   
   <div class="textsize">예약자 정보</div>
   <table class="table border thwidth" style="border-top: 2px solid !important;">
      <tr>
         <th class="table-active">예약자명</th>
         <td>
              <input type="text" class="form-control inputchk" name="reader_name">
         </td>
         <th class="table-active">이메일</th>
         <td>
              <div class="input-group mb-3">
                 <input type="text" class="form-control inputchk" name="email" id="email" readonly="readonly">
              <div class="input-group-append">
                <button class="btn btn-success" type="button" onclick="emailCheck()">인증</button> 
            </div>
            </div>
         </td>
      </tr>
      <tr>
         <th class="table-active">휴대폰</th>
         <td>
            <div class="col-sm-3 inblock">
               <select name="reader_phone1" class="form-control custom-select custom-select-sm">
                  <option value="010">010
                  <option value="011">011
                  <option value="016">016
               </select></div>-
            <div class="col-sm-4 inblock"><input type="text" name="reader_phone2" class="form-control inputchk" maxlength="4"></div> -
            <div class="col-sm-4 inblock"><input type="text" name="reader_phone3" class="form-control inputchk" maxlength="4"></div>
         </td>
         <th class="table-active">일반전화</th>
         <td>
         <div class="col-sm-3 inblock">
            <select name="reader_number1" class="form-control custom-select custom-select-sm">
               <option value="02">02
               <option value="031">031
               <option value="051">051
            </select></div>-
            <div class="col-sm-4 inblock"><input type="text" name="reader_number2" class="form-control inputchk" maxlength="4"></div> -
            <div class="col-sm-4 inblock"><input type="text" name="reader_number3" class="form-control inputchk" maxlength="4"></div>
         </td>
      </tr>
      <tr>
         <th class="table-active">요청사항</th>
         <td colspan="3">
            <textarea class="form-control" name="ect" style="resize: none;"></textarea>
         </td>
      </tr>
   </table>

   
   <%-- 예약자 정보.끝 --%>
   <%-- 결제금액.시작 --%>
   <div class="container">
   <div class="row" style="border: 3px solid #6E6E6E; border-radius:10px 10px 10px 10px;">
         <div class="col-md-2" style="background-color: #6E6E6E; border-radius:0px 0px 0px 0px; border-right: 3px solid #6E6E6E;">
            <p
               style="float: left; display: inline; margin-top: 23px; padding-left: 30px; width: 750px; color: white;">
               <b>결제 금액</b></p>
         </div>
         <div class="col-md-5">
            <p
               style="float: left; display: inline; margin-top: 3px; margin-bottom: 3px; padding-left: 20px; width: 750px;">

               <span style="float: left; color: #969696; letter-spacing: -.05em; font-size: 17px;">
                  <b>
                     성인 : <fmt:formatNumber value="${pvo.package_price_adult}" pattern="#,###"/> X <font id="adult_num">${param.adult}</font>명<br>
                     소아 : <fmt:formatNumber value="${pvo.package_price_child}" pattern="#,###"/> X <font id="kid_num">${param.kid}</font>명<br>
                     유아 : <fmt:formatNumber value="${pvo.package_price_baby}" pattern="#,###"/> X <font id="baby_num">${param.baby}</font>명
                  </b>
               </span>
               
            </p>
         </div>
         
         <div class="col-md-2">
         <p style="float: left; display: inline; margin-top: 18px; padding-left: 20px; width: 750px; ">
            <span>
               <b>=&nbsp;&nbsp;총 결제 금액 :</b> &nbsp;
               <font style="width:15%; border: 0px; text-align: center; font-weight: bold; color: red; font-size: 20px;" id="package_price">
                  <fmt:formatNumber value="${(pvo.package_price_adult*param.adult)+(pvo.package_price_child*param.kid)+(pvo.package_price_baby*param.baby)}" pattern="#,###"/> 원
               </font>
               &nbsp;원&nbsp;&nbsp;
               <input type="hidden" name="total_price">
            </span>
         </p>   
         </div>
         
      </div>
      <br>
   </div>
   <%-- 결제금액.끝 --%>
   <%-- 예약버튼.시작 --%>
      <div class="container">
         <div class="row justify-content-md-center">
            <div class="col-md-auto">
               <button class="btn sh_mainbutton" type="button" onclick="check()">예약접수하기</button>
            </div>
            <div class="col-md-auto">
               <button class="btn sh_mainbutton sh_cancelbutton" type="button" onclick="javascript:location.href='./list.pack'">취소하기</button>
            </div>
         </div>
      </div>
   </div> <%-- shadow.end --%>
</div><%-- maincontainer.end --%>
</form>
   <%--footer.start --%>
   <jsp:include page="../inc/footer.jsp"></jsp:include>
   <%--footer.end --%>
</body>
</html>