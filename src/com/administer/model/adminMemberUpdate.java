package com.administer.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.DB.sellerAdminDAO;
import com.board.model.Action;
import com.board.model.ActionForward;
import com.member.DB.MemberBean;

public class adminMemberUpdate implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("utf-8");
		
		
		MemberBean bean = new MemberBean();
		bean.setName(req.getParameter("name"));
		bean.setEmail(req.getParameter("email"));
		bean.setLevel(Integer.parseInt(req.getParameter("level")));
		bean.setTravel_agency_no(Integer.parseInt(req.getParameter("travel_agency_no")));
		bean.setNum(Integer.parseInt(req.getParameter("num")));
		
		new sellerAdminDAO().changeMemberInfo(bean);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("adminMemberList.ad");
		
		return forward;
	}
}
