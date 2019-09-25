package com.administer.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.DB.sellerAdminDAO;
import com.administer.DB.sellerAdminDTO;
import com.board.model.Action;
import com.board.model.ActionForward;

public class concent implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String sellerid = req.getParameter("sellerid");
		int sellerInsert_no = Integer.parseInt(req.getParameter("sellerInsert_no"));
		
		sellerAdminDAO dao = new sellerAdminDAO();
		dao.sellerToUpdate(sellerInsert_no,sellerid); //맴버 레벨 업 및 여행사 관리번호 부여
		
		sellerAdminDTO dto = dao.getAgencyINFO(sellerInsert_no);
		
		dao.agencyINTO(dto);
		
		dao.SellerAdminListDelete(sellerInsert_no);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("adminList.ad");
		return forward;
	}
}
