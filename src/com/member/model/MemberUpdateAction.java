package com.member.model;


import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.DB.MemberBean;
import com.member.DB.MemberDAO;


public class MemberUpdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		MemberBean mb = new MemberBean();
		MemberDAO mdao = new MemberDAO();
			
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		mb = mdao.getMember(id);
		
		request.setAttribute("mb", mb);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/memberinfo.jsp");
		
		return forward;
	}
}