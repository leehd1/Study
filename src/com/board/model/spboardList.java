package com.board.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packspboardDTO;

public class spboardList implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("spboardList execute()");

		packnoboardDAO dao = new packnoboardDAO();
		
		String b = "b";
		System.out.println("count매소드 시작 전");
		int count=dao.getBoardCount(b);

		int pageSize=5;

		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}

		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;

		int endRow=currentPage*pageSize;
		List<packspboardDTO> boardList=null;

		if(count!=0){
			boardList=dao.getspBoardList(startRow, pageSize);
		}

		int pageCount =count/pageSize+(count%pageSize==0?0:1);

		int pageBlock=3;

		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;

		int endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}

		req.setAttribute("count", count); //모든속성저장 Integer -> Object형저장
		req.setAttribute("boardList", boardList); // List -> Object 저장
		req.setAttribute("pageNum", pageNum); //String -> Object 저장
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);

		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./review/boardList.jsp"); 
		return forward;
	}

}
