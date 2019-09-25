package com.member.model;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.DB.MemberDAO;




public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("memberdelete.java 실행");
		String id = request.getParameter("id");
		System.out.println(id);
		MemberDAO dao = new MemberDAO();
		dao.deleteMember(id);
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		ActionForward forward=new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("./main/index.jsp"); 
		 
		return forward;
	}
}
