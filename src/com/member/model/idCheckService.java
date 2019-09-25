package com.member.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.DB.MemberDAO;


@WebServlet("/idCheckService.ck")
public class idCheckService extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
	      resp.setContentType("text/html; charset=UTF-8");
	      
	      String id = req.getParameter("id");
	      
	      MemberDAO dao = new MemberDAO();
	      int result = dao.idCheck(id);
	      
	      resp.getWriter().print(result);
	      System.out.println("중복 검사할 id :" + id);
	      System.out.println("중복 검사 result :" + result);
	}
	
}
