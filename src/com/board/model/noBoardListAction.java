package com.board.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.packboardDB.packnoboardDAO;
import com.board.packboardDB.packnoboardDTO;

public class noBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("noBoardListAction execute()");
		//  게시판 전체 글의 개수 
			// 디비 객체 생성 BoardDAO  bdao
		packnoboardDAO bdao=new packnoboardDAO();
		// int count =  메서드호출  getBoardCount()   count(*)
		String a = "a";
		int count=bdao.getBoardCount(a);
		// 게시판 가져오기  2페이지 10개 => 시작행 끝행
		// 한페이지에 15개 글을 가져오도록 설정
		int pageSize=5;
		// 페이지 가져오기
		String pageNum=req.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		// 시작행번호 구하기  10  1페이지  1번행   2페이지  11번행   3  21번행
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		// 끝행번호
		int endRow=currentPage*pageSize;
		List<packnoboardDTO> boardList=null;
	//  시작행번호  몇개(10) 가져오기
		// boardList=메서드호출  getBoardList(시작행startRow,몇개pageSize)
		if(count!=0){
			boardList=bdao.getnoBoardList(startRow, pageSize);
		}
		//전체 페이지 수 구하기  50개 글  10개씩 보여주기 => 5+0
				//                 55개 글 10개씩 보여주기 => 5+1
		int pageCount =count/pageSize+(count%pageSize==0?0:1);
		//한화면에 보여줄 페이지수 설정
		int pageBlock=3;
		// 한화면에 보여줄 시작페이지 구하기  1~10  => 1  /  11~20 => 11
		int startPage=((currentPage-1)/pageBlock)*pageBlock+1;
		// 한화면에 보여줄 끝페이지 구하기
		int endPage=startPage+pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		// request  count boardList pageNum 
				// pageCount pageBlock startPage endPage저장
		req.setAttribute("count", count); //모든속성저장 Integer -> Object형저장
		req.setAttribute("boardList", boardList); // List -> Object 저장
		req.setAttribute("pageNum", pageNum); //String -> Object 저장
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("pageBlock", pageBlock);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		// 이동   ./center/notice.jsp
		ActionForward forward=new ActionForward();
		forward.setRedirect(false);
		System.out.println("false이전");
		forward.setPath("./help/notice.jsp");
		return forward;
		
	}

}
