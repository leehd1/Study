package com.member.model;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.member.DB.MemberBean;
import com.member.DB.MemberDAO;


public class MemberModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		MemberBean mb = new MemberBean();
		MemberDAO dao = new MemberDAO();
		
		mb.setId(id);
		mb.setEmail(email);
		mb.setPw(pw);
		mb.setName(name);
		
		dao.modifyMember(mb);
		
		ActionForward forward = new ActionForward();	
		
		forward.setRedirect(false);
		forward.setPath("./member/login3.jsp");
		
		return forward;
		
	}
}
