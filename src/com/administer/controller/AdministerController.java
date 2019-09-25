package com.administer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.model.adminList;
import com.administer.model.adminMemberList;
import com.administer.model.adminMemberUpdate;
import com.administer.model.concent;
import com.administer.model.reject;
import com.board.model.Action;
import com.board.model.ActionForward;
import com.board.model.noBoardListAction;

public class AdministerController extends HttpServlet{

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
		if(command.equals("/adminList.ad")){
			action=new adminList();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/concent.ad")){
			action = new concent();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/reject.ad")){
			action = new reject();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/adminMemberList.ad")){
			action = new adminMemberList();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/adminMemberUpdate.ad")){
			action = new adminMemberUpdate();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
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
