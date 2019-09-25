package com.sellboard.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.model.adminListAdd;
import com.board.model.Action;
import com.board.model.ActionForward;
import com.sellboard.model.SellerReq;
import com.sellboard.model.packageregist;
import com.sellboard.model.sellboardinsert;

public class sellBoardController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");

		String RequestURI=req.getRequestURI();
		System.out.println(RequestURI);
		//   /FunWeb2    8
		String contextPath=req.getContextPath();
		System.out.println(contextPath);
		System.out.println(contextPath.length());
		//  /BoardList.bo
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);

		ActionForward forward=null;
		Action action=null;
		
		if(command.equals("/sellboardinsert.se")){
			action = new sellboardinsert();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/packageregist.se")){
			action = new packageregist();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
//			forward = new ActionForward();
//			forward.setRedirect(false);
//			forward.setPath("./seller/sellboard.jsp");
		}else if(command.equals("/SellerReq.se")){
			action = new SellerReq();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/SellerReqAction.se")){
			action = new adminListAdd();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
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
