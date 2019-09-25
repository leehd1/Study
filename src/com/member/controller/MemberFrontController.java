package com.member.controller;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.Action;
import com.member.model.ActionForward;
import com.member.model.MemberDeleteAction;
import com.member.model.MemberFindIdAction;
import com.member.model.MemberIdCheckAction;
import com.member.model.MemberInfoAction;
import com.member.model.MemberJoinAction;
import com.member.model.MemberLoginAction;
import com.member.model.MemberLogoutAction;
import com.member.model.MemberModifyAction;
import com.member.model.MemberMooni;
import com.member.model.MemberUpdateAction;
import com.member.model.MooniRead;


public class MemberFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}

	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		//가상요청 주소 가져오기
		//  /CarProject/MemberJoin.me
		//  /CarProject/MemberJoinAction.me
		//   /CarProject/MemberLogin.me 
		String RequestURI=request.getRequestURI();
		System.out.println(RequestURI);
		
		//  /CarProject 얻기
		//  /CarProject 얻기
		//  /CarProject 얻기
		String contextPath=request.getContextPath();
		
		//	길이 11
		//	길이 11
		//	길이 11
		System.out.println(contextPath.length());
		
		//  /MemberJoin.me 얻기
		// /MemberJoinAction.me
		//  /MemberLogin.me 얻기 
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
					
		/*주소 비교*/	
		//페이지 이동 방식 여부 값,이동페이지 경로 값 저장 하여 리턴 해주는 객체를 저장할 참조변수 선언 
		ActionForward forward=null;
	
		//자식 Action 객체들을 담을 인터페이스 타입의 참조변수 선언
		Action action=null;
			
		//Top.jsp에서.. join링크를 누르면 회원가입페이지로 이동하는 요청이 들어 왔을때..
		if(command.equals("/MemberJoinAction.me")){
			System.out.println("memberJoin.me 실행");
			action = new MemberJoinAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberLoginAction.me")){ 
			System.out.println("memberactionlogin.me 실행");
			action = new MemberLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
		}else if(command.equals("/MemberLogout.me")){
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}else if(command.equals("/MemberDeleteAction.me")){
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}else if(command.equals("/MemberInfoAction.me")){
			action = new MemberInfoAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberUpdateAction.me")){
			action = new MemberUpdateAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/MemberModifyAction.me")){
			action = new MemberModifyAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MypageAction.me")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("me/mypage.jsp");
		}else if(command.equals("/addMember.me")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("member/login3.jsp");
		}else if(command.equals("/MemberMooni.me")){
			action = new MemberMooni();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MooniRead.me")){
			action = new MooniRead();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/MemberFindIdAction.me")){
	         action = new MemberFindIdAction();
	         
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	         
	      }else if(command.equals("/MemberIdCheckAction.me")){
	         action = new MemberIdCheckAction();
	         
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }


		
		if(forward!=null){ //new ActionForward()객체가 존재 하고..
			if(forward.isRedirect()){//true -> sendRedirect() 방식일떄..
				//리다이렉트 방식으로 페이지 이동!  페이지 주소 경로 노출 함 
				//join.jsp화면 이동
				//login.jsp화면 이동
				//CarMain.jsp화면 이동시 session영역 전달
				response.sendRedirect(forward.getPath());
				
			}else {//false -> forward() 방식일때...
				
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}//if 
		
	}//	doProcess 메소드 끝
	
}//서블릿 끝




