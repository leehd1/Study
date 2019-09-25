package com.board.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packspboardDTO;

public class spboardUpdate implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		
		int spno = Integer.parseInt(req.getParameter("spno"));
		packspboardDTO dto = new packspboardDTO();
		
		dto.setSpcontent(req.getParameter("spcontent"));
		dto.setSpsimple_content(req.getParameter("spsimple_content"));
		dto.setSptitle(req.getParameter("sptitle"));
		dto.setStar(Integer.parseInt(req.getParameter("star")));
		
		new packnoboardDAO().packspboardUpdate(dto,spno);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("boardList.bo");
		
		return forward;
	}

}
