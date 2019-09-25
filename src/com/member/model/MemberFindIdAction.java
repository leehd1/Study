package com.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.DB.MemberDAO;


public class MemberFindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		  
		
		String email = request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		dao.findid(email);
		
		return null;
	}
}
