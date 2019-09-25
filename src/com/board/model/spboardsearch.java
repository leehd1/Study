package com.board.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packspboardDTO;

public class spboardsearch implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("spboardsearch.java 실행");
		req.setCharacterEncoding("utf-8");
		
		String spboardsearch1 = req.getParameter("spboardsearch1");
		String spboardsearch2 = req.getParameter("spboardsearch2");
		packnoboardDAO dao = new packnoboardDAO();
		List<packspboardDTO> list = null;
		
		int count = dao.spboardserchCount(spboardsearch1, spboardsearch2);
		int pageSize=5;
		// 페이지 가져오기
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		
		int endRow=currentPage*pageSize;
		
		
		System.out.println("count : "+count);
		if(count!=0){
			list = dao.spboardsearch(spboardsearch1, spboardsearch2,startRow, pageSize);
		}
		
		int pageCount =count/pageSize+(count%pageSize==0?0:1);

		int pageBlock=3;

		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;

		int endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		req.setAttribute("list", list);
		req.setAttribute("count", count); 
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("spboardsearch1", spboardsearch1);
		req.setAttribute("spboardsearch2", spboardsearch2);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./review/boardListSearch.jsp");
		
		return forward;
	}
}
