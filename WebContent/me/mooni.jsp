<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.board.packboardDB.questionDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
    <%
    	List<questionDTO> list = (List<questionDTO>)request.getAttribute("list");
    	SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%-- css --%>
<link rel="stylesheet" href="./css/style.css">
<title>Insert title here</title>
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
                <li class="breadcrumb-item text-success font-weight-bold">문의 내역</li>
            </ol>
            <br>
            <div class="container text-center" style="margin: 0.5em;">
            
            </div>
            <div class="table-responsive" style="height: 350px;">
                <table class="table table-sm">
                    <thead>
                        <tr class="table-active">
                            <th class="text-center">NO</th>
                            <th class="text-center">상담분류</th>
                            <th class="text-center">문의 제목</th>
                            <th class="text-center">작성일</th>
                            <th class="text-center">처리 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    	for(int i=0; i<list.size(); i++){
                    		questionDTO dto = (questionDTO)list.get(i);
                    		%>
                    		<tr>
	                    		<td class="text-center"><%=i+1%></td>
	                    		<td class="text-center"><%=dto.getQcate() %></td>
	                            <td class="text-center"><a href="${contextpath}/MooniRead.me?qno=<%=dto.getQno()%>"><%=dto.getQtitle()%></a></td>
	                            <td class="text-center"><%=s.format(dto.getDate())%></td>
	                            <td class="text-center"><%=dto.getQstate() %></td>
                            </tr>
                    		<%
                    	}
                    if(list.size()==0){
                    	%>
                    		<tr>
                    			<td colspan="5" class="text-center">문의 내역이 없습니다</td>
                    		</tr>
                    	<%
                    }
                    %>
                    
                    </tbody>
                </table>
                
            </div>
        </div>
    </div>
</section>
<%
	request.setAttribute("list", list);
%>

<%--footer.start --%>
	<div>
	<jsp:include page="../inc/footer.jsp"></jsp:include>
	</div>
	<%--footer.end --%>

</body>
</html>