package com.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.questionDTO;
import com.member.DB.MemberDAO;

public class MooniRead implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			int qno = Integer.parseInt(request.getParameter("qno"));
			
			
			MemberDAO dao = new MemberDAO();
			questionDTO dto = dao.MooniRead(qno);
			
			request.setAttribute("dto", dto);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./me/MooniRead.jsp");
			
			
		return forward;
	}
}
