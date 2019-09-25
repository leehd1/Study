<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
   String contextpath = request.getContextPath();
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/style.css">
<style type="text/css">
html {
  width: 100%;
  height: 100%;
}

body {
/*     background: -webkit-linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%); */
/*     background: linear-gradient(45deg, rgba(66, 183, 245, 0.8) 0%, rgba(66, 245, 189, 0.4) 100%); */
  color: rgba(0, 0, 0, 0.6);
  font-family: "Roboto", sans-serif;
  font-size: 14px;
  line-height: 1.6em;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
 
}

.join_emaildiv{
   margin-bottom: 0px !important;
}

.join_email{
   color:white !important; 
   width:80% !important; 
   height:46px !important;"
}
.join_email:FOCUS{
   background: rgba(0, 0, 0, 0.1);
   outline:none;
   box-shadow: none;
}

.code_show{
   display: block;
}

.overlay, .form-panel.one:before {
  position: absolute;
  top: 0;
  left: 0;
  display: none;
  background: rgba(0, 0, 0, 0.8);
  width: 100%;
  height: 100%;
}

.form {
  z-index: 15;
  position: relative;
  background: #FFFFFF;
  width: 600px;
  border-radius: 4px;
  box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
  box-sizing: border-box;
  margin: 100px auto 10px;
  overflow: hidden;
}
.form-toggle {
  z-index: 10;
  position: absolute;
  top: 60px;
  right: 60px;
  background: #FFFFFF;
  width: 60px;
  height: 60px;
  border-radius: 100%;
  -webkit-transform-origin: center;
      -ms-transform-origin: center;
          transform-origin: center;
  -webkit-transform: translate(0, -25%) scale(0);
      -ms-transform: translate(0, -25%) scale(0);
          transform: translate(0, -25%) scale(0);
  opacity: 0;
  cursor: pointer;
  -webkit-transition: all 0.3s ease;
          transition: all 0.3s ease;
}
.form-toggle:before, .form-toggle:after {
  content: '';
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 30px;
  height: 4px;
  background: #4285F4;
  -webkit-transform: translate(-50%, -50%);
      -ms-transform: translate(-50%, -50%);
          transform: translate(-50%, -50%);
}
.form-toggle:before {
  -webkit-transform: translate(-50%, -50%) rotate(45deg);
      -ms-transform: translate(-50%, -50%) rotate(45deg);
          transform: translate(-50%, -50%) rotate(45deg);
}
.form-toggle:after {
  -webkit-transform: translate(-50%, -50%) rotate(-45deg);
      -ms-transform: translate(-50%, -50%) rotate(-45deg);
          transform: translate(-50%, -50%) rotate(-45deg);
}
.form-toggle.visible {
  -webkit-transform: translate(0, -25%) scale(1);
      -ms-transform: translate(0, -25%) scale(1);
          transform: translate(0, -25%) scale(1);
  opacity: 1;
}
.form-group {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  margin: 0 0 20px;
}
.form-group:last-child {
  margin: 0;
}
.form-group label {
  display: block;
  margin: 0 0 10px;
  color: rgba(0, 0, 0, 0.6);
  font-size: 12px;
  font-weight: 500;
  line-height: 1;
  text-transform: uppercase;
  letter-spacing: .2em;
}
.two .form-group label {
  color: #FFFFFF;
}
.form-group input {
  outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
  width: 100%;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 12px 20px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-group input:focus {
  color: rgba(0, 0, 0, 0.8);
}
.two .form-group input {
  color: #FFFFFF;
}
.two .form-group input:focus {
  color: #FFFFFF;
}
.form-group button {
  outline: none;
  background: #f78536;
  width: 100%;
  border: 0;
  border-radius: 4px;
  padding: 12px 20px;
  color: #FFFFFF;
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  text-transform: uppercase;
  cursor: pointer;
}
.two .form-group button {
  background: #FFFFFF;
  color: #4285F4;
}
.form-group .form-remember {
  font-size: 12px;
  font-weight: 400;
  letter-spacing: 0;
  text-transform: none;
}
.form-group .form-remember input[type='checkbox'] {
  display: inline-block;
  width: auto;
  margin: 0 10px 0 0;
}
.form-group .form-recovery {
  color: #4285F4;
  font-size: 12px;
  text-decoration: none;
}
.form-panel {
  padding: 60px calc(5% + 60px) 60px 60px;
  box-sizing: border-box;
}
.form-panel.one:before {
  content: '';
  display: block;
  opacity: 0;
  visibility: hidden;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-panel.one.hidden:before {
  display: block;
  opacity: 1;
  visibility: visible;
}
.form-panel.two {
  z-index: 5;
  position: absolute;
  top: 0;
  left: 95%;
  background: #f78536;
  width: 100%;
  min-height: 100%;
  padding: 60px calc(10% + 60px) 60px 60px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
   cursor: pointer; 
}
.form-panel.two:before, .form-panel.two:after {
  content: '';
  display: block;
  position: absolute;
  top: 60px;
  left: 1.5%;
  background: rgba(255, 255, 255, 0.2);
  height: 30px;
  width: 2px;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
}
.form-panel.two:after {
  left: 3%;
}
 .form-panel.two:hover { 
     left: 93%;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
 } 
.form-panel.two:hover:before, .form-panel.two:hover:after {
  opacity: 0;
}
.form-panel.two.active {
  left: 10%;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
  cursor: default;
}
.form-panel.two.active:before, .form-panel.two.active:after {
  opacity: 0;
}
.form-header {
  margin: 0 0 40px;
}
.form-header h1 {
  padding: 4px 0;
  color: #f78536;
  font-size: 24px;
  font-weight: 700;
  text-transform: uppercase;
}
.two .form-header h1 {
  position: relative;
  z-index: 40;
  color: #FFFFFF;
}

.pen-footer {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-box-pack: justify;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  width: 600px;
  margin: 20px auto 100px;
}
.pen-footer a {
  color: #FFFFFF;
  font-size: 12px;
  text-decoration: none;
  text-shadow: 1px 2px 0 rgba(0, 0, 0, 0.1);
}
.pen-footer a .material-icons {
  width: 12px;
  margin: 0 5px;
  vertical-align: middle;
  font-size: 12px;
}

.cp-fab {
  background: #FFFFFF !important;
  color: #4285F4 !important;
}

.hide_code{
   display: none;
}

.show_code{
   margin-top: 15px !important;
}
.btn_123{
   color: #4285F4 !important;
   background-color: white !important;
}
.btn_1{
   background-color: rgba(222, 119, 48, 1) !important;
   color: white !important;
}



</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$(document).ready(function() {
   var authNum="";
   var panelOne = $('.form').height(),
   panelTwo = $('.form-panel.two')[0].scrollHeight;
   pT = panelTwo;
  $('.form-panel.two').not('.form-panel.two.active').on('click', function(e) {
    e.preventDefault();

    $('.form-toggle').addClass('visible');
    $('.form-panel.one').addClass('hidden');
    $('.form-panel.two').addClass('active');
    $('.form').animate({'height': panelTwo}, 200);
  });

  $('.btn_send').on('click',function(){
    var user_email=$("#email").val();
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    if(user_email == ""){
       alert("이메일을 입력해 주세요");
    }else if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")){
              return false;
    }else{
      $('.show_code').removeClass('hide_code');
        panelTwo = $('.form-panel.two')[0].scrollHeight;
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
              }
           }
        });
   }
  });
  
  $('.exit').on('click',function(){
     $('.show_code').addClass('hide_code');
     panelTwo = pT;
  });
  
  $('.form-toggle').on('click', function(e) {
    e.preventDefault();
    $(this).removeClass('visible');
    $('.form-panel.one').removeClass('hidden');
    $('.form-panel.two').removeClass('active');
    $('.form').animate({'height': panelOne}, 200);
    
  });
  
  $('.fnSubmit').on('click',function(){
     var num=$("#code").val();
      
      if(num==""){
         alert("인증번호를 입력하세요");
         return false;
      }
      if( num != authNum){
         alert("틀린 인증번호 입니다. 인증번호를 확인하여 다시 입력해주세요");
         $("#code").val("");
         return false;
      }
      if(num==authNum){
         alert("인증 되었습니다.");
         
      }
         
     });
  $('.btn_123').on('click',function(){
       var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
       var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       // 이메일이 적합한지 검사할 정규식
       var id = document.getElementById("id");
       var pw = document.getElementById("pw");
       var email = document.getElementById("email");

       // ------------ 이메일 까지 -----------
      if(!check(re,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
         return false;
       }
       
       

       if(!check(re,pw,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
           return false;
       }

       if(join.pw.value != join.checkpw.value) {
           alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
           join.checkpw.value = "";
           join.checkpw.focus();
           return false;
       }

       if(email.value=="") {
           alert("이메일을 입력해 주세요");
           email.focus();
           return false;
       }

       if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
           return false;
       }

       if(join.name.value=="") {
           alert("이름을 입력해 주세요");
           join.name.focus();
           return false;
       }
       alert("회원가입이 완료되었습니다.");
       $("#join").submit();
       
   });
      function check(re, what, message) {
          if(re.test(what.value)) {
           return true;
       }
       alert(message);
       what.value = "";
       what.focus();
       //return false;
   }

});

 
 function openIdChk() {
   //아이디 입력란에 입력한 값 얻기
      var fid = document.fr.id.value;
      
      //회원가입 양식의 id입력란에 아이디를 입력하지 않았다면..
      //"아이디를 입력하세요"<--경고메세지창 띄우고..
      //id입력란에 포커스 주기
      //winopen()함수 나가기
      if( fid == "" ){
         alert("아이디를입력하세요");
         document.fr.id.focus();
         return;
      }
      //회원가입 양식의 id입력란에 아이디를 입력 했다면
      //아이디 중복체크를 위한 작은 창을 띄울때 id입력란에 입력한 id전달
   
    window.name = "parentForm";
    window.open("IdCheckForm.jsp",
          "chkForm", "width=500, height=300, resizable = no, scrollbars = no");
    
}
 
