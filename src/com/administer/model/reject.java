package com.administer.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.DB.sellerAdminDAO;
import com.board.model.Action;
import com.board.model.ActionForward;

public class reject implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		int sellerInsert_no = Integer.parseInt(req.getParameter("sellerInsert_no"));
		System.out.println("거절 java페이지 :"+sellerInsert_no);
		new sellerAdminDAO().SellerAdminListDelete(sellerInsert_no);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("adminList.ad");
		return forward;
	}
}
