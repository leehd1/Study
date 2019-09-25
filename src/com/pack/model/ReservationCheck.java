package com.pack.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.mysql.PackageVO;
import com.pack.packageDB.ReservationDAO;
import com.pack.packageDB.ReservationDTO;
import com.pack.packageDB.TouristDTO;

public class ReservationCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		int adult = Integer.parseInt(req.getParameter("adult"));
		int kid = Integer.parseInt(req.getParameter("kid"));
		int baby = Integer.parseInt(req.getParameter("baby"));
		int touristNum = adult+kid+baby;
		
		HttpSession session = req.getSession(true);
		PackageVO pvo = (PackageVO)session.getAttribute("packageInfo");
		
		List<TouristDTO> list = new ArrayList();
		
		for (int i = 1; i < touristNum+1; i++) {
			TouristDTO tdto = new TouristDTO();
			tdto.setPackage_no(pvo.getPackage_no());
			tdto.setTour_person_level(req.getParameter("tour_person_level"+i));
			tdto.setTour_ko_name(req.getParameter("tour_ko_name"+i));
			tdto.setTour_last_name(req.getParameter("tour_last_name"+i));
			tdto.setTour_first_name(req.getParameter("tour_first_name"+i));
			tdto.setTour_birthday(req.getParameter("tour_birthday"+i));
			tdto.setTour_gender(req.getParameter("tour_gender"+i));
			tdto.setTour_nation(req.getParameter("tour_nation"+i));
			tdto.setTour_passport_num(req.getParameter("tour_passport_num"+i));
			tdto.setTour_passport_end(req.getParameter("tour_passport_end"+i));
			
			list.add(tdto);
		}
		
		
		int total_price = pvo.getPackage_price_adult()*adult+pvo.getPackage_price_child()*kid+pvo.getPackage_price_baby()*baby;
		String phone = req.getParameter("reader_phone1")+req.getParameter("reader_phone2")+req.getParameter("reader_phone3");
		String number = req.getParameter("reader_number1")+req.getParameter("reader_number2")+req.getParameter("reader_number3");
		
		ReservationDTO rdto = new ReservationDTO();
		rdto.setEmail(req.getParameter("email"));
		rdto.setReader_name(req.getParameter("reader_name"));
		rdto.setPackage_no(pvo.getPackage_no());
		rdto.setAirplane_no(pvo.getAirplane_no());
		rdto.setReader_phone(phone);
		rdto.setReader_number(number);
		rdto.setGuide_no(pvo.getGuide_no());
		rdto.setTotal_price(total_price);
		rdto.setEct(req.getParameter("ect"));
		
        session.setAttribute("list", list);
        session.setAttribute("rdto", rdto);
        
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./pak/reservation_check.jsp");
		return forward;
	}
	
}
