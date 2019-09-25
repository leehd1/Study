package com.sellboard.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.Action;
import com.board.model.ActionForward;
import com.member.DB.MemberDAO;

public class packageregist implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		int travel_agency_no = new MemberDAO().getAgency_No(id);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./seller/sellboard.jsp?travel_agency_no="+travel_agency_no);
		
		return forward;
	}
}
