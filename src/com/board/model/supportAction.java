package com.board.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.ofquestDAO;
import com.board.packboardDB.ofquestDTO;

public class supportAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		ofquestDAO dao = new ofquestDAO();
		
		req.setCharacterEncoding("utf-8");
		String search1 = req.getParameter("ofcate2");
		String search2 = req.getParameter("ofcate1");
		
		List<ofquestDTO> list = dao.ofquest(search1,search2);
		
		req.setAttribute("list", list);
		System.out.println(list.size());
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./help/support.jsp");
		return forward;
	}
}
