package com.sellboard.model;

import java.lang.reflect.Method;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.board.model.Action;
import com.board.model.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sellboard.DB.packagelistDAO;
import com.sellboard.DB.packagelistDTO;

public class sellboardinsert implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		System.out.println("sellboardinsert.java  실행");
		
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		
		//String dir = "D:\\workspace_jsp\\teamproj\\webContent\\upload";
		String dir = req.getSession().getServletContext().getRealPath("/img/");
		int maxSize = 1024*1024*100;
		String encoding = "UTF-8";
		MultipartRequest multi = 
				new MultipartRequest(req,dir,maxSize,encoding,
						new DefaultFileRenamePolicy());
		String sellcate ="";
		sellcate = multi.getParameter("sellcate");
		switch (sellcate) {
		case "중국":
			sellcate = "10";
			break;
		case "동남아":
			sellcate = "30";
			break;
		case "일본":
			sellcate = "50";
			break;
		case "미국":
			sellcate = "70";
			break;
		default:
			break;
		}
		
		
		
		/* addDate()매소드를 사용하기 위한 선언 */
		String start_day =multi.getParameter("availability_start_date");
		String end_day = multi.getParameter("availability_end_date");
		
		/* Travel_period을 설정하기 위한 선언 */
		Date start = null;
		Date end = null;
		try {
			 start = s.parse(start_day);
			 end = s.parse(end_day);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("start String 날짜 : "+start_day);
		System.out.println("end String 날짜 : "+end_day);
		int period = (int) (end.getTime() - start.getTime());
		System.out.println("sellboardinsert java period값1 :"+end.getTime());
		System.out.println("sellboardinsert java period값2 :"+start.getTime());
		int travel_period = period / (24 * 60 * 60 * 1000); // Travel_period 획득
		System.out.println("sellboardinsert java period값 : "+travel_period);
		packagelistDAO dao = new packagelistDAO();
		
		/* Travel_period을 설정하기 위한 선언 */
		int start_date = Integer.parseInt(multi.getParameter("availability_start_date").replaceAll("-", "").replaceAll("20", "")); //190803
		//int end_date = Integer.parseInt(multi.getParameter("availability_end_date").replaceAll("-", "").replaceAll("20", "")); //190805
		
		int term = Integer.parseInt(multi.getParameter("packageterm"));
		/* 한 패키지에 존재하는 모든 데이터를 불러오기 위한 package_total_no 데이터 설정*/
		int package_total_no = 0;
		int package_total_no_list = dao.package_total_no();
		if(package_total_no <= package_total_no_list){
			package_total_no = package_total_no_list+1;
		}
		
		for (int i = 0; i < term; i++) {
			 /* 실제 DB안에 날짜가 들어갈 변수 선언 */
			String ch_start_day = "";
			String ch_end_day = "";
			try {
				ch_start_day = addDate(start_day,i); //캘린더를 사용하여 날짜 계산 addDate()사용
				ch_end_day = addDate(end_day,i); //캘린더를 사용하여 날짜 계산 addDate()사용
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			/* package_no를 만들기 위한 작업 (출발날짜 + 국적 + 000) */
			long package_no = Long.parseLong(start_date+i+sellcate+"001");
			System.out.println("java에서 받음 pak_no :"+package_no);
			long package_no_list = dao.package_no(ch_start_day);
			
			/* package_no()를 사용하여 DB안에 package_no 값을 얻어 존재 하였을때 다음 숫자를 얻기 위한 if */
			 if(package_no <= package_no_list){
				 System.out.println("비교");
				 package_no = package_no_list+1;
		      }
			
			
			 
		packagelistDTO dto = new packagelistDTO();		
		dto.setProduct_subject(multi.getParameter("product_subject"));
		dto.setPackage_no(String.valueOf(package_no));
		dto.setPackage_img_src(multi.getOriginalFileName("package_img_src"));
		dto.setPackage_realimg_src(multi.getFilesystemName("package_img_src"));
		dto.setProduct_info(multi.getParameter("product_info"));
		dto.setProduct_simple_info(multi.getParameter("product_simple_info"));
		dto.setAvailability_start_date(ch_start_day);
		dto.setAvailability_end_date(ch_end_day);
			dto.setNow_reservation_no(0); //현재 예약자 수
		dto.setMin_start_no(Integer.parseInt(multi.getParameter("min_start_no")));
			dto.setReservation_no(0); // 최대 예약자 수
		dto.setAirplane_no(multi.getParameter("airplane_no"));
		dto.setPackage_price_Adult(Integer.parseInt(multi.getParameter("package_price_Adult")));
		dto.setPackage_price_child(Integer.parseInt(multi.getParameter("package_price_child")));
		dto.setPackage_price_baby(Integer.parseInt(multi.getParameter("package_price_baby")));
		dto.setTravel_agency_no(Integer.parseInt(multi.getParameter("travel_agency_no"))); //여행사 고유번호
		dto.setPackageterm(term);
		dto.setSelldate(new Timestamp(System.currentTimeMillis()));
		dto.setTravel_period(travel_period+1);
		dto.setPackage_total_no(package_total_no);
		
		dao.sellboardinsert(dto);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("main/index.jsp");
		
		return forward;
	}
	
	private static String addDate(String dt, int d) throws Exception  {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 
        Calendar cal = Calendar.getInstance();
        Date date = format.parse(dt);
        cal.setTime(date);
        cal.add(Calendar.DATE, d);     
 
        return format.format(cal.getTime());
 
    }
}
