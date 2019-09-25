<%@page import="java.util.HashMap"%>
<%@page import="com.board.packboardDB.packnoboardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<%
   request.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=utf-8");
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
   $(function() {
      $('#btn').on('click', function () {
         $(opener.document).find("#sppackage").val($('input[type=radio]:checked').val());
         var a = $('input[type=radio]:checked').parents("tr").find("input[type=hidden]");
         var cate = a.eq(0).val();
         var package_no = a.eq(1).val();
         var product_subject = a.eq(2).val();
         var availability_start_date = a.eq(3).val();
         var package_total_no = a.eq(4).val();
         
         $(opener.document).find("#cate").val(cate);
         $(opener.document).find("#package_total_no").val(package_total_no);
         
         window.close();
      });
   });
</script>
</head>
<body>
<%
   String id = (String)session.getAttribute("id");
   packnoboardDAO pdao = new packnoboardDAO();
   List list = (List)pdao.visited(id);
%>
<c:set var="list" value="<%=list %>"></c:set>
   <div class="container">
      <table class="table text-center">
      <c:choose>
      <c:when test="${empty list}">
               <tr><td align="center"><h3>다녀온 여행지가 없습니다.</h3></td></tr>
      </c:when>
         <c:otherwise>
               <tr align="center">
                  <th width="50">지역</th>
                  <th width="100">패키지 번호</th>
                  <th width="300">패키지 제목</th>
                  <th width="200">여행 날짜</th>
                  <th width="50">선택</th>
               </tr>
               
               <c:forEach var="lists" items="${list}" varStatus="status">
               
               
               <fmt:parseDate value="${lists.availability_end_date}" var="end" pattern="yyyy-MM-dd"/>
            <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="now1" />
            <fmt:parseNumber value="${end.time / (1000*60*60*24)}" integerOnly="true" var="end1" />
                              
            <c:if test="${end1<now1}">
                     <c:choose>
                           <c:when test="${lists.country eq 10}"><c:set var="country" value="중국"/></c:when>
                           <c:when test="${lists.country eq 30}"><c:set var="country" value="동남아"/></c:when>
                           <c:when test="${lists.country eq 50}"><c:set var="country" value="일본"/></c:when>
                           <c:when test="${lists.country eq 70}"><c:set var="country" value="미국"/></c:when>
                     </c:choose>
                     <tr>
                        <td>
                           ${country}
                              <input type="hidden" value="${country}">
                        </td>
                        <td>
                              ${lists.package_no}
                              <input type="hidden" value="${lists.package_no}">
                        </td>
                        <td class="text-truncate" style="max-width: 300px;">
                             ${lists.product_subject}
                             <input type="hidden" value="${lists.product_subject}">
                        </td>
                        <td>
                           ${lists.availability_start_date} ~ ${lists.availability_end_date}
                           <input type="hidden" value="${lists.availability_start_date}">
                        </td>
                        <td>
                           <input type="radio" value="${lists.package_no}" name="pradio">
                           <input type="hidden" value="${lists.package_total_no}">
                        </td>
                     </tr>
                  </c:if>
               </c:forEach>
         </c:otherwise>
      </c:choose>
      </table>
      <input type="button" value="선택완료" class="btn btn-primary" id="btn">
   </div>

</body>
</html>