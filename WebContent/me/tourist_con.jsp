<%@page import="com.pack.packageDB.TouristDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pack.packageDB.ReservationDTO"%>
<%@page import="com.pack.packageDB.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html;charset=utf-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
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
<%
	String reserve_no = request.getParameter("reserve_no");
	System.out.println(reserve_no);
	ReservationDAO rdao = new ReservationDAO();
	TouristDTO tdto;
	List list = new ArrayList();
	
	list = rdao.getTourist(reserve_no);
	
%>
</head>
<body>
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
	            <%
	            	for(int i=0; i<list.size() ; i++){
	            		tdto = (TouristDTO)list.get(i);
	            %>		
		             <tr>
			             <td class="text-center"><%=tdto.getTour_person_level()%></td>
			             <td class="text-center"><%=tdto.getTour_ko_name()%></td>
			             <td class="text-center"><%=tdto.getTour_last_name()%></td>
			             <td class="text-center"><%=tdto.getTour_first_name()%></td>
			             <td class="text-center"><%=tdto.getTour_birthday()%></td>
			             <td class="text-center"><%=tdto.getTour_gender()%></td>
			             <td class="text-center"><%=tdto.getTour_nation()%></td>
			             <td class="text-center"><%=tdto.getTour_passport_num()%></td>
			             <td class="text-center"><%=tdto.getTour_passport_end()%></td>
			         </tr>
	            <%	
	            	}
	            %>
		    </tbody>
		</table>
	 </div>
</body>
</html>