</script>

</head>
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
<br>
<br>
<br><br><br>
  <div class="form" style="width: 500px;">
  <div class="form-toggle exit" onclick=""></div>
  <div class="form-panel one">
    <div class="form-header">
    <a href="#"><img src="<%=contextpath%>/images/mainlogo.png" style="width: 300px;"></a>
      <h1>Account Login</h1>
    </div>
    <div class="form-content col">
      <form action="<%=contextpath %>/MemberLoginAction.me">
        <div class="form-group">
          <label for="username">ID</label>
          <input type="text" name="id" class="form-control" required="required"/>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" name="pw" class="form-control"  required="required"/>
        </div>
        <div class="form-group">
          <label class="form-remember">
            <input type="checkbox"/>Remember Me
          </label>
          <a href="<%=contextpath%>/member/findid.jsp" class="form-recovery">Forgot ID?</a>
          <a href="findpw.jsp" class="form-recovery">Forgot Password?</a>
        </div>
        <div class="form-group">
          <button type="submit">Log In</button>
        </div>
        </form>
    </div>
  </div>
  <div class="form-panel two">
    <div class="form-header">
      <h1>Register Account</h1>
    </div>
    <form action="<%=contextpath %>/MemberJoinAction.me"  id="join" name="form" method="post">
    <div class="form-content">
