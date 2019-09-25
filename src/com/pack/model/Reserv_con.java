package com.pack.model;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack.packageDB.ReservationDAO;

public class Reserv_con implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		HttpSession session = req.getSession(true);
		String id = (String)session.getAttribute("id");
		
		ReservationDAO rdao = new ReservationDAO();
		List list = new ArrayList();
		list = rdao.getReservation(id);
		
		req.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./me/reserv_con.jsp");
		return forward;
	}
}
