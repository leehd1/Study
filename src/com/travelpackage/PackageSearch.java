package com.travelpackage;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionMove;
import com.db.mysql.PackageDAO;
import com.db.mysql.PackageVO;

public class PackageSearch implements Action {

    @Override
    public ActionMove execution(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        request.setCharacterEncoding("UTF-8");
        
        ActionMove action = new ActionMove();
        PackageDAO dao = new PackageDAO();
        BoardPagingVO pagingVO = new BoardPagingVO();
        
        String searchValue = request.getParameter("searchValue");
        String firstCategory = request.getParameter("firstCategory");
        String secondCategory = "";
        String userCategory = "";
        
        if (firstCategory.equals("period")) {
            secondCategory = request.getParameter("secondCategoryPeriod");
            userCategory = "secondCategoryPeriod";
        } else if (firstCategory.equals("ect")) {
            secondCategory = request.getParameter("secondCategoryEct");
            userCategory = "secondCategoryEct";
        }
        
        // 페이징에 필요한 변수 설정
        int totalRecord = dao.getPackageSearchListCount(firstCategory, secondCategory, searchValue); // 전체 레코드의 수
        int recordPerPage = 6; // 페이지당 레코드의 수
        int pagePerBlock = 3; // 블록당 페이지의 수
        int nowPage = 1; // 현재 페이지 변수를 1로 초기화
        
        // 현재 상태에 따른 페이지 처리
        if (totalRecord == 0) { // 현재 레코드의 수가 없다면
            nowPage = 0;
        } else if (request.getParameter("page") != null) { // 전달받은 페이지의 값이 있다면
            nowPage = Integer.parseInt(request.getParameter("page"));
        }
        
        // 페이지를 얻기 위해서 페이지 VO 객체에 값을 저장
        pagingVO.setTotalRecord(totalRecord);
        pagingVO.setRecordPerPage(recordPerPage);
        pagingVO.setPagePerBlock(pagePerBlock);
        pagingVO.setNowPage(nowPage);

        // 페이징 모듈을 이용하여 페이징 정보 추출
        pagingVO = new BoardPaging(pagingVO).getPagingInfo();
        
        // 패키지 리스트들을 ArrayList 배열로 얻기
        ArrayList<PackageVO> PackageList = dao.getPackageSearch(pagingVO, firstCategory, secondCategory, searchValue);
        
        // 패키지 리스트 배열을 request 영역에 저장
        request.setAttribute("packageList", PackageList);
        
        // 페이징에 필요한 값들이 담긴 객체를 request 영역에 저장
        request.setAttribute("pagingVO", pagingVO);
        
        if (userCategory.equals("secondCategoryPeriod")) {
            request.setAttribute(userCategory, secondCategory);
        } else if (userCategory.equals("secondCategoryEct")) {
            request.setAttribute(userCategory, secondCategory);
        }
        
        request.setAttribute("firstCategory", firstCategory);
        request.setAttribute("searchValue", searchValue);
        
        action.setRedirect(false);
        action.setPath("pak/package.jsp");
        
        return action;
    }

}
