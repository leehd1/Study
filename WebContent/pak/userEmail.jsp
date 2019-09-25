<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일인증</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">

.userEmail_btn1:HOVER{
	color: #fcfcfc !important;
    background: #F78536 !important;

}

</style>
<script type="text/javascript">

var authNum="";

//계정인증 버튼 클릭했을때 timer 
function dailyMissionTimer(duration) {
    
    var timer = duration * 3600;
    var hours, minutes, seconds;
    
    var interval = setInterval(function(){
        hours   = parseInt(timer / 3600, 10);
        minutes = parseInt(timer / 60 % 60, 10);
        seconds = parseInt(timer % 60, 10);
      
        hours    = hours < 10 ? "0" + hours : hours;
        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
      
        $('#time-min').text(minutes+":"+seconds);
        if($('#time-min').text()=='00:00'){
           
           alert("인증시간을 초과하였습니다.다시 인증해주세요");
           self.close();
        }

        if (--timer < 0) {
            timer = 0;
            clearInterval(interval);
            
        }
    }, 1000);
}

//계정인증 버튼을 클릭했을때 타이머함수 실행
function EmailTimer(){ 
   
   var user_email=$("#user_email").val();
   $.ajax({
      type : 'POST',
      url  : '/teamproj/mailsend.ms',
      data: { user_email : user_email }, //{parameterName, data} 형식
      dataType : "json",
      success: function(result){
         if(result.msg!=null){
            alert(result.msg);
            return false;
         }
         else{
            alert("메일이 발송되었습니다. 인증번호를 확인해주세요.");
         authNum=result.authNum;
         dailyMissionTimer(0.05);
         }
      }
   });
}

//확인버튼 눌렀을때 부모창으로 email값전달
function setParentText(){
   var num=$("#auth").val();
   
   
   
   if(num==""){
      alert("인증번호를 입력하세요");
      return false;
   }
   if( num != authNum){
      alert("틀린 인증번호 입니다. 인증번호를 확인하여 다시 입력해주세요");
      $("#auth").val("");
      return false;
   }
   if(num==authNum){
      alert("인증 되었습니다.");
      $("#email",opener.document).val($("#user_email").val());
      window.close();
   }
    
}


</script>
</head>
<body>


 <div class="container border">
 <h2 align="center">이메일 인증</h2>
 <div class=" mt-4 bg-white pb-3 pt-3">
   <div class="row col pr-0">
   
   <div class="col-3 text-center"><div class="pt-2"><b>이메일주소</b></div></div>
   <div class="col-9 input-group pr-0">
   <input type="email" class="form-control" placeholder="이메일을 입력해주세요." id="user_email" name="user_email">
    <div class="input-group-prepend">
       <button type="button" class="btn userEmail_btn1"  
       style="border-color: #f78536; color: #f78536;" onclick="EmailTimer();">인증하기</button>
      </div>
   </div>
   
   </div>

 </div>
 <div class=" mt-4 bg-white pt-3">
   <div class="row col pr-0">
   <div class="col-3 text-center"><div class="pt-2"><b>인증번호</b></div></div>
   <div class="col-7 input-group pr-0 pt-1">
   <input type="text" class="form-control pt-2" name="auth" id="auth" placeholder="인증번호 7자리를 입력해주세요.">
   </div>
      <p class="text-danger text-center pt-2 pl-3 col-1" id="time-min">3:00</p>
   
   
   </div>
 </div> 
  <div class="row mt-3">
   <div class="col-3"></div>
    <button class="btn btn-primary col-6" onclick="setParentText();" 
    style= "width: 80%; margin-top: 30px; margin-bottom: 30px; background-color: #f78536; border: 0px;">확인</button>
 <div class="col-1"></div>
  </div>
</div>



</body>
</html>