package com.pack.model;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pack.packageDB.ReservationDAO;
import com.pack.packageDB.ReservationDTO;
import com.pack.packageDB.TouristDTO;

public class ReserveProc implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		HttpSession session = req.getSession(true);
		ReservationDAO rdao = new ReservationDAO();
		ReservationDTO rdto = (ReservationDTO)session.getAttribute("rdto");
		TouristDTO tdto;
		
		List list = (List)session.getAttribute("list");
		
		SimpleDateFormat s = new SimpleDateFormat ("yyyyMMdd");
		long reserve_no1 = Long.parseLong((s.format(System.currentTimeMillis())+"001"));
		long reserve_no_ = Long.parseLong(rdao.searchReserve_no());
		if( reserve_no1 <= reserve_no_ ){
			reserve_no1 = reserve_no_+1;
		}
		String reserve_no = Long.toString(reserve_no1);
		//여행자 정보 DB에 insert
		for (int i = 0; i < list.size() ; i++) {
			tdto = (TouristDTO)list.get(i);
			
			tdto.setReserve_no(reserve_no);;
			
			rdao.insertTourist(tdto);		
		}
		
		//예약자 정보 insert
		
		rdto.setReserve_no(reserve_no);
		rdto.setId((String)session.getAttribute("id"));
		rdto.setReserve_state("예약 완료");
		rdao.insertReservation(rdto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./me/mypage.jsp");
		return forward;
	}
	
}
