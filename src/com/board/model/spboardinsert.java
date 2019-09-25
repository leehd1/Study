package com.board.model;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packspboardDTO;

public class spboardinsert implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("spboardinsert실행");
		req.setCharacterEncoding("utf-8");
		HttpSession session=req.getSession();
		String id = (String)session.getAttribute("id");
		String sptitle = req.getParameter("sptitle");
		String sppackage = req.getParameter("package_total_no");
		int star = Integer.parseInt(req.getParameter("star"));
		String spcontent = req.getParameter("spcontent");
		String spsimple_content = req.getParameter("spsimple_content");
		String spcate = req.getParameter("cate");
		
		packnoboardDAO dao = new packnoboardDAO();
		
		packspboardDTO dto = new packspboardDTO();
		dto.setSpcate(spcate);
		dto.setSpid(id);
		dto.setSptitle(sptitle);
		dto.setStar(star);
		dto.setSpcontent(spcontent);
		dto.setSppackage(sppackage);
		dto.setSpsimple_content(spsimple_content);
		dto.setDate(new Timestamp(System.currentTimeMillis()));
		
		dao.spboardinsert(dto);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/boardList.bo");
		
		return forward;
	}
}
