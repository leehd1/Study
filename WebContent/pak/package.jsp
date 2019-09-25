<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="imagePath" value="img" />
<c:set var="context" value="${pageContext.request.contextPath}" />
<c:set var="list" value="${packageList}" />
<c:set var="paging" value="${pagingVO}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- JQuery datepicker -->
<link rel="stylesheet" href="${context}/css/jquery-ui.css">
<script src="${context}/js/jquery.js"></script>
<script src="${context}/js/jquery-ui.js"></script>

<link rel="stylesheet" href="./css/style.css">
<script type="text/javascript">
  $(function() {
	    
	  var period = $("#secondCategoryPeriod");
      var ect = $("#secondCategoryEct");
      ect.hide();
      
	    $("#changeCategory").change(function() {
	        
	    	if ($(this).val() == "period") {
                period.show();
                ect.hide();
	    	} else if ($(this).val() == "ect") {
                period.hide();
                ect.show();
	    	}
	    	
	    });
	    
	});
</script>

<title>Insert title here</title>
<style type="text/css">

    #ula > .dropdown:hover .dropdown-menu { 
    display:block;
    margin-top:0; 
    position: absolute;
    }
    .my-2 a{
        font-size: 1.2em;
        text-decoration: none;
        font-weight:bold;
    }
    .my-2 a:HOVER {
    color: #F78536 !important;
    }
    .text-travel{
    color: #F78536 !important;
    }
    ul, li{
        float: left;
    }

</style>
</head>
<body>
<%-- header.stary --%>
    <jsp:include page="../inc/header.jsp" />
<%-- header.end --%>

<section role="main">
    <div class="container" style="margin-top: 200px;">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">패키지 상품</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
            <form class="flex-fill" action="${context}/search.pack">
                <div class="form-group form-row">
<!--                     <div class="col-sm-2"> -->
<!--                         <select class="form-control" id="changeCategory" name="firstCategory"> -->
<!--                             <option value="period">기간</option> -->
<!--                             <option value="ect">기타</option> -->
<!--                         </select> -->
<!--                     </div> -->
                    <div class="input-group col-sm-4">
                    	<input type="hidden" value="period" name="firstCategory">
						<div class="input-group-prepend">
						    <label class="input-group-text" for="inputGroupSelect01">기간</label>
						</div>
                        <select class="form-control" id="secondCategoryPeriod" name="secondCategoryPeriod">
                            <option value="all">전체</option>
                            <option value="lt3">3일 이하</option>
                            <option value="4to5">4~5일</option>
                            <option value="6to7">6~7일</option>
                            <option value="8to15">8~15일</option>
                            <option value="gt15">15일 이상</option>
                        </select>
                        <select class="form-control" id="secondCategoryEct" name="secondCategoryEct">
                            <option value="all">전체</option>
                            <option value="sebject">제목</option>
                            <option value="content">내용</option>
                        </select>
                    </div>
                    <div class="input-group col-sm-8">
                        <input type="text" class="form-control" id="inputGroupSelect01" name="searchValue" placeholder="검색어 입력">
                        <div class="input-group-append">
                            <button class="btn btn-info" type="submit">검색</button>
                        </div>
                    </div>
                </div>
                <small class="form-text text-muted">예) 패키지 기간 검색...</small>
            </form>
        </div>
        
        
        
        
        <div class="my-3 p-3 bg-white rounded shadow border-bottom border-right">
            <small id="idHelpBlock" class="text-muted mb-1">
                총 등록글 : <c:out value="${paging.totalRecord}" /> (페이지 : <c:out value="${paging.nowPage}" />/<c:out value="${paging.totalPage}" />)
            </small>
            <div class="row">
            <c:choose>
                <c:when test="${list == null ||  paging.totalRecord == 0}">
                    <div class="card-deck pt-3 col-sm-12">
                        <div class="text-center mx-auto">등록된 게시글이 없습니다</div>
                    </div>
                </c:when>
                <c:when test="${list != null && paging.totalRecord != 0}">
                    <c:set var="deckNo" value="0" />
                    <c:forEach items="${list}" var="packInfo">
                        <c:if test="${deckNo % 3 == 0}">
                            <div class="card-deck pt-3 col-sm-12">
                        </c:if>
                            <div class="card" onclick="location.href='${context}/info.pack?packageNo=${packInfo.package_no}';" style="cursor:pointer">
                                <c:choose>
                                    <c:when test="${packInfo.package_img_src != null && !empty packInfo.package_img_src}"><c:set var="package_img_src" value="${packInfo.package_img_src}" /></c:when>
                                    <c:otherwise><c:set var="package_img_src" value="no_img.png" /></c:otherwise>
                                </c:choose>
                                <img src="${context}/${imagePath}/${package_img_src}" class="card-img-top" alt="여행지 사진">
                                <div class="card-body">
                                    <h5 class="card-title text-truncate"><c:out value="${packInfo.product_subject}" /></h5>
                                    <p class="card-text text-truncate"><c:out value="${packInfo.product_simple_info}" /></p>
                                </div>
                                <div class="card-footer">
                                    ${packInfo.package_price_Adult} 만원 ~
                                </div>
                            </div>
                        <c:if test="${deckNo % 3 == 2}">
                            </div>
                        </c:if>
                        <c:set var="deckNo" value="${deckNo + 1}" />
                    </c:forEach>
                </c:when>
            </c:choose>
            </div>
            <div class="card-deck row pt-3">
                <ul class="pagination mx-auto">
                    <c:if test="${paging.prevBtnVisible}"><li class="page-item"><a class="page-link" href="${context}/list.pack?page=${paging.prevBlock}">이전</a></li></c:if>
                    <c:if test="${paging.totalBlock > 0}">
                        <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
                            <c:choose>
                                <c:when test="${paging.nowPage == i}"><li class="page-item active" aria-current="page"><span class="page-link">${i}<span class="sr-only">(current)</span></span></li></c:when>
                                <c:otherwise><li class="page-item"><a class="page-link" href="${context}/list.pack?page=${i}">${i}</a></li></c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                    <c:if test="${paging.nextBtnVisible}"><li class="page-item"><a class="page-link" href="${context}/list.pack?page=${paging.nextBlock}">이후</a></li></c:if>
                </ul>
            </div>
        </div>
    </div>
</section>

<%--footer.start --%>
    <jsp:include page="/inc/footer.jsp" />
<%--footer.end --%>

</body>
</html>