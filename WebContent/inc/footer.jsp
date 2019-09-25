<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- JQuery 스고 싶으면 주석 해제! --%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="../css/style.css">
</head>
<meta charset="UTF-8">
<title>Insert title here</title>
<body>

	<footer class="footer mt-auto py-3 bg-dark box">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                   <p class="mt-1 mb-1 text-white">
                       &copy; 2019. 리현도. All rights reserved.<br>
                       tel : 010-1234-5678<br>
                       fax : 055-123-987<br>
                       address : 부산광역시 부산진구 동천로 109 삼한골든게이트빌딩 7층<br>
                       email : abc@naver.com<br>
                       <a class="badge badge-secondary" data-toggle="collapse" href="#collapse" role="button" aria-expanded="false" aria-controls="collapse">
                         이메일 문의
                       </a>
                       <div class="collapse" id="collapse">
                           <div class="card card-body">
                           <form action="${contextPath}/sendMail.do" method="post">
                               <div class="form-group">
                                   <label for="email">이메일</label>
                                   <input type="email" class="form-control" name="email" id="email" placeholder="답변받을 이메일 주소">
                               </div>   
                               <div class="form-group">
                                   <label for="subject">주제</label>
                                   <input type="text" class="form-control" name="subject" id="subject" placeholder="">
                               </div>   
                               <div class="form-group">
                                   <label for="content">내용</label>
                                   <textarea class="form-control" id="content" name="content" rows="6" style="resize: none;"></textarea>
                               </div>
                               <div class="form-group">
                                   <button type="submit" class="btn btn-primary">보내기</button>
                               </div>
                           </form>
                           </div>
                       </div>
                   </p>
                </div>
                <div class="col-sm-4">
                    <div class="dropdown text-right">
                        <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    참고사이트
                        </a>
                    
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="http://postcode.map.daum.net/guide" target="_blank">주소검색 API</a>
                            <a class="dropdown-item" href="https://getbootstrap.com/" target="_blank">부트스트랩</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

</body>
</html>