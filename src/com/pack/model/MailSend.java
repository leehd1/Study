package com.pack.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/mailsend.ms")
public class MailSend extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doHandle(req, resp);
   }
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doHandle(req, resp);
   }

   protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      req.setCharacterEncoding("utf-8");
      resp.setContentType("text/html; charset=utf-8");
      
      String email=req.getParameter("user_email");
      System.out.println(email);
      String authNum="";
      
      authNum=RandomNum();
      
      sendEmail(email,authNum);
      
      JSONObject sObject = new JSONObject();//배열 내에 들어갈 json
      sObject.put("authNum", authNum);
      PrintWriter out=resp.getWriter();

      out.print(sObject.toString());
      
      out.close();
      
      
      
   }
   private void sendEmail(String email, String authNum) {
      String subject="willtour 인증번호 전달";
      String fromName="willtour 관리자";
      String to=email;
      
      String content="인증번호 ["+authNum+"]";
      
//      try {
//         Properties props= new Properties();
//         
//         props.put("mail.smtp.starttls.enable", "true");
//         props.put("mail.transport.protocol", "smtp");
//         props.put("mail.smtp.host", host);
//         props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//         props.put("mail.smtp.port", "465");
//         props.put("mail.smtp.user", from);
//         props.put("mail.smtp.auth", "true");
//         
//         Session mail=Session.getInstance(props,new Authenticator() {
//            protected PasswordAuthentication getPasswordAuthentication(){
//               return new PasswordAuthentication(from, "pass");
//            }
//         })
//         
//      } catch (Exception e) {
//         // TODO: handle exception
//      }
      Properties p = new Properties(); // 정보를 담을 객체
        
      p.put("mail.smtp.host","smtp.naver.com");
      p.put("mail.smtp.port", "587");
      p.put("mail.smtp.starttls.enable", "true");
      p.put("mail.smtp.auth", "true");
      p.put("mail.smtp.debug", "true");
      // p.put("mail.smtp.socketFactory.port", "465");
      // p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
      // p.put("mail.smtp.socketFactory.fallback", "false");
       
        
      try{
         Authenticator auth = new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication("bigpark666@naver.com", "bigpark6");
            }
         };
          Session ses = Session.getInstance(p, auth);
            
          ses.setDebug(true);
          
          MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체 
          msg.setFrom(new InternetAddress("bigpark666@naver.com", MimeUtility.encodeText(fromName,"UTF-8","B")));
          
          InternetAddress[] add={new InternetAddress(to)};
          msg.setRecipients(Message.RecipientType.TO, add);
          msg.setSubject(subject);
          msg.setSentDate(new Date());
          msg.setContent(content, "text/html;charset=euc-kr");
          
          Transport.send(msg);
      } catch(Exception e){
         System.out.println("메일 전송 오류 : "+e.getMessage());
          return;
      }
   }
   private String RandomNum() {
      StringBuffer buffer= new StringBuffer();
      for(int i=0; i<=6;i++){
         int n=(int)(Math.random()*10);
         buffer.append(n);
      }
      return buffer.toString();
   }
   
}