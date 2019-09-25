package com.administer.model;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.DB.sellerAdminDAO;
import com.board.model.Action;
import com.board.model.ActionForward;
import com.member.DB.MemberBean;

public class adminMemberList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		List<MemberBean> list = new sellerAdminDAO().getAllMember();
		
		req.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./administer/adminMemberList.jsp");
		return forward;
	}
}
