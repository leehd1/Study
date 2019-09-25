package com.member.model;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.member.DB.MemberDAO;


public class MemberInfoAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		
		MemberDAO dao = new MemberDAO();
		//dao.memberinfo(id);
		
		return null;
	}
	
}
