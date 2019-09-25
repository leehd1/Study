package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packnoboardDTO;

public class noBoardReadAction implements Action{
	
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("noBoardReadAction 실행");
		int nono = Integer.parseInt(req.getParameter("nono"));
		
		packnoboardDAO bdao = new packnoboardDAO();
		
		packnoboardDTO bdto = bdao.getBoard(nono);
		
		req.setAttribute("bdto", bdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./help/noticeread.jsp");
		return forward;
	}

}
