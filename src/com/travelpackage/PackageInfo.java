package com.travelpackage;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.action.Action;
import com.action.ActionMove;
import com.db.mysql.PackageDAO;
import com.db.mysql.PackageVO;

public class PackageInfo implements Action{

    @Override
    public ActionMove execution(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        request.setCharacterEncoding("UTF-8");
        
        @SuppressWarnings("rawtypes")
        HashMap map = new HashMap();
        PackageDAO dao = new PackageDAO();
        BoardPagingVO pagingVO = new BoardPagingVO();
        ActionMove action = new ActionMove();
        
        String packageNo = request.getParameter("packageNo");
        int package_total_no = dao.getTotalNO(packageNo);
        
        // 페이징에 필요한 변수 설정
        int totalRecord = dao.getSpBoardListCount(package_total_no); // 전체 레코드의 수
        int recordPerPage = 3; // 페이지당 레코드의 수
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
        
        map = dao.getPackageInfo(packageNo);
        
        request.getSession().setAttribute("packageInfo", map.get("packageVO"));
        request.getSession().setAttribute("agencyInfo", map.get("agencyVO"));
        request.getSession().setAttribute("guideInfo", map.get("guideVO"));
        
        List list = dao.getairplanelist(packageNo);
        
        request.getSession().setAttribute("list", list);
        
//        request.setAttribute("packageInfo", map.get("packageVO"));
//        request.setAttribute("agencyInfo", map.get("agencyVO"));
//        request.setAttribute("guideInfo", map.get("guideVO"));

        list = dao.getSpBoardList(pagingVO, package_total_no);
        
        request.setAttribute("spList", list);
        
        int package_Total_No = ((PackageVO) map.get("packageVO")).getPackage_total_no();
        
        if (request.getParameter("packDate") != null) {
            
            String packDate = request.getParameter("packDate");
            list = dao.getSamePackageInfo(package_Total_No, packDate);
            request.setAttribute("airList", list);
            
        } else {

            list = dao.getSamePackageInfo(package_Total_No);
            request.setAttribute("airList", list);
        }
        
        list = dao.getSamePackageInfo(package_Total_No);
        request.setAttribute("totalAirList", list);
        
        // 페이징에 필요한 값들이 담긴 객체를 request 영역에 저장
        request.setAttribute("pagingVO", pagingVO);
        
        action.setRedirect(false);
        action.setPath("pak/package_view.jsp");
        
        return action;
    }

}
