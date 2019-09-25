package com.board.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packnoboardDTO;

public class noBoardSearchAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("noBoardSearchAction java 실행");
		String search1 = req.getParameter("search1");
		String search2 = req.getParameter("search2");
		String search3 = req.getParameter("search3");
		
		packnoboardDAO bdao = new packnoboardDAO();
		int count=bdao.getBoardCount(search1,search2,search3);
		
		int pageSize=5;
		// 페이지 가져오기
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		
		int endRow=currentPage*pageSize;
		List<packnoboardDTO> list = null;
		if(count!=0){
			list = (List<packnoboardDTO>) bdao.getBoardList(search1,search2,search3,startRow, pageSize);
		}
		
		int pageCount =count/pageSize+(count%pageSize==0?0:1);

		int pageBlock=3;

		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;

		int endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		req.setAttribute("boardList", list);
		req.setAttribute("count", count); 
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("search1", search1);
		req.setAttribute("search2", search2);
		req.setAttribute("search3", search3);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./help/noticeSearchView.jsp");
	
		return forward;
	}

}
