package com.board.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packspboardDTO;

public class spboardRead implements Action {
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("spBoardReadAction 실행");
		int nono = Integer.parseInt(req.getParameter("spno"));
		
		packnoboardDAO dao = new packnoboardDAO();
		
		packspboardDTO dto = dao.getspboard(nono);
		
		List list = dao.getPackageTitle(dto.getSpid());
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./review/boardRead.jsp");
		return forward;
	}
}
