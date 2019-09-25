package com.sellboard.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.Action;
import com.board.model.ActionForward;
import com.member.DB.MemberBean;
import com.member.DB.MemberDAO;

public class SellerReq implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		String id = req.getParameter("id");
		
		MemberBean bean = new MemberDAO().getMember(id);
		
		req.setAttribute("bean", bean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./seller/SellerReq.jsp");
		
		return forward;
	}
}
