package com.administer.model;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.administer.DB.sellerAdminDAO;
import com.administer.DB.sellerAdminDTO;
import com.board.model.Action;
import com.board.model.ActionForward;

public class adminListAdd implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		String phonenum1 = req.getParameter("travel_agency_phone_number1");
		String phonenum2 = req.getParameter("travel_agency_phone_number2");
		String phonenum3 = req.getParameter("travel_agency_phone_number3");
		
		sellerAdminDTO dto = new sellerAdminDTO();
		dto.setSellername(req.getParameter("travel_agency_name"));
		dto.setSelleremail(req.getParameter("travel_agency_email"));
		dto.setSellerfaxnum(req.getParameter("travel_agency_fax_number"));
		dto.setSellerphonenum(phonenum1+"-"+phonenum2+"-"+phonenum3);
		dto.setSellertravel_agency_consulting_time(req.getParameter("travel_agency_consulting_time"));
		dto.setSellerid(id);
		
		new sellerAdminDAO().ListSave(dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./main/index.jsp");
		return forward;
	}

}
