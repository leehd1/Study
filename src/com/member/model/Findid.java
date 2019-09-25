package com.member.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.DB.MemberDAO;


@WebServlet("/findid.fi")
public class Findid extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		System.out.println("d");
		String email = req.getParameter("email");
		MemberDAO dao = new MemberDAO();
		String id = dao.findid(email);
		System.out.println(id);
		PrintWriter out = resp.getWriter();
		out.print(id);
		out.close();
		
		
		
		
		
		
	}
	
	
	
	
}
