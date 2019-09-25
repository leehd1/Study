<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="id" value="${param.id}" />
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
</head>
<body>

<%-- header.stary --%>
	<jsp:include page="../inc/header.jsp"></jsp:include>
<%-- header.end --%>

<section role="main" style="margin-top: 10em;">
    <div class="container">
        <h1 class="h2 mt-2 mb-2 pb-2 border-bottom">질문하기</h1>
        <div class="d-flex align-items-center p-3 my-3 rounded shadow border-bottom border-right">
            
            <div class="card card-body">
                <form action="./qandaAction.bo" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="email">아이디</label><br>
                        <div><b>${id}</b></div>
                        <input type="hidden" value="${id}" name="qid">
                    </div>
                    <div class="form-group">
                        <label for="subject">분류</label>
                        <div class="input-group mb-3">
                            <select class="" id="inputGroupSelect01" name="qcate">
                                <option value="여행">여행</option>
                                <option value="여권">여권</option>
                                <option value="기타문의">기타문의</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="subject">제목</label>
                        <input type="text" class="form-control" name="qtitle" id="subject" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea class="form-control" id="content" name="qcontent" rows="6" style="resize: none;"></textarea>
                    </div>
                    
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="inputGroupFileAddon01">파일추가</span>
						</div>
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" name ="file">
							<label class="custom-file-label" for="inputGroupFile01"></label>
						</div>
					</div>
					
                    <div class="form-group row justify-content-sm-center">
                        <div class="col-sm-auto">
                            <button type="submit" id="sendMail" class="btn btn-primary">보내기</button>
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
	<script>
	
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>

</body>
</html>