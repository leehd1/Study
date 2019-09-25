<%@page import="com.board.packboardDB.ofquestDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	List<ofquestDTO> list = (List<ofquestDTO>)request.getAttribute("list");
%>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>
<section role="main">
    <div class="container fst_container">
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <div class="border-bottom border-muted pb-2">
                <h3><span class="badge badge-success">항공권</span></h3>
            </div>
            <div class="pt-3">
                <p class="mb-0 lh-125">
                
                    <a href="./support.bo?ofcate2=항공권&ofcate1=예약/결제" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">예약/결제</a>
                    <a href="./support.bo?ofcate2=항공권&ofcate1=발권/티켓수령" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">발권/티켓수령</a>
                    <a href="./support.bo?ofcate2=항공권&ofcate1=변경/취소" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">변경/취소</a>
                    <a href="./support.bo?ofcate2=항공권&ofcate1=탑승수속" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">탑승수속</a>
                    <a href="./support.bo?ofcate2=항공권&ofcate1=수화물/동승자" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">수화물/동승자</a>
                    <a href="./support.bo?ofcate2=항공권&ofcate1=기타" class="text-secondary text-decoration-none">기타</a>
                </p>
            </div>
        </div>
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <div class="border-bottom border-muted pb-2">
                <h3><span class="badge badge-success">여행</span></h3>
            </div>
            <div class="pt-3">
                <p class="mb-0 lh-125">
                    <a href="./support.bo?ofcate2=여행&ofcate1=패키지" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">패키지</a>
                    <a href="./support.bo?ofcate2=여행&ofcate1=예약/결제" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">예약/결제</a>
                    <a href="./support.bo?ofcate2=여행&ofcate1=변경/취소" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">변경/취소</a>
                </p>
            </div>
        </div>
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <div class="border-bottom border-muted pb-2">
                <h3><span class="badge badge-success">기타서비스</span></h3>
            </div>
            <div class="pt-3">
                <p class="mb-0 lh-125">
                    <a href="./support.bo?ofcate2=기타서비스&ofcate1=공항미팅" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">공항미팅</a>
                    <a href="./support.bo?ofcate2=기타서비스&ofcate1=공항정보" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">공항정보</a>
                    <a href="./support.bo?ofcate2=기타서비스&ofcate1=여권/비자" class="text-secondary text-decoration-none border-muted border-right pr-3 mr-2">여권/비자</a>
                    <a href="./support.bo?ofcate2=기타서비스&ofcate1=국제전화" class="text-secondary text-decoration-none border-muted">국제전화</a>
                </p>
            </div>
        </div>
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
<!--             <ol class="breadcrumb bg-light"> -->
<!--                 <li class="breadcrumb-item text-success font-weight-bold"></li> -->
<!--                 <li class="breadcrumb-item text-success font-weight-bold"></li> -->
<!--             </ol> -->
            <%
            if(list.size()!=0){
            	for(int i=0; i<list.size(); i++){
            		ofquestDTO dto = list.get(i);
            	
            %>
            <div class="accordion" id="accordionExample">
                <div class="card">
                    <div class="card-header bg-white" id="heading1">
                        <h2 class="mb-0">
                            <button class="btn btn-link collapsed text-decoration-none" type="button" data-toggle="collapse" data-target="#collapse1<%=i %>" aria-expanded="false" aria-controls="collapseOne">
                                <span class="badge badge-primary"><%=dto.getOfcate2() %></span>
                                <span class="badge badge-success"><%=dto.getOfcate1() %></span>
                                 	<%=dto.getOftitle() %>
                            </button>
                        </h2>
                    </div>
                    <div id="collapse1<%=i %>" class="collapse" aria-labelledby="heading1 data-parent="#accordionExample">
                        <div class="card-body">
                        <%=dto.getOfcontent() %>
                        </div>
                    </div>
                </div>
            </div>
            <%
            	}
            }else{
            	%>
            		<div class="text-center">해당 항목이 존재하지 않습니다.</div>
            	<%
            }
            %>
            
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