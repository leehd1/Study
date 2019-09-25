package com.pack.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.model.Action;
import com.pack.model.ActionForward;
import com.pack.model.Reserv_con;
import com.pack.model.ReservationCheck;
import com.pack.model.ReserveProc;



public class PackageController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String RequestURI=req.getRequestURI();
		System.out.println(RequestURI);
		//   /FunWeb2    8
		String contextPath=req.getContextPath();
		System.out.println(contextPath);
		String d = req.getServletPath();
		System.out.println(d);
		System.out.println(contextPath.length());
		//  /BoardList.bo
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);

		ActionForward forward=null;
		Action action=null;
		if(command.equals("/reserve.do")){
			System.out.println("여행자 정보 작성페이지로 갈때 실행되는 함수");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./pak/reserve.jsp");
		} else if (command.equals("/reservation_check.do")) {
			action = new ReservationCheck();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println("예약 결제페이지로 갈때 실행되는 함수 : "+e.getMessage());
			}
		} else if(command.equals("/reserveproc.do")){
			action = new ReserveProc();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("예약할때 실행되는 함수 : "+e.getMessage());
			}
		} else if (command.equals("/reserv_con.do")) {
			action = new Reserv_con();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				System.out.println("예약 확인페이지로 갈때 실행되는 함수 : "+e.getMessage());
			}
		}
		
		
		
		
		
		//이동
		if(forward!=null){
			if(forward.isRedirect()){//true
				resp.sendRedirect(forward.getPath());
			}else{//false
				RequestDispatcher dispatcher=req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
	}
}
