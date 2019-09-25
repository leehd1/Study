package com.pack.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pack.packageDB.ReservationDAO;

@WebServlet("/getNowTourist.nt")
public class getNowTourist extends HttpServlet{
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doHandle(req, resp);
	}
	
	protected void doHandle(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ReservationDAO dao = new ReservationDAO();
		int result = dao.getNowTourist(req.getParameter("package_no"));
		
		PrintWriter out = resp.getWriter();
		out.print(result);
		out.close();
		
	}
}
