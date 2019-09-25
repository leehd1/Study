package com.board.model;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.replyDTO;

public class boardReadreply implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			System.out.println("boardReadreply.java 실행");
			
			HttpSession session = req.getSession();
			req.setCharacterEncoding("utf-8");
			packnoboardDAO dao = new packnoboardDAO();
			
			replyDTO dto = new replyDTO();
			
			int resp1 = Integer.parseInt(req.getParameter("spno"));
			String id = (String)session.getAttribute("id");
			
			dto.setDate(new Timestamp(System.currentTimeMillis()));
			dto.setRecontent(req.getParameter("recontent"));
			dto.setResp(resp1);
			dto.setReid(id);
			
			dao.replyinsert(dto);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("boardRead.bo?spno="+resp1);
			
		return forward;
	}

}
