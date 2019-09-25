package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;

public class boardDelete implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		int spno = Integer.parseInt(req.getParameter("spno"));
		
		new packnoboardDAO().spboardDelete(spno);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("boardList.bo");
		
		return forward;
	}

}
