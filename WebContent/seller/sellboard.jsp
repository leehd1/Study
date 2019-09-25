<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextpath" value="${pageContext.request.contextPath}"/>
    <%
    	String id = (String)session.getAttribute("id");
    	request.setCharacterEncoding("utf-8");
    	
    	int travel_agency_no = Integer.parseInt(request.getParameter("travel_agency_no"));
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
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main" style="margin-top: 10em;">
    <div class="container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">판매 상품 등록</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
            <div class="card card-body">
                <form action="${contextpath}/sellboardinsert.se" method="post" enctype="multipart/form-data">
                <%-- 판매자의 travel_agency_no 값 넘기기 위한 hidden input --%>
                <input type="hidden" value="<%=travel_agency_no %>" name="travel_agency_no">
                    <div class="form-group">
                        <label for="subject">제목</label>
                        <input type="text" class="form-control" name="product_subject" id="product_subject" required="required">
                    </div>
                   	<label for="subject">썸네일추가</label>
                    <div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">파일추가</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name ="package_img_src">
							<label class="custom-file-label" for="inputGroupFile01"></label>
						</div><br>
					</div>
					<small class="form-text text-muted">size : 500 x 400 이상 권장</small>
					<div>
				        <div class="img_wrap">
				            <img id="img"/>
				        </div>
			    	</div>
                    <div class="form-group">
                        <label for="subject">지역(나라)</label>
                        <div class="input-group mb-3">
                            <select class="custom-select" style="max-width: 10em;" id="inputGroupSelect01" name="sellcate">
                                <option value="중국">중국</option>
                                <option value="동남아">동남아</option>
                                <option value="일본">일본</option>
                                <option value="미국">미국</option>
                            </select>&nbsp;&nbsp;
                            <table class="table table-bordered text-center thwidth" style="max-width: 85%">
                        	<tr>
                        		<th class="table-active">성인</th>
                        		<td>
                        			<div class="input-group">
                        				<input type="text" name="package_price_Adult" class="form-control">
                        			 <div class="input-group-append">
                        				<span class="input-group-text">KRW</span>
                        			</div>
                        			</div>
                        		</td>
                        	
                        		<th class="table-active">소아</th>
                        		<td>
                        			<div class="input-group">
                        				<input type="text" name="package_price_child" class="form-control">
                        			 <div class="input-group-append">
                        				<span class="input-group-text">KRW</span>
                        			</div>
                        			</div>
                        		</td>
                        	
                        		<th class="table-active">유아</th>
                        		<td>
                        			<div class="input-group">
                        				<input type="text" name="package_price_baby" class="form-control">
                        			 <div class="input-group-append">
                        				<span class="input-group-text">KRW</span>
                        			</div>
                        			</div>
                        		</td>
                        	</tr>
                        </table>
                        </div>
                    </div>
                    
                    <div class="row">
	                    <div class="col-lg-3 colsize">
		                    <div class="form-group">
		                    <label for="sellperiod_start">출발시간</label>
				                <div class="input-group">
									<input type="date" class="form-control" name="availability_start_date" id="availability_start_date">
				                </div>
		                    </div>
		                    </div>
						<div class="col-lg-3 colsize">
			                 <div class="form-group">
			                 <label for="sellperiod_end">도착시간</label>
								<div class="input-group">
									<input type="date" class="form-control" name="availability_end_date" id="availability_end_date">
					            </div>
							</div>
		                </div>
		                <div class="col-lg-2 colsize">
		                	<label for="subject">항공</label>
                        	<div class="input-group mb-3">
		                	<select class="custom-select" style="max-width: 10em;" id="inputGroupSelect01" name="airplane_no">
                                <option value="1">제주항공/아시아나항공</option>
                                <option value="2">대한항공/아시아나항공 탑승</option>
                                <option value="3">유나이티드 국제선 왕복 항공</option>
                            </select>
                            </div>
		                </div>
		                <div class="col-lg-2 colsize">
		                	<div class="form-group">
		                	<label for="sellpackageterm">패키지 진행 기간</label>
		                		<div class="input-group">
									<input type="text" class="form-control" name="packageterm" id="packageterm">
									<div class="input-group-append">
                        				<span class="input-group-text">일</span>
                        			</div>
					            </div>
		                	</div>	
		               	</div>
		               	<div class="col-lg-2 colsize">
		                	<div class="form-group">
		                	<label for="sellreserve_total">예정(최소)출발 인원</label>
		                		<div class="input-group">
									<input type="text" class="form-control" name="min_start_no" id="min_start_no">
									<div class="input-group-append">
                        				<span class="input-group-text">명</span>
                        			</div>
					            </div>
		                	</div>	
		               	</div>
                    </div>
                    
                    <div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">판매상품 <br>간략정보</span>
						</div>
						<textarea class="form-control" aria-label="With textarea" placeholder="작성하신 글이 리스트에서 표시됩니다" name="product_simple_info" style="white-space: pre;"></textarea>
					</div><br>
                    <div class="form-group">
                        <label for="p_content">패키지 상세일정</label>
                        <div class="input-group">                 
						<textarea class="form-control" id="p_content" name="product_info"></textarea>
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
	<script type="text/javascript">
	$(".custom-file-input").on("change", function() {
		  var fileName = $(this).val().split("\\").pop();
		  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
		});
        var sel_file;
 
        $(document).ready(function() {
            $("#inputGroupFile01").on("change", handleImgFileSelect);
        }); 
        function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
            filesArr.forEach(function(f) {
                if(!f.type.match("image.*")) {
                    alert("확장자는 이미지 확장자만 가능합니다.");
                    return;
                }
                sel_file = f;
                var reader = new FileReader();
                reader.onload = function(e) {
                    $("#img").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }
    </script>

</body>
</html>