package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packspboardDTO;

public class boardPost implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		int spno = Integer.parseInt(req.getParameter("spno"));
		
		packspboardDTO dto = new packnoboardDAO().spboardgetData(spno);
		
		req.setAttribute("dto", dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./review/boardPost.jsp");
		
		return forward;
	}

}
