<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.board.packboardDB.packnoboardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
<%
	int count=((Integer)request.getAttribute("count")).intValue();
	List<packnoboardDTO> list=(List<packnoboardDTO>)request.getAttribute("boardList");
	String pageNum=(String)request.getAttribute("pageNum");
	int pageCount=((Integer)request.getAttribute("pageCount")).intValue();
	int pageBlock=((Integer)request.getAttribute("pageBlock")).intValue();
	int startPage=((Integer)request.getAttribute("startPage")).intValue();
	int endPage=((Integer)request.getAttribute("endPage")).intValue();
	String search1 = (String)request.getAttribute("search1");
	String search2 = (String)request.getAttribute("search2");
	String search3 = (String)request.getAttribute("search3");
	
	SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd");
%>
<title>Insert title here</title>
<!-- <style type="text/css"> -->
<!-- /*  	.footer{  */ -->
<!-- /*  		position: fixed;  */ -->
<!-- /* 		width: 100%;  */ -->
<!-- /*  		bottom: 0;  */ -->
<!-- /*  	}  */ -->
<!-- </style> -->
</head>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main">
    <div class="container fst_container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">Dashboard</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
            <form class="flex-fill row" action="./noticesearch.bo">
                <div class="col-sm-2">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="search1">분류</label>
                        </div>
                        <select class="custom-select" id="search1" name="search1">
                            <option value=" ">전체</option>
                            <option value="공지">공지</option>
                            <option value="국제선">국제선</option>
                            <option value="국내선">국내선</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-2">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="search2">구분</label>
                        </div>
                        <select class="custom-select" id="search2" name="search2">
                            <option value=" ">전체</option>
                            <option value="notitle">제목</option>
                            <option value="nocontent">내용</option>
                        </select>
                    </div>
                </div>
                <div class="col-sm-8">
                    <div class="input-group">
                        
                        <div class="input-group-prepend">
                            <label class="input-group-text" for="search3">검색어를 입력하세요</label>
                        </div>
                        <input type="text" class="form-control" id="search3" name="search3" value=" ">
                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">검색</button>
                        </div>
                    </div>
                    <small class="form-text text-muted">예) 결제, 결제확인, 결제취소, 예약확인, 예약취소, 호텔...</small>
                </div>
            </form>
        </div>
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <ol class="breadcrumb bg-light">
                <li class="breadcrumb-item text-success font-weight-bold">고객센터</li>
                <li class="breadcrumb-item text-success font-weight-bold">공지사항</li>
            </ol>
            <div class="table">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th class="text-center" width="10%">번호</th>
                            <th class="text-center" width="10%">분류</th>
                            <th class="text-center">제목</th>
                            <th class="text-center" width="10%">등록일</th>
                            <th class="text-center" width="10%">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    if(count != 0){
                		for(int i=0; i<list.size(); i++){
                			packnoboardDTO bdto = new packnoboardDTO();
                			bdto = list.get(i);
                    %>
                        <tr>
                            <td class="text-center"><%=bdto.getNono() %></td>
                            <td class="text-center"><%=bdto.getNocate() %></td>
                            	<td>
                            		<a href="${contextpath}/noticeread.bo?nono=<%=bdto.getNono()%>"><%=bdto.getNotitle() %></a>
                            	</td>
                            <td class="text-center"><%=s.format(bdto.getDate()) %></td>
                            <td class="text-center"><%=bdto.getCount() %></td>
                        </tr>
                        <%
                		}
                    }
                        %>
                        <%
                        	if(count==0){
                        		%>
                        			<tr>
                        				<td colspan="5" align="center">
                        					검색 결과가 없습니다.
                        				</td>
                        			</tr>
                        		<%
                        	}
                        %>
                    </tbody>
                </table>
                <div class="col-lg-6 offset-lg-3 d-flex">
                    <ul class="pagination mx-auto">
                     <%
                        	if(count != 0){
                        		if(startPage > pageBlock){
                        	
                        %>
                        <li class="page-item">
                            <a class="page-link" href="./noticesearch.bo?pageNum=<%=startPage-pageBlock%>&search1=<%=search1 %>&search2=<%=search2 %>&search3=<%=search3%>" aria-label="Previous">
                                <span aria-hidden="true">«</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                        <%
                        	}
		                     for(int i=startPage;i<=endPage;i++){
                        %>
                        <li class="page-item">
                        	<a class="page-link" href="./noticesearch.bo?pageNum=<%=i%>&search1=<%=search1 %>&search2=<%=search2 %>&search3=<%=search3%>"><%=i %></a>
                        </li>
                        <%
							}
							if(endPage < pageCount){
						%>
                        <li class="page-item">
                            <a class="page-link" href="./noticesearch.bo?pageNum=<%=startPage+pageBlock%>&search1=<%=search1 %>&search2=<%=search2 %>&search3=<%=search3%>" aria-label="Next">
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