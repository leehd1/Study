package com.db.mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.board.packboardDB.packspboardDTO;
import com.sellboard.DB.packagelistDTO;
import com.travelpackage.BoardPagingVO;

public class PackageDAO {

    // DB연결에 사용되는 자원
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource pool;
    private Connection con;
    
    // cp에서 connection 객체를 얻는 메서드 
    public Connection connection() {
        try {
            Context context = new InitialContext();
            pool = (DataSource) context.lookup("java:comp/env/jdbc/jspbeginner");
            con = pool.getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
	
    // 사용한 자원 반납 메서드
    public void disConnection() {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
    // 패키지의 정보를 받아오는 메서드
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public HashMap getPackageInfo(String packageNo) {
        
        String sql = "SELECT * FROM packagelist p JOIN travel_agency t ON p.travel_agency_no = t.travel_agency_no "
                   + " WHERE package_no=?";
        
        HashMap map = new HashMap();
        PackageVO packageVO = new PackageVO();
        AgencyVO agencyVO = new AgencyVO();
        GuideVO guideVO = new GuideVO();
        
        try {
            pstmt = connection().prepareStatement(sql);
            pstmt.setString(1, packageNo);
            rs = pstmt.executeQuery();
            
            rs.next();
            
            packageVO.setPackage_no(rs.getString("package_no"));
            //packageVO.setProduct_special_feature(rs.getString("product_special_feature"));
            //packageVO.setGuide_no(rs.getString("guide_no"));
            packageVO.setTravel_agency_no(rs.getInt("travel_agency_no"));
            packageVO.setProduct_subject(rs.getString("product_subject"));
            packageVO.setProduct_simple_info(rs.getString("product_simple_info"));
            packageVO.setProduct_info(new String(rs.getBytes("product_info")));
            packageVO.setPackage_img_src(rs.getString("package_img_src"));
            packageVO.setAirplane_no(rs.getString("airplane_no"));
            packageVO.setReservation_no(rs.getInt("reservation_no"));
            packageVO.setTravel_period(rs.getInt("travel_period"));
            packageVO.setMin_start_no(rs.getInt("min_start_no"));
            packageVO.setPackage_price_baby(rs.getInt("package_price_baby"));
            packageVO.setPackage_price_child(rs.getInt("package_price_child"));
            packageVO.setPackage_price_adult(rs.getInt("package_price_adult"));
            packageVO.setAvailability_start_date(rs.getString("availability_start_date"));
            packageVO.setAvailability_end_date(rs.getString("availability_end_date"));
            packageVO.setPackage_total_no(rs.getInt("package_total_no"));
            agencyVO.setTravel_agency_no(rs.getString("travel_agency_no"));
            agencyVO.setTravel_agency_name(rs.getString("travel_agency_name"));
            agencyVO.setTravel_agency_phone_number(rs.getString("travel_agency_phone_number"));
            agencyVO.setTravel_agency_fax_number(rs.getString("travel_agency_fax_number"));
            agencyVO.setTravel_agency_email(rs.getString("travel_agency_email"));
            agencyVO.setTravel_agency_consulting_time(rs.getString("travel_agency_consulting_time"));
           // guideVO.setGuide_no(rs.getString("guide_no"));
//            guideVO.setTravel_agency_no(rs.getString("travel_agency_no"));
//            guideVO.setGuide_name(rs.getString("guide_name"));
//            guideVO.setGuide_career(rs.getString("guide_career"));
//            guideVO.setGuide_apecialty(rs.getString("guide_apecialty"));
//            guideVO.setGuide_area(rs.getString("guide_area"));
            
            map.put("packageVO", packageVO);
            map.put("agencyVO", agencyVO);
            //map.put("guideVO", guideVO);
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageInfo : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
        
        return map;
    }
    
    // 동일한 패키지의 리스트들을 받아오는 메서드
    public ArrayList<PackageVO> getSamePackageInfo(int package_Total_No) {

        String sql = "SELECT * FROM packagelist WHERE package_total_no=? ORDER BY availability_start_date ASC";

        ArrayList<PackageVO> list = new ArrayList<>();
        
        try {
            pstmt = connection().prepareStatement(sql);
            pstmt.setInt(1, package_Total_No);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {

                PackageVO packageVO = new PackageVO();

                packageVO.setPackage_no(rs.getString("package_no"));
                packageVO.setAvailability_start_date(rs.getString("availability_start_date"));
                packageVO.setAvailability_end_date(rs.getString("availability_end_date"));
                packageVO.setTravel_period(rs.getInt("travel_period"));
                packageVO.setPackage_price_baby(rs.getInt("package_price_baby"));
                packageVO.setPackage_price_child(rs.getInt("package_price_child"));
                packageVO.setPackage_price_adult(rs.getInt("package_price_adult"));
                packageVO.setAirplane_no(rs.getString("airplane_no"));
                
                list.add(packageVO);
                
            }
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getSamePackageInfo : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
        
        return list;
    }
    
    // 날짜를 기준으로 동일한 패키지의 리스트들을 받아오는 메서드
    public ArrayList<PackageVO> getSamePackageInfo(int package_Total_No, String packDate) {

        String sql = "SELECT * FROM packagelist WHERE package_total_no=? AND availability_start_date >= STR_TO_DATE(?, '%m/%d/%Y') ORDER BY availability_start_date ASC";
        
        ArrayList<PackageVO> list = new ArrayList<>();
        
        try {
            pstmt = connection().prepareStatement(sql);
            pstmt.setInt(1, package_Total_No);
            pstmt.setString(2, packDate);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {

                PackageVO packageVO = new PackageVO();

                packageVO.setPackage_no(rs.getString("package_no"));
                packageVO.setAvailability_start_date(rs.getString("availability_start_date"));
                packageVO.setAvailability_end_date(rs.getString("availability_end_date"));
                packageVO.setTravel_period(rs.getInt("travel_period"));
                packageVO.setPackage_price_baby(rs.getInt("package_price_baby"));
                packageVO.setPackage_price_child(rs.getInt("package_price_child"));
                packageVO.setPackage_price_adult(rs.getInt("package_price_adult"));
                packageVO.setAirplane_no(rs.getString("airplane_no"));
                
                list.add(packageVO);
                
            }
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getSamePackageInfo : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
        
        return list;
    }
    
    // 패키지들의 리스트를 받아오는 메서드
    public ArrayList<PackageVO> getPackageList(BoardPagingVO pagingVO) {
        
        String sql = "SELECT * FROM packagelist GROUP BY package_total_no ORDER BY availability_start_date DESC LIMIT ?, ?";
        
        ArrayList<PackageVO> list = new ArrayList<>();
         
        try {
            
            pstmt = connection().prepareStatement(sql);
            pstmt.setInt(1, pagingVO.getStartRecord());
            pstmt.setInt(2, pagingVO.getRecordPerPage());
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                
                PackageVO packageVO = new PackageVO();
                
                packageVO.setPackage_no(rs.getString("package_no"));
                packageVO.setPackage_total_no(rs.getInt("package_total_no"));
                //packageVO.setProduct_special_feature(rs.getString("product_special_feature"));
                //packageVO.setGuide_no(rs.getString("guide_no"));
                packageVO.setTravel_agency_no(rs.getInt("travel_agency_no"));
                packageVO.setProduct_subject(rs.getString("product_subject"));
                packageVO.setProduct_simple_info(rs.getString("product_simple_info"));
                packageVO.setProduct_info(new String(rs.getBytes("product_info")));
                packageVO.setPackage_img_src(rs.getString("package_img_src"));
                packageVO.setAirplane_no(rs.getString("airplane_no"));
                packageVO.setReservation_no(rs.getInt("reservation_no"));
                packageVO.setTravel_period(rs.getInt("travel_period"));
                packageVO.setNow_reservation_no(rs.getInt("now_reservation_no"));
                packageVO.setMin_start_no(rs.getInt("min_start_no"));
                packageVO.setPackage_price_baby(rs.getInt("package_price_baby"));
                packageVO.setPackage_price_child(rs.getInt("package_price_child"));
                packageVO.setPackage_price_adult(rs.getInt("package_price_Adult"));
                packageVO.setAvailability_start_date(rs.getString("availability_start_date"));
                packageVO.setAvailability_end_date(rs.getString("availability_end_date"));
                packageVO.setPackageterm(rs.getInt("packageterm"));
                
                list.add(packageVO);
            }
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageList : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
        
        return list;
    }

    // 패키지의 개수를 얻는 메서드
    public int getPackageListCount() {

        String sql = "SELECT COUNT(A.package_no) count FROM (SELECT * FROM packagelist GROUP BY package_total_no) AS A";
        
        int count = 0;
        
        try {
            pstmt = connection().prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            rs.next();
            
            count = rs.getInt("count");
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageListCount : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
            
        return count;
    }
    
    // 검색한 패키지의 개수를 얻는 양식 SQL로 변환해주는 메서드
    public String sqlSearchCountFormatter(String sql) {
        
        int firstCut = sql.indexOf("WHERE");
        int lastCut = sql.lastIndexOf(')');
        
        sql = "SELECT COUNT(A.package_no) count FROM (SELECT * FROM packagelist " + sql.substring(firstCut, lastCut) + ") GROUP BY package_total_no) AS A ";
        
        return sql;
    }
    
    // 검색한 패키지의 개수를 얻는 메서드
    public int getPackageSearchListCount(String firstCategory, String secondCategory, String searchValue) {
        
        String sql = sqlSearchCountFormatter(sqlSearchFormatter(firstCategory, secondCategory, searchValue));
            
        int count = 0;
        
        try {
            pstmt = connection().prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            rs.next();
            
            count = rs.getInt("count");
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageListCount : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
            
        return count;
        
    }

    // 검색 값을 SQL양식으로 변환해주는 메서드
    private String sqlSearchFormatter(String firstCategory, String secondCategory, String searchValue) {
        
        searchValue = searchValue.replaceAll("!\"#$%&'()*+,-./:;<=>?@[]^_`{]+$", "");
        
        String sql = "SELECT * FROM packagelist WHERE ";
        
        if (firstCategory.equals("period")) {
            
            switch(secondCategory) {
                case "all": sql += "travel_period IS NOT NULL";
                    break;
                case "lt3": sql += "travel_period <= 3";
                    break;
                case "4to5": sql += "travel_period BETWEEN 4 AND 5";
                    break;
                case "6to7": sql += "travel_period BETWEEN 6 AND 7";
                    break;
                case "8to15": sql += "travel_period BETWEEN 8 AND 15";
                    break;
                case "gt15": sql += "travel_period >= 15";
                    break;
            }
            
            sql += " AND (product_subject LIKE '%" + searchValue + "%' OR product_info LIKE '%" + searchValue + "%') ";
            
        } else if (firstCategory.equals("ect")) {
            
            switch(secondCategory) {
                case "all": sql += "product_subject LIKE '%" + searchValue + "%' OR product_info LIKE '%" + searchValue + "%' ";
                    break;
                case "sebject": sql += "product_subject LIKE '%" + searchValue + "%' ";
                    break;
                case "content": sql += "product_info LIKE '%" + searchValue + "%' ";
                    break;
            }
        }
        
        sql += " GROUP BY package_total_no ORDER BY availability_start_date DESC LIMIT ?, ?";
        
        return sql;
    }
    
    // 검색 메서드
    public ArrayList<PackageVO> getPackageSearch(BoardPagingVO pagingVO, String firstCategory, String secondCategory, String searchValue) {
        
        String sql = sqlSearchFormatter(firstCategory, secondCategory, searchValue);
        
        ArrayList<PackageVO> list = new ArrayList<>();
         
        try {
            
            pstmt = connection().prepareStatement(sql);
            pstmt.setInt(1, pagingVO.getStartRecord());
            pstmt.setInt(2, pagingVO.getRecordPerPage());
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                
                PackageVO packageVO = new PackageVO();
                
                packageVO.setPackage_no(rs.getString("package_no"));
                //packageVO.setProduct_special_feature(rs.getString("product_special_feature"));
                //packageVO.setGuide_no(rs.getString("guide_no"));
                packageVO.setTravel_agency_no(rs.getInt("travel_agency_no"));
                packageVO.setProduct_subject(rs.getString("product_subject"));
                packageVO.setProduct_simple_info(rs.getString("product_simple_info"));
                packageVO.setProduct_info(new String(rs.getBytes("product_info")));
                packageVO.setPackage_img_src(rs.getString("package_img_src"));
                packageVO.setAirplane_no(rs.getString("airplane_no"));
                packageVO.setReservation_no(rs.getInt("reservation_no"));
                packageVO.setTravel_period(rs.getInt("travel_period"));
                packageVO.setMin_start_no(rs.getInt("min_start_no"));
                packageVO.setPackage_price_baby(rs.getInt("package_price_baby"));
                packageVO.setPackage_price_child(rs.getInt("package_price_child"));
                packageVO.setPackage_price_adult(rs.getInt("package_price_Adult"));
                packageVO.setAvailability_start_date(rs.getString("availability_start_date"));
                packageVO.setAvailability_end_date(rs.getString("availability_end_date"));
                
                list.add(packageVO);
            }
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageList : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
        
        return list;
    }

	public List getairplanelist(String packageno) {
		List list = new ArrayList();
		packagelistDTO dto = null;
		String sql = "SELECT package_total_no FROM packagelist where package_no=?";
		try {
			pstmt = connection().prepareStatement(sql);
			pstmt.setString(1, packageno);
			
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt("package_total_no");
			sql = "SELECT * FROM packagelist where package_total_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			while(rs.next()){
				dto = new packagelistDTO();
				dto.setAvailability_start_date(rs.getString("availability_start_date"));
				dto.setAvailability_end_date(rs.getString("availability_end_date"));
				dto.setAirplane_no(rs.getString("airplane_no"));
				dto.setPackage_price_Adult(rs.getInt("package_price_Adult"));
				dto.setPackageterm(rs.getInt("packageterm"));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.getMessage();
		}finally {
            disConnection();
        }

		return list;
	}
	
	// 여행후기 게시판의 총 개수를 얻는 메서드
    public int getSpBoardListCount(String package_no) {

        String sql = "SELECT COUNT(*) count FROM packspboard WHERE sppackage=?";
        
        int count = 0;
        
        try {
            pstmt = connection().prepareStatement(sql);
            pstmt.setString(1, package_no);
            rs = pstmt.executeQuery();
            
            rs.next();
            
            count = rs.getInt("count");
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageListCount : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
            
        return count;
    }
	
    // 여행후기 게시판 목록 얻는 메서드
	public ArrayList<packspboardDTO> getSpBoardList(BoardPagingVO pagingVO, int package_total_no) {
	    
	    String sql = "SELECT * FROM packspboard WHERE sppackage=? ORDER BY date DESC LIMIT ?, ?";
	    
	    ArrayList<packspboardDTO> list = new ArrayList<packspboardDTO>();
	    
	    try {
            
	        pstmt = connection().prepareStatement(sql);
            pstmt.setInt(1, package_total_no);
            pstmt.setInt(2, pagingVO.getStartRecord());
            pstmt.setInt(3, pagingVO.getRecordPerPage());
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
                
                packspboardDTO packspboardDTO = new packspboardDTO();
                
                packspboardDTO.setDate(rs.getTimestamp("date"));
                packspboardDTO.setSpcate(rs.getString("spcate"));
                packspboardDTO.setSpcontent(rs.getString("spcontent"));
                packspboardDTO.setSpid(rs.getString("spid"));
                packspboardDTO.setSpno(rs.getInt("spno"));
                packspboardDTO.setStar(rs.getInt("spstar"));
                packspboardDTO.setSppackage(rs.getString("sppackage"));
                packspboardDTO.setSptitle(rs.getString("sptitle"));
                packspboardDTO.setSpcount(rs.getInt("spcount"));
                packspboardDTO.setSpsimple_content(rs.getString("spsimple_content"));
                
                list.add(packspboardDTO);
            }
	        
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getSpBoardList : error");
            e.getMessage();
        } finally {
            disConnection();
        }
	    
	    return list;
	}

	public int getTotalNO(String packageNo) {
		int totalNO = 0;
		String sql = "SELECT package_total_no FROM packagelist WHERE package_no=?";
		try {
			pstmt = connection().prepareStatement(sql);
			pstmt.setString(1, packageNo);
			rs = pstmt.executeQuery();
			rs.next();
			totalNO = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("[c]PackageDAO / [m]getTotalNO : error");
			e.getMessage();
		}finally {
            disConnection();
        }
		return totalNO;
	}
	
	public int getSpBoardListCount(int package_total_no) {

        String sql = "SELECT COUNT(*) count FROM packspboard WHERE sppackage=?";
        
        int count = 0;
        
        try {
            pstmt = connection().prepareStatement(sql);
            pstmt.setInt(1, package_total_no);
            rs = pstmt.executeQuery();
            
            rs.next();
            
            count = rs.getInt("count");
            
        } catch (Exception e) {
            System.out.println("[c]PackageDAO / [m]getPackageListCount : error");
            e.printStackTrace();
        } finally {
            disConnection();
        }
            
        return count;
    }
}