package com.board.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.Action;
import com.board.model.ActionForward;
import com.board.model.boardDelete;
import com.board.model.boardPost;
import com.board.model.boardReadreply;
import com.board.model.noBoardListAction;
import com.board.model.noBoardReadAction;
import com.board.model.noBoardSearchAction;
import com.board.model.qandaAction;
import com.board.model.replydelete;
import com.board.model.spboardList;
import com.board.model.spboardRead;
import com.board.model.spboardUpdate;
import com.board.model.spboardinsert;
import com.board.model.spboardsearch;
import com.board.model.supportAction;



public class BoardController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
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
		if(command.equals("/notice.bo")){
			action=new noBoardListAction();
			try {
				forward=action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/noticeread.bo")){
			action = new noBoardReadAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/noticesearch.bo")){
			action = new noBoardSearchAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/Q&A.bo")){
			forward=new ActionForward();
			forward.setRedirect(false);
			String id = (String)session.getAttribute("id");
			if(id==null){
				forward.setPath("member/login3.jsp");
			}else{
				forward.setPath("./help/Q&A.jsp");
			}
		}else if(command.equals("/qandaAction.bo")){
				action = new qandaAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/boardList.bo")){
				action = new spboardList();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/spboardcreate.bo")){
			forward = new ActionForward();
			forward.setRedirect(false);
			String id = (String)session.getAttribute("id");
			if(id==null){
				forward.setPath("member/login3.jsp");
			}else{
				forward.setPath("./review/boardEdit.jsp?id="+id);
			}
		}else if(command.equals("/spboardinsert.bo")){
				action = new spboardinsert();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/boardRead.bo")){
				action = new spboardRead();
			try{
			forward = action.execute(req, resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardPost.bo")){
				action = new boardPost();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/spboardUpdate.bo")){
				action = new spboardUpdate();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/boardDelete.bo")){
				action = new boardDelete();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardReadreply.bo")){
				action = new boardReadreply();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/replydelete.bo")){
				action = new replydelete();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/spboardsearch.bo")){
				action = new spboardsearch();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/event.bo")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./event/event.jsp");
		}else if(command.equals("/support.bo")){
			action = new supportAction();
			try {
				forward = action.execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/jaupak.bo")){
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./jaupak/jaupak.jsp");
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
