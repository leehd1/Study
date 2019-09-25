<%@page import="com.member.DB.MemberDAO"%>
<%@page import="com.member.DB.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<c:set var="contextpath" value="${pageContext.request.contextPath}"/>
	<%
// 		String id = "admin";
// 		session.setAttribute("id", id);

		String id = (String)session.getAttribute("id");
		MemberBean dto = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		int level = dao.getmemberlever(id);
		System.out.println(id);
		String IDLEVEL = Integer.toString(level);
		System.out.println("IDLEVEL : "+IDLEVEL);
		session.setAttribute("IDLEVEL", IDLEVEL);
		
	%>
<style type="text/css">
li{
margin-right: 15px;
}

</style>
</head>

<body>
<header class="header">

    <div class="nav-scroller py-1 mr-4">
        <nav class="nav d-flex justify-content-end mr-4">
	        <ul>    
	        <% 
	        	%>
	        	<%
	        	if(id == null){
	        		%>
	        		<li><a class="p-2 text-muted" href="${contextpath}/addMember.me">로그인 / 회원가입</a></li>
	        		<%
	        	}else{
	        		%>
	        		<li><a href="#"><b><%=id %>님</b></a></li>
	        		<%
	        			if(level>3&&level<9){
       				%>
       					<li><a class="p2- text-muted" href="${contextpath}/packageregist.se">&nbsp;&nbsp;패키지 등록</a></li>
       				<%
	        			}
	        		%>
	        		<li id="ula"><div class="dropdown">
	                    <a class="p-2 text-muted" href="${contextpath}/MypageAction.me" id="navbarDropdownMenuLink" aria-haspopup="true" aria-expanded="false">
	                  	  마이페이지
	                    </a>
	                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
	                        <li><a class="dropdown-item text-muted" href="${contextpath}/reserv_con.do">나의 예약/확인</a></li>
	                        <li><a class="dropdown-item text-muted" href="${contextpath}/MemberMooni.me">문의내역</a><li>
	                        <li><a class="dropdown-item text-muted" href="${contextpath}/MemberUpdateAction.me">회원정보수정</a><li>
	                    </ul>
	                </div>
	            </li>
	        		<li><a class="p-2 text-muted" href="${contextpath}/MemberLogout.me">로그아웃</a></li>
	        		<%
	        	}
	        	%>
	        	<c:if test="${id=='admin'}">
	        		<li><a class="p2- text-muted" href="${contextpath}/adminList.ad">&nbsp;&nbsp;<b>관리페이지</b></a></li>
	        	</c:if>
	        </ul>
        </nav>
    </div>
     <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 bg-white border-bottom shadow-sm">
        <div class="my-0 mr-md-auto">
            <a href="${contextpath}/main/index.jsp"><img src="${contextpath}/images/mainlogo.png"></a>
        </div>
        <nav class="my-2 my-md-0 mr-md-auto">
            <h5>
	      <ul>
	      <li><a class="p-2 font-weight-bold text-travel" href="${contextpath}/main/index.jsp">HOME</a></li>
           <li id="ula"><div class="dropdown">
                    <a class="p-2 text-muted" href="${contextpath}/list.pack" id="navbarDropdownMenuLink" aria-haspopup="true" aria-expanded="false">
                  	  패키지
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item text-muted" href="#">중국</a></li>
                        <li><a class="dropdown-item text-muted" href="#">동남아</a></li>
                        <li><a class="dropdown-item text-muted" href="#">일본&nbsp;&nbsp;&nbsp;</a><li>
                        <li><a class="dropdown-item text-muted" href="#">미국</a><li>
                    </ul>
                </div>
            </li>
            <li><a class="p-2 text-muted" href="${contextpath}/jaupak.bo">자유여행</a></li>
            <li><a class="p-2 text-muted" href="${contextpath}/boardList.bo?id=<%=id%>">상품후기</a></li>
            <li><a class="p-2 text-muted" href="${contextpath}/event.bo">이벤트</a></li>
            <li id="ula"><div class="dropdown">
                    <a class="p-2 text-muted" href="${contextpath}/notice.bo" id="navbarDropdownMenuLink" aria-haspopup="true" aria-expanded="false">
                    고객센터
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <li><a class="dropdown-item text-muted" href="${contextpath}/notice.bo">공지사항</a></li>
                        <li><a class="dropdown-item text-muted" href="${contextpath}/Q&A.bo?id=<%=id%>">질문하기</a></li>
                        <li><a class="dropdown-item text-muted" href="${contextpath}/support.bo?ofcate2=항공권&ofcate1=예약/결제">자주묻는질문</a><li>
                    </ul>
                </div>
            </li>
           </ul>
            </h5>
        </nav>
    </div>
</header>

</body>
</html>