<%@page import="com.board.packboardDB.packspboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
    <%
    	request.setCharacterEncoding("utf-8");
    	packspboardDTO dto = (packspboardDTO)request.getAttribute("dto");
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

<%-- editor link --%>
<script type="text/javascript" src="${contextpath}/ckeditor/ckeditor.js"></script>
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function() {
	$('.starRev span').click(function(){
		$('#star').val($(this).text());
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');
		$('.starresult').text(($('#star').val()/2));
		return false;
	});
	$('.starRev span').mouseenter(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});
	$('.starRev span').mouseleave(function(){
	  $(this).parent().children('span').removeClass('on');
	  $('.starRev span:eq('+($('#star').val()-1)+')').addClass('on').prevAll('span').addClass('on');
	  
	  return false;
	});
});
</script>
<style type="text/css">
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
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main" style="margin-top: 10em;">
    <div class="container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">후기 수정</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
            
            <div class="card card-body">
                <form action="${contextpath}/spboardUpdate.bo?spno=<%=dto.getSpno() %>" method="post">
                    
                    <div class="form-group">
                        <label for="subject">제목</label>
                        <input type="text" class="form-control" name="sptitle" id="sptitle" value="<%=dto.getSptitle()%>">
                    </div>
                   	<label for="subject">다녀온 패키지</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="sppackage" id="sppackage" readonly="readonly" value="<%=dto.getSppackage()%>">
                    </div>
                    <div class="form-group">
                    <label>별점주기</label>
                    <table class="table table-bordered">
                    	<tr>
	                    	<td>
								<div class="starRev input-group">
								  <span class="starR1 on">1</span>
								  <span class="starR2 ">2</span>
								  <span class="starR1">3</span>
								  <span class="starR2">4</span>
								  <span class="starR1">5</span>
								  <span class="starR2">6</span>
								  <span class="starR1">7</span>
								  <span class="starR2">8</span>
								  <span class="starR1">9</span>
								  <span class="starR2">10</span>&nbsp;&nbsp;&nbsp;별점 : &nbsp; 
								  <div class="starresult"><%=dto.getStar() %></div>
								  <input type="hidden" value="1" id="star" name="star">
								</div>
							</td>
						</tr>
					</table>
                    </div>
                    <div class="form-group">
                    	<label for="spsimple_content">한줄평</label>
                    	<input type="text" class="form-control" name="spsimple_content" id="spsimple_content" value="<%=dto.getSpsimple_content()%>">
                    </div>
                    <div class="form-group">
                        <label for="p_content">내용</label>
                        <div class="input-group">
						<textarea class="form-control" id="p_content" name = "spcontent"><%=dto.getSpcontent() %></textarea>
							<script type="text/javascript">
							CKEDITOR.replace('p_content'
							                , {height: 500, width: 1100                                                  
							  });
							</script>
                </div>
                    </div>
                    <div class="form-group row justify-content-sm-center">
                        <div class="col-sm-auto">
                            <button type="submit" id="sendMail" class="btn btn-primary">작성완료</button>
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