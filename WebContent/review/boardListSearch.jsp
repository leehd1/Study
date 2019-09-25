<%@page import="com.board.packboardDB.packnoboardDAO"%>
<%@page import="com.board.packboardDB.packspboardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
    
    <%
   int count=((Integer)request.getAttribute("count")).intValue();
	List<packspboardDTO> list=(List<packspboardDTO>)request.getAttribute("list");
	String pageNum=(String)request.getAttribute("pageNum");
	int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
	SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd");
	String spboardsearch1 = (String)request.getAttribute("spboardsearch1");
	String spboardsearch2 = (String)request.getAttribute("spboardsearch2");
	
    %>
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
	.tab td{
		vertical-align: middle;
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
                <li class="breadcrumb-item text-success font-weight-bold">예약 / 확인</li>
            </ol>
            <br>
            <div class="container text-center" style="margin: 0.5em;">
   	            <button class="btn btn-secondary" onclick="location='${contextpath}/boardList.bo'">전체</button>
   				<button class="btn btn-secondary" onclick="location='${contextpath}/spboardsearch.bo?&spboardsearch1=spcate&spboardsearch2=중국'">중국</button>
   				<button class="btn btn-secondary" onclick="location='${contextpath}/spboardsearch.bo?&spboardsearch1=spcate&spboardsearch2=동남아'">동남아</button>
   				<button class="btn btn-secondary" onclick="location='${contextpath}/spboardsearch.bo?&spboardsearch1=spcate&spboardsearch2=일본'">일본</button>
   				<button class="btn btn-secondary" onclick="location='${contextpath}/spboardsearch.bo?&spboardsearch1=spcate&spboardsearch2=미국'">미국</button>
            </div>
            <div class="table-responsive">
                <table class="table table-hover tab" style="table-layout: fixed">
                        <tr>
                            <th class="text-center" width="5%">NO</th>
                            <th class="text-center" width="10%">지역</th>
                            <th class="text-center" width="50%">제목</th>
                            <th class="text-center" width="10%">아이디</th>
                            <th class="text-center" width="10%">별점</th>
                            <th class="text-center" width="15%">등록일</th>
                            <th class="text-center" width="15%">조회수</th>
                        </tr>
                        <%
                    if(count != 0){
                		for(int i=0; i<list.size(); i++){
                			packspboardDTO dto = new packspboardDTO();
                			dto = list.get(i);
                			packnoboardDAO dao = new packnoboardDAO();
                			int cnt = dao.regetcount(dto.getSpno());
                    %>
                        <tr>
							<td class="text-center"><%=dto.getSpno() %></td>
                            <td class="text-center"><%=dto.getSpcate() %></td>
                            <td class="text-center" style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
                            	<a href="${contextpath}/boardRead.bo?spno=<%=dto.getSpno()%>"><%=dto.getSptitle()%> <%if(cnt!=0){%>(<%=cnt %>)<%}%></a>
                            </td>
                            <td class="text-center"><%=dto.getSpid() %></td>
                            <td class="text-center"><%=dto.getStar() %></td>
                            <td class="text-center"><%=s.format(dto.getDate()) %></td>
                            <td class="text-center"><%=dto.getSpcount()%></td>
                        </tr>
                        <%
                		}
                    }
                        if(count==0){
                        	%>
                        		<tr>
                        			<td class="text-center" colspan="7">만족하는 검색 결과가 없습니다.</td>
                        		</tr>
                        	<%
                        }
                        %>
                </table>
                
            <div class="col text-right"><button class="btn btn-primary" onclick="location='${contextpath}/spboardcreate.bo'">글쓰기</button></div>
            	<form action="${contextpath}/spboardsearch.bo" method="post">
		            <div class="col-lg-6 offset-lg-3 d-flex" style="margin-top: 0.5em; margin-bottom: 0.5em;">
			            <div class="input-group col-4">
							<select class="custom-select" id="inputGroupSelect01" name="spboardsearch1">
							    <option value="spid">아이디</option>
							    <option value="spcontent">내용</option>
							    <option value="sptitle">제목</option>
							</select>
		                </div>
		                <div class="input-group col-8">
		                        <input type="text" class="form-control" id="inputGroupSelect01" name="spboardsearch2">
		                        <div class="input-group-append">
		                            <button class="btn btn-info">검색</button>
		                        </div>
		                  </div>
		            </div>
            	</form>    
            <div class="col-lg-6 offset-lg-3 d-flex">
                <ul class="pagination mx-auto">
                     <%
                        	if(count != 0){
                        		if(startPage > pageBlock){
                        	
                        %>
                        <li class="page-item">
                            <a class="page-link" href="./spboardsearch.bo?pageNum=<%=startPage-pageBlock%>&spboardsearch1=<%=spboardsearch1 %>&spboardsearch2=<%=spboardsearch2 %>" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <%
                        	}
		                     for(int i=startPage;i<=endPage;i++){
                        %>
                        <li class="page-item">
                        	<a class="page-link" href="./spboardsearch.bo?pageNum=<%=i%>&spboardsearch1=<%=spboardsearch1 %>&spboardsearch2=<%=spboardsearch2 %>"><%=i %></a>
                        </li>
                        <%
							}
							if(endPage < pageCount){
						%>
                        <li class="page-item">
                            <a class="page-link" href="./spboardsearch.bo?pageNum=<%=startPage+pageBlock%>&spboardsearch1=<%=spboardsearch1 %>&spboardsearch2=<%=spboardsearch2 %>" aria-label="Next">
                                <span aria-hidden="true">»</span>
                                <span class="sr-only">Next</span>
                            </a>
                        </li>
                        <%
							}	
						}
						%>
                    </ul>
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