<%--       //<%=contextpath %>/MemberJoinAction.me --%>
        <div class="form-group join_emaildiv">
          <label for="email">e-mail</label>
          <div class="input-group mb-3 join_emaildiv">
           <input type="text" name="email" class="form-control join_email" id="email" required="required"/>
           <div class="input-group-append" align="center">
           <button type="button" class="btn btn_send">send</button>
           </div>
         </div>    
        </div>
        
         <div class="form-group show_code hide_code ">
          <label for="code">code</label>
          <div class="input-group mb-3 join_emaildiv">
          <input type="text" name="code" id="code" required="required" class="form-control join_email"/>
          <div class="input-group-append" align="center">
           <button type="button" class="btn fnSubmit">확인</button>
           </div>
           </div>
        </div>
        </div>
         <div class="form-group">
          <label for="id"><br>ID</label>
          <div class="input-group mb-3 join_emaildiv">
          <input type="text" name="id" id="id" required="required"/>
        </div>
        <div class="input-group-append" align="center">
          <span id="idErr"></span> <!-- ajax id -->
        </div>
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" name="pw" id="pw" required="required"/>
        </div>
        <div class="form-group">
          <label for="pw2">Confirm Password</label>
          <input type="password" name="checkpw" id="checkpw" required="required"/>
        </div>
        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" name="name" required="required"/>
        </div><br>
        <div class="form-group"> 
        <input type="button" class="btn btn-outline-secondary btn_123" value="Submit">
<!--           <button type="submit">확 인</button> -->
        </div>
        </form>
    </div>
  </div>
  <script type="text/javascript">
  //아이디 유효성
  $("#id").on("keyup", function(){
       var id = $(this).val();
       if(id ==''){
     $("#idErr").text("필수 입력 사항입니다.");
       }else{
       var reg = RegExp(/^[a-zA-Z0-9]{4,12}$/);
       if(!reg.test(id)){
              $("#idErr").text("올바른 아이디를 입력하세요.");
       }else{ 
               $.ajax({
                    type: 'post',
                    url: '<%=contextpath%>/idCheckService.ck',
                    data: {id: id},
                    success : function(data){
                        if(data == 1){
                                 $("#idErr").css('color','red').text("이미 사용중인 아이디 입니다.");
                            }else{
                                $("#idErr").css('color','green').text("사용 가능한 아이디 입니다");
                            }
                        },
                    error: function(){
                       alert('서버 내부 오류가 발생했습니다. \n다시 시도해주세요.');
                       $("#idErr").text("오류 사항을 확인해주세요.");
                    }
                });
             }
       }
  });  
  
  </script>

</body>
</html>