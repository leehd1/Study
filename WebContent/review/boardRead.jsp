<%@page import="com.board.packboardDB.replyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.board.packboardDB.packnoboardDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.board.packboardDB.packspboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath }"/>
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
<style type="text/css">
	.star{
		margin: 10px 0;
	}
	.star>span{
		margin: 25px;
	}
	
	.btn{
    top: 0;
    right: 0;
    border: 1px solid #575757;
	}
	
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}

.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
</head>
<%
	packspboardDTO dto = (packspboardDTO)request.getAttribute("dto");
	List lists = (List)request.getAttribute("list");
	SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd");
	SimpleDateFormat s1 = new SimpleDateFormat("yy-MM-dd hh:mm");
	String id = (String)session.getAttribute("id");
%>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main">
    <div class="container" style="margin-top: 10em;">
<!--         <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">예약상황 및 확인</h1> -->
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <div>
            	<div style="margin: 1em;"><%=dto.getSptitle() %></div><span style="float: right; margin: 2em;">
            			아이디 : <%=dto.getSpid() %> &nbsp;&nbsp;&nbsp;&nbsp; 작성일 : <%=s.format(dto.getDate()) %>
            	</span>
            </div>
            
            <div class="dush" style=""></div>
            	<div style="margin: 10px"> [<%=dto.getSpcate() %>] <a href="info.pack?packageNo=<%=lists.get(1)%>"><%=lists.get(0)%></a></div>
            	<table class="table table-borderless">
                    	<tr>
	                    	<td>
								<div class="starRev input-group breadcrumb">
								<div class="breadcrumb-item text-success">한줄 평 : <%=dto.getSpsimple_content() %> </div>
								</div>
								   <%
								      int star = dto.getStar()*2;
								      for(int i=1 ; i<11 ; i++ ){
								         if( star >= i){
								   %>      
								      <span class="<%if(i%2==1){%>starR1<%}else{%>starR2<%}%> on"><%=i%></span>
								   <%      
								         }else{
								   %>
								      <span class="<%if(i%2==1){%>starR1<%}else{%>starR2<%}%>"><%=i%></span>
								   <%
								         }
								      }
								   %>
								   
							</td>
						</tr>
					</table>
            <div class="content" style="margin: 2em;">
            	<%=dto.getSpcontent() %>
            </div>
            <br><br><br>
            <div style="margin: 2em;">
            	<h3>의견 남기기
            		<c:if test="${id!=null}">
            		<input type="button" class="btn btn-info" value="목록보기" onclick="location='./boardList.bo'" style="float: right; height: auto; margin-left: 1em;">
            		<%
            			String spid = dto.getSpid();
            			if(id.equals(dto.getSpid())||id.equals("admin")){
            				%>
								<input type="button" class="btn btn-info" value="삭제" onclick="location='./boardDelete.bo?spno=<%=dto.getSpno() %>'" style="float: right; height: auto; margin-left: 1em;">
            					<input type="button" class="btn btn-info" value="수정하기" onclick="location='./boardPost.bo?spno=<%=dto.getSpno() %>'" style="float: right; height: auto;">            				
            				<%
            			}
            		%>
            		</c:if>
            		<c:if test="${id==null}">
            		<input type="button" class="btn btn-info" value="목록보기" onclick="location='./boardList.bo'" style="float: right; height: auto; margin-left: 1em;">
            		</c:if>
            	</h3>
            	<form action="${contextpath}/boardReadreply.bo?spno=<%=dto.getSpno()%>&reid=<%=id%>" method="post">
            	<table class="table">
            	<%
            		packnoboardDAO dao = new packnoboardDAO();
            		int spno = dto.getSpno();
            		int count = dao.regetcount(spno);
            		if(count!=0){
            			List list = new ArrayList();
            			list = dao.getreply(spno);
            			System.out.println(list.size());
            			for(int i=0; i<list.size(); i++){
							replyDTO dto1 = new replyDTO();
            				dto1 = (replyDTO)list.get(i);
                			%>              			
                				<div>
                					<b><%=dto1.getReid()%></b><br>
                					<%=dto1.getRecontent() %>&nbsp;
                					<span style="opacity: 0.8; font-size: 0.8em;">
                					<c:if test="${id!=null }">
                					<%
                						if(id.equals(dto1.getReid())){
                						%>
                						<a href="${contextpath}/replydelete.bo?reno=<%=dto1.getReno()%>&spno=<%=dto.getSpno()%>">삭제</a>
                						<%	
                						}
                					%>
                					</c:if>
                					</span><br>
                					<span style="opacity: 0.5;"><%=s1.format(dto1.getDate())%></span>
                				</div>
                				<div class="dush" style="opacity: 0.5;"></div>
                			<%
            			}
            		}
            	%>
            		
            	</table>
            	<div class="input-group mb-3">
				  <textarea class="form-control" aria-label="With textarea" name="recontent"></textarea>
				  <div class="input-group-prepend">
				  <c:if test="${id==null }">
				  <button class="btn btn-outline-secondary" id="button-addon2" type="button" onclick="add()">등록</button>
				  <script type="text/javascript">
				  	function add() {
						alert("회원만 작성 가능합니다.");
					}
				  </script>
				  </c:if>
				  <c:if test="${id!=null}">
				    <button class="btn btn-outline-secondary" id="button-addon2">등록</button>
				  </c:if>
				  </div>
				</div>
            	</form>
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