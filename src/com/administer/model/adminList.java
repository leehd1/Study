package com.administer.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.administer.DB.sellerAdminDAO;
import com.administer.DB.sellerAdminDTO;
import com.board.model.Action;
import com.board.model.ActionForward;

public class adminList implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		List<sellerAdminDTO> list = new sellerAdminDAO().getSellerList();
		
		req.setAttribute("list", list);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("administer/adminList.jsp");
		
		return forward;
	}
}
