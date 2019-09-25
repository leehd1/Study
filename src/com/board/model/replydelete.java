package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;

public class replydelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		packnoboardDAO dao = new packnoboardDAO();
		
		int reno = Integer.parseInt(req.getParameter("reno"));
		int spno = Integer.parseInt(req.getParameter("spno"));
		dao.replydelete(reno);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("boardRead.bo?spno="+spno);
		return forward;
	}
